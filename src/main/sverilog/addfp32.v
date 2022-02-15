module subfp32(clk, enable, rst,  a, b, res);

   input  [31:0] a, b;
   output [31:0] res;
   input         clk, enable, rst;	

   addfp32 xyz(.clk(clk), .enable(enable), .rst(rst),  .a(a), .b(b^32'h80000000), .res(res));
endmodule

module addfp32(clk, enable, rst,  a, b, res);

   input  [31:0] a, b;
   output [31:0] res;
   input         clk, enable, rst;	

   wire [7:0]  expA;
   wire [23:0] sigA;

   assign expA = a[30:23];
   assign sigA = {1'b1, a[22:0]};

   wire [7:0]  expB;
   wire [23:0] sigB;

   assign expB = b[30:23];
   assign sigB = {1'b1, b[22:0]};

   reg [31:0] Big, Small;
   reg [7:0] expDiff;

   // stage 1 swap A, B
   always @(*) if (enable) begin
      if (expA>expB) begin   // A has larger exp
         Big = a;
         Small = b;
         expDiff = expA-expB;
      end 
      else if (expA==expB) begin
         if (sigA>=sigB) begin   // A has larger sig
            Big = a;
            Small = b;
            expDiff = expA-expB;
         end else begin
            Small = a;
            Big = b;
            expDiff = expB-expA;
         end
      end else begin
         Small = a;
         Big = b;
         expDiff = expB-expA;
      end
   end

   wire signBig; 
   wire [7:0] expBig;
   wire [23:0] sigBig;

   assign signBig = Big[31];
   assign expBig = Big[30:23];
   assign sigBig = (expBig!=0)?{1'b1,Big[22:0]}:0;

   wire signSmall; 
   wire [7:0] expSmall;
   wire [23:0] sigSmall;

   assign signSmall=Small[31];
   assign expSmall=Small[30:23];
   assign sigSmall=(expDiff[7:5]||(expSmall==0))?0:(expDiff[4]?{16'h0000,1'b1,Small[22:16]}:{1'b1,Small[22:0]});

   reg signSum_a0; 
   reg [7:0] expSum_a0;
   reg [23:0] sigBig_a0;
   reg [23:0] sigSmall_a0;
   reg [3:0] expDiff_a0;
   reg add_a0;

   // stage 2 align addend coarse part 1 
   always@(*) if (enable) begin
      signSum_a0=signBig;
      expSum_a0=expBig;
      sigBig_a0=sigBig;
      sigSmall_a0=sigSmall;
      expDiff_a0=expDiff[3:0];
      add_a0=signSmall==signBig;
   end

  reg signSum_a1; 
  reg [7:0] expSum_a1;
  reg [23:0] sigBig_a1;
  reg [23:0] sigSmall_a1;
  reg [1:0] expDiff_a1;
  reg add_a1;

   // stage 3 align addend fine part 2
   always @(*) if (enable) begin
      signSum_a1=signSum_a0;
      expSum_a1=expSum_a0;
      sigBig_a1=sigBig_a0;
      expDiff_a1=expDiff_a0;
      add_a1=add_a0;

      if (expDiff_a0[3:2]==2'b11) begin
         sigSmall_a1={12'h000,sigSmall_a0[23:12]};
      end else if (expDiff_a0[3:2]==2'b10) begin
         sigSmall_a1={8'h00,sigSmall_a0[23:8]};
      end else if (expDiff_a0[3:2]==2'b01) begin
         sigSmall_a1={4'h0,sigSmall_a0[23:4]};
      end else begin 
         sigSmall_a1=sigSmall_a0;
      end
   end

   reg signSum_a2; 
   reg [7:0] expSum_a2;
   reg [23:0] sigBig_a2;
   reg [23:0] sigSmall_a2;
   reg add_a2;

   // stage 4 align addend finest part 3
   always @(*) if (enable) begin
      signSum_a2=signSum_a1;
      expSum_a2=expSum_a1;
      sigBig_a2=sigBig_a1;
      add_a2=add_a1;

      if (expDiff_a1[1:0]==2'b11) begin
         sigSmall_a2={3'h0,sigSmall_a1[23:3]};
      end else if (expDiff_a1[1:0]==2'b10) begin
         sigSmall_a2={2'h0,sigSmall_a1[23:2]};
      end else if (expDiff_a1[1:0]==2'b01) begin
         sigSmall_a2={1'h0,sigSmall_a1[23:1]};
      end else begin 
         sigSmall_a2=sigSmall_a1;
      end
   end

   reg signSum_s0; 
   reg [8:0] expSum_s0;
   reg [24:0] sigSum_s0;
   reg of_s0;

   // stage 5 do addition/substraction
   always @(*) if (enable) begin
      signSum_s0 = signSum_a2;
      expSum_s0 = {1'b0,expSum_a2};
      of_s0 = (expSum_a2==8'hff)?1:0;

      if (add_a2) begin 
         sigSum_s0={1'b0,sigBig_a2}+{1'b0,sigSmall_a2};
      end else begin
         sigSum_s0={1'b0,sigBig_a2}-{1'b0,sigSmall_a2};
      end
   end


   reg signSum_n0; 
   reg [8:0] expSum_n0;
   reg [23:0] sigSum_n0;
   reg of_n0;

   // stage 6 renormalize after add
   always@(*) if (enable) begin
      signSum_n0=signSum_s0;
      if (sigSum_s0[24] && (!of_s0)) begin
         expSum_n0=expSum_s0+1;
         sigSum_n0=sigSum_s0[24:1];
         of_n0=(expSum_s0==9'h0fe);
      end else begin
         expSum_n0=expSum_s0;
         sigSum_n0=sigSum_s0[23:0];
         of_n0=of_s0;
      end
   end 

   reg signSum_n1; 
   reg [8:0] expSum_n1;
   reg [23:0] sigSum_n1;
   reg of_n1;

   // stage 7 renormalize after subtract coarse
   always@(*) if (enable) begin
      signSum_n1=signSum_n0;
      of_n1=of_n0;    

      if (sigSum_n0[23:16]==8'h00) begin
         expSum_n1=expSum_n0-8;
         sigSum_n1={sigSum_n0[16:0],8'h00};
      end else begin
         expSum_n1=expSum_n0;
         sigSum_n1=sigSum_n0;
      end
   end 

   reg signSum_n2; 
   reg [8:0] expSum_n2;
   reg [23:0] sigSum_n2;
   reg of_n2;

   // stage 8  
   always@(*) if (enable) begin
      signSum_n2=signSum_n1;
      of_n2=of_n1;

      if (sigSum_n1[23:16]==8'h00) begin
         expSum_n2=expSum_n1-8;
         sigSum_n2={sigSum_n1[16:0],8'h00};
      end else begin
         expSum_n2=expSum_n1;
         sigSum_n2=sigSum_n1;
      end
   end 

   reg signSum_n3; 
   reg [8:0] expSum_n3;
   reg [23:0] sigSum_n3;
   reg of_n3;

   // stage 9  
   always@(*) if (enable) begin
      signSum_n3=signSum_n2;
      of_n3=of_n2;

      if (sigSum_n2[23:20]==4'h0) begin
         expSum_n3=expSum_n2-4;
         sigSum_n3={sigSum_n2[20:0],4'h0};
      end else begin
         expSum_n3=expSum_n2;
         sigSum_n3=sigSum_n2;
      end
   end 

   reg signSum_n4; 
   reg [8:0] expSum_n4;
   reg [23:0] sigSum_n4;
   reg of_n4;

   // stage 10  
   always@(*) if (enable) begin
      signSum_n4=signSum_n3;
      of_n4=of_n3;

      if (sigSum_n3[23:20]==4'h0) begin
         expSum_n4=expSum_n3-4;
         sigSum_n4={sigSum_n3[20:0],4'h0};
      end else if (sigSum_n3[23:21]==3'b000) begin
         expSum_n4=expSum_n3-3;
         sigSum_n4={sigSum_n3[21:0],3'h0};
      end else if (sigSum_n3[23:22]==2'b00) begin
         expSum_n4=expSum_n3-2;
         sigSum_n4={sigSum_n3[22:0],2'h0};
      end else if (sigSum_n3[23]==1'b0) begin
         expSum_n4=expSum_n3-1;
         sigSum_n4={sigSum_n3[22:0],1'h0};
      end else begin
         expSum_n4=expSum_n3;
         sigSum_n4=sigSum_n3;
      end
   end 

   reg signSum_f0; 
   reg [7:0] expSum_f0;
   reg [23:0] sigSum_f0;

   // stage 11 clean-up
   always@(*) if (enable) begin
      signSum_f0=signSum_n4;

      if (of_n4) begin 
         expSum_f0=8'hff;
         sigSum_f0=0;
      end else if (expSum_n4[8]||(expSum_n4==0)||(sigSum_n4==0)) begin
         expSum_f0=8'h00;
         sigSum_f0=0;
      end else begin
         expSum_f0=expSum_n4[7:0];
         sigSum_f0=sigSum_n4;
      end
   end  

  assign res={signSum_f0, expSum_f0, sigSum_f0[22:0]};

endmodule
