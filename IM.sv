module IM(input [0:7] counter , output [0:7] instruction);

	reg [7:0] mem[255:0];

	// not sure if there is a better way to do this, just gonna hard code
	// it
	

	assign instruction = mem[counter];
	

endmodule
