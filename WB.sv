module WB (input memData, input ALUResult, input memToReg, output data, output write);

	assign data = (memToReg == 1) ? memData : ALUResult; // write memory data

	assign write = 1;

endmodule
