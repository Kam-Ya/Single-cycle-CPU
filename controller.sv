module controller (input op, input Z, input N, output LRWrite, output ALUop, output MemRW, output memToReg, output PCsrc);

assign ALUop = op;
assign LRWrite = (op == 4'b1001) ? 1'b1 : 
		(op == 4'b1010) ? 1'b1  :
		(op == 4'b1011) ? 1'b1 :
		(op == 4'b1100) ? 1'b1 :
		1'b0 ;

assign MemRW = (op == 4'b1110) ? 1'b1 :// load
		(op == 4'b1111) ? 1'b0 : // store
		1'b1;

assign memToReg = (op == 4'b1110) ? 1'b1 : 1'b0;

assign PCsrc = (Z == 1'b0) ?  1'b0 : 1'b1 ;// branch not taken = 0

endmodule
