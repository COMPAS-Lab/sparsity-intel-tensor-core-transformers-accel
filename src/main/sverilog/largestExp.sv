module largestExp(clk, reset, invals, invals_rdy, valid_out, outvect, outExp, prevModDone);

	parameter					V=8, P=4, BIT=32, FPM=23;
	localparam					EXP=BIT-FPM-1;//-1 since we exclude sign bit
    localparam					DELAY=$clog2(P)/2;
	localparam					DONE=(V/P)+DELAY;
	localparam					LOAD_CLKS=V/P;

    input							clk, reset, invals_rdy, prevModDone;
    input [P-1:0][BIT-1:0]			invals;
    output logic [P-1:0][BIT-1:0]	outvect;
    output logic [EXP-1:0]			outExp;
    output logic					valid_out;
    
    logic [EXP-1:0]					currentLargest;
    logic [V-1:0] 					index;
    logic [P-1:0][EXP-1:0]			inExps;
    logic [P-1:0][EXP-1:0]			intermmediateExps;
    logic [V-1:0][BIT-1:0]			FIFOvect;
    logic [$clog2(V)-1:0]			fifoCNT;
    logic [$clog2(DONE):0]			cnt;
    logic							delay_for_exp_bias;//systems wait 1 cycle for exps to be biased


	integer i, j, k;

	//this function is used by generate block to determine which intermediate wires to use
	function int index_a(input int width);
		index_a=0;
		for(int x=width; x<P; x=x*2)
    		index_a = index_a + x;  
  	endfunction
	
	//generates a comparator tree depending on how many values arrive at a time
	genvar g;
	generate
		for (g=P; g>1; g=g/2) begin : compGenerator // <-- example block name	
			if(g==P) begin
	    		compLayer #(g, BIT, FPM) c0(.invals(inExps), 
	    			.outvals(intermmediateExps[index_a(g/2)-1:index_a(g)]));
	    	end else begin
	    		if($clog2(P/g)%2==1) begin
		    		compLayerFF #(g, BIT, FPM) c1ff(.clk(clk), .invals(intermmediateExps[index_a(g)-1:index_a(2*g)]), 
		    			.outvals(intermmediateExps[index_a(g/2)-1:index_a(g)]));//same point as P-2
		    	end else begin
		    		compLayer #(g, BIT, FPM) c1(.invals(intermmediateExps[index_a(g)-1:index_a(2*g)]), 
		    			.outvals(intermmediateExps[index_a(g/2)-1:index_a(g)]));//same point as P-2
		    	end
	    	end
		end 
	endgenerate
     
    always_ff @(posedge clk) begin
		if(reset) begin
			valid_out<=0;
			index<=0;
			outExp<=0;
			currentLargest<=0;
			fifoCNT<=0;
			cnt<=0;
			delay_for_exp_bias<=0;
			for(i=0;i<V;i=i+1)
				FIFOvect[i]<=0;
		end else begin
			if(invals_rdy && !delay_for_exp_bias)
				delay_for_exp_bias<=1'b1;
			if(delay_for_exp_bias || cnt!=0) begin
				if(cnt!=DONE-1) begin
					cnt<=cnt+1;
					index<=index+P;
					if(cnt<LOAD_CLKS) begin
						for(j=0;j<P;j=j+1) begin//inExps is available 1 clk later than other 2 parts
							FIFOvect[index+j][FPM-1:0]<=invals[j][FPM-1:0];//outputs a vector, P at a time
							FIFOvect[index+j][BIT-2:FPM]<=inExps[j];//although is only done after
							FIFOvect[index+j][BIT-1]<=invals[j][BIT-1];		//looking through all elements
						end
					end
					if(cnt>=DELAY)
						if(intermmediateExps[P-2]>outExp)//compare previous largest to the new largest
							outExp<=intermmediateExps[P-2];//last exp from comparison tree
				end else begin
					valid_out<=1;
					index<=0;
					cnt<=0;
					delay_for_exp_bias<=1'b0;
					if(intermmediateExps[P-2]>outExp)//compare previous largest to the new largest
						outExp<=intermmediateExps[P-2];
				end
			end

			for(k=0;k<P;k=k+1)
				inExps[k]<=invals[k][BIT-2: FPM]-(2**(EXP-1))+1;//subtracts bias of exponent, for 8bit exp, bias=(2^7)-1

			if(valid_out)
				fifoCNT<=fifoCNT+P;
		end
	end

	always_comb begin
		//for(k=0;k<P;k=k+1)
			//inExps[k]=invals[k][BIT-2: FPM]-(2**(EXP-1))+1;//subtracts bias of exponent, for 8bit exp, bias=(2^7)-1
		outvect=FIFOvect[(fifoCNT) +: P];
	end

endmodule

module compLayer(invals, outvals);//layer of comparators

	parameter							P=4, BIT=32, FPM=23;

	input [P-1:0][BIT-FPM-2:0]			invals;
	output logic [(P/2)-1:0][BIT-FPM-2:0]	outvals;
	integer i;

	always_comb begin
		for(i=0;i<P;i=i+2) begin
			if(invals[i]>invals[i+1])
				outvals[i/2]=invals[i];
			else
				outvals[i/2]=invals[i+1];
		end
	end

endmodule

module compLayerFF(clk, invals, outvals);//layer of comparators

	parameter							P=4, BIT=32, FPM=23;

	input								clk;
	input [P-1:0][BIT-FPM-2:0]			invals;
	output logic [(P/2)-1:0][BIT-FPM-2:0]	outvals;
	integer i;

	always_ff @(posedge clk) begin
		for(i=0;i<P;i=i+2) begin
			if(invals[i]>invals[i+1])
				outvals[i/2]<=invals[i];
			else
				outvals[i/2]<=invals[i+1];
		end
	end

endmodule




