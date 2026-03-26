module IM(input counter [0:7], output instruction[0:7])

	reg mem[256][8];
	assign instruction <= mem[counter];
	

endmodule
