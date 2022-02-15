module mantissaAdj(clk, reset, invals_rdy, valid_out, mants, vect, inExp, done, outExp);

	parameter					V=8, P=4, BIT=32, FPM=23, BFPM=4;
	localparam					EXP=BIT-FPM-1;//-1 since we exclude sign bit

    input							clk, reset, invals_rdy;
    input [P-1:0][BIT-1:0]			vect;
    input [EXP-1:0]				inExp;
    output logic					valid_out, done;
    output logic [P-1:0][BFPM+1:0]	mants;//mantissas include invisible 1 and sign bit
    output logic [EXP-1:0]		outExp;
    
    logic [P-1:0][FPM:0]		realMantsIn, shiftedMants;//mantissas including invisible 1
    logic [P-1:0][FPM+1:0]		signedMants;//signed mantissas
    logic [V-1:0] 				index;
    logic [$clog2(V):0]			fifoCNT;
    
        integer i, j, k;
    
        always_ff @(posedge clk) begin
            if(reset) begin
                valid_out<=0;
                //index<=0;
                done<=0;
                outExp<=0;
                fifoCNT<=0;
                for(i=0;i<P;i=i+1)
                    mants[i]<=0;
            end else begin
                if(invals_rdy) begin
                    if(fifoCNT==V) begin
                        fifoCNT<=0;
                        //index<=0;
                        valid_out<=0;
                        done<=1;//indicate to next module when finished
                    end else begin//output P values at a time
                        done<=0;
                        //index<=index+P;
                        fifoCNT<=fifoCNT+P;
                        valid_out<=1;
                        outExp<=inExp;
                        for(i=0;i<P;i=i+1)//truncate bits that don't fit into new mantissa size
                            mants[i]<=signedMants[i][FPM+1:FPM-BFPM];//includes sign bit
                    end
                end
            end
        end
    
        always_comb begin
            for(k=0;k<P;k=k+1)//extend with the invisible 1
                realMantsIn[k]={1'b1,vect[k][FPM-1:0]};
            for(j=0;j<P;j=j+1)//right shift mantissas by largest Exp - Exp of operand
                shiftedMants[j]=(realMantsIn[j] >> (inExp-vect[j][BIT-2:FPM]));
            for(j=0;j<P;j=j+1)//2's complement mantissa depending on sign, and extend with sign bit
                if(vect[j][BIT-1]==1)//need to add a bit when incorporating sign, to get desired represented range
                    signedMants[j]={1'b1,(~shiftedMants[j])+1'b1};
                else
                    signedMants[j]={1'b0,shiftedMants[j]};
        end
    
    endmodule





