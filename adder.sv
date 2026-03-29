module adder (input[7:0] pc, output [7:0]more); // idk why I called it this

	assign more = pc + 2'b10;

endmodule
