module IM(input counter [0:7], output instruction[0:7])

	reg [7:0] mem[255:0];

	// not sure if there is a better way to do this, just gonna hard code
	// it
	

	assign instruction <= mem[counter];
	

endmodule
