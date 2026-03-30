module ALU (input [0:3]Op, input [0:7]inA, input [0:7]inB, output [0:16]out, output lights);
	
	assign out = (Op == 4'b0001) ? inA + inB  :
			(Op == 4'b0010) ? inA - inB : 
			(Op == 4'b0011) ? !(inA & inB) :  
			(Op == 4'b0100) ? inA << inB  :
			(Op == 4'b0101) ? inA >> inB : // skipping next few cause branch 
			(Op == 4'b1000) ? inB  :
			(Op == 4'b1101) ? inA  :
			(Op == 4'b1110) ? inA  :
			Op;  
			

	assign lights = (Op == 4'b0110) ? inA  :
			(Op == 4'b0111) ? inB : // wtf is in
				inB;
		
endmodule
