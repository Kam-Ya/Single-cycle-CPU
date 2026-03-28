module RF(input Rb [1:0], input Ra[3:2], input write[7:0], output outA[7:0], output outB [7:0], input clk, input regWrite)

	reg [7:0] register[3:0] = '{default: '0};

	// to slow down clock
	
	reg [19:0] slow = 20'b00000000000000000000;
	reg on = 1'b0;

	assign outA = (regWrite == 0) ? register[Ra] : ;
	assign outB = (regWrite == 0) ? register[Rb] : ;

	always @(posedge clk)
		if (on == 1'b1) begin
			if (regWrite) begin
				register[Ra] = write; 
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
