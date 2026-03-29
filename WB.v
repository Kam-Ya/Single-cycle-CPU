module WB (input memData, input ALUResult, input memToReg, output data, output write)

	assign data = (memToReg == 1) ? memData : ; // write memory data
			(memToReg == 0) ? ALUResult : ; // write result data 

	assign write = 1;

endmodule
