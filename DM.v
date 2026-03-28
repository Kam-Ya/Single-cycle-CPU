module DM (input inA [0:7], input alu [0:7], input write, input clk, output data[7:0])

	// to slow clk
	reg [19:0] slow = 20'b00000000000000000000;
	reg on = 1'b0;
	
	reg [7:0] mem [255:0] = '{default: '0};

	assign data = (write == 0 ) ? mem[inA];

	always@(negedge clk) begin
		if (on == 1'b1) begin
			if (write)
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
