module RF(input [1:0]Rb , input [3:2]Ra, input [7:0]write, output [7:0]outA, output [7:0]outB , input clk, input regWrite);

	reg [7:0] register[3:0];
	integer i;
	initial begin
		for (i = 0; i < 4; i = i + 1) begin
			register[i] = 8'b0;
		end
	end

	// to slow down clock
	
	reg [19:0] slow = 20'b00000000000000000000;
	reg on = 1'b0;

	assign outA = (regWrite == 0) ? register[Ra] : regWrite;
	assign outB = (regWrite == 0) ? register[Rb] : regWrite;

	always @(posedge clk) begin
		if (on == 1'b1) begin
			if (regWrite) begin
				register[Ra] = write; 
			end
		end
	end

	// also to slow clock
	always @(negedge clk) begin
		if (on == 1'b0) begin
			slow = slow + 1'b1;
			if (slow[19] == 1) begin
				on = !on;
				slow = 20'b00000000000000000000;
			end
		end else begin
			on = !on;
		end
	end
	


endmodule
