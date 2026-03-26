module ALU (input Op[0:3], input inA[0:16], input inB[0:16], output out[0:16])

	case (Op) 
		4'b0000: ;
		4'b0001: out <= inA + inB;
		4'b0010:  out <= inA - inB;
		4'b0011: out <= !(inA & inB);
		4'b0100:out <= inA << inB; // should make a destination bit thing 
		4'b0101: out <= inA >> inB;
		4'b0110: // tf is OUT
		4'b0111: // tf is IN
		4'b1000: out <= inB; // also need a destination here
		4'b1001: ; // branch instruction so NOP in ALU, same for next few
		4'b1010:;
		4'b1011:;
		4'b1100:;
		4'b1101: out <= inA;
		4'b1110: out <= inA;
		4'b1111: out <= inA;
	endcase

endmodule
