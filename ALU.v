module ALU (input Op[0:3], input inA[0:16], input inB[0:16], output out[0:16])
	
	assign out <= (op == 4'b0000) ? :
			(op == 4'b0001) ? inA + inb) :
			(op == 4'b0010) ? inA - inB :
			(op == 4'b0011) ? !(inA & inB) :
			(op == 4'b0100) ? inA << inB :
			(op == 4'b0101) ? inA >> inB :
			(op == 4'b0110) ? : // out 
			(op == 4'b0111) ? : // in, skipping next few cause branch 
			(op == 4'b1000) ? inB :
			(op == 4'b1101) ? inA :
			(op == 4'b1110) ? inA :
			(op == 4'b1111) ? inA :

endmodule
