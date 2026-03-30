module CPU(


        //////////// CLOCK /////////
        input                                   MAX10_CLK1_50,


			//////////// KEY //////////
        input                [1:0]              KEY,

        //////////// LED //////////
        output               [7:0]              LEDR, 

        //////////// SW //////////
        input                [9:0]              SW  //
);



// variables
wire [15:0]inst;
wire [0:8] counter;
wire Rb, Ra, op, regWrite, alusrc, aluop, memToReg, memRW;
wire memData, aluResult, writeData;
wire [0:8] counterSRC;
wire aluWrite, z, n, lrWrite;
wire pcSRC;

PC pc1(

	.source(counterSRC),
	.count(counter)
);

IM im1(
	
	.counter(counter),
	.instruction(inst)
);

RF rf1(

	.Rb(inst[1:0]),
	.Ra(inst[3:2]),
	.write(writeData),
	.outA(Ra),
	.outB(Rb),
	.clk(MAX10_CLK1_50),
	.regWrite(regWrite)

);

ALU alu1(

	.Op(op),
	.inA(Ra),
	.inB(Rb),
	.out(aluReslut),
	.lights(LEDR) // no clue about this

);

DM dm1(

	.inA(Ra),
	.alu(aluReslut),
	.write(aluWrite),
	.clk(MAX10_CLK1_50),
	.data(memData)

);

WB wb1(

	.memData(memData),
	.ALUResult(aluResult),
	.memToReg(memToReg),
	.data(writeData),
	.write(regWrite)

);

controller ctrl(

	.op(inst[7:4]),
	.Z(z),
	.N(n),
	.LRWrite(lrWrite),
	.ALUop(op),
	.MemRW(memRW),
	.memToReg(memToReg), 
	.PCsrc(pcSRC)

);


endmodule