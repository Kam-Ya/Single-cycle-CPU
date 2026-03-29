module DM (input [0:7]inA , input [0:7]alu , input write, input clk, output [7:0]data);

	// to slow clk
	reg [19:0] slow = 20'b00000000000000000000;
	reg on = 1'b0;
	integer i;
	reg [7:0] mem [255:0];
	
	initial begin
		for (i =0; i < 256; i = i + 1) begin
			mem[i] = 8'b0;
		end
	end

	assign data = (write == 0 ) ? mem[inA] : clk;

	always@(negedge clk) begin
		if (on == 1'b1) begin
			if (write) begin
				mem[inA] <= alu;
			end
			on = 1'b0;
			slow = 20'b00000000000000000000;
		end
	end

// also to slow clock
	always @(posedge clk) begin
		if (on == 1'b0) begin
			slow = slow + 1'b1;
			if (slow[19] == 1) begin
				on = 1'b1;
			end
		end
	end

endmodule
