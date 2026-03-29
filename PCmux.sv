module PCmux (input pc, input lr, output fin, input src);

	assign fin =  (src == 1) ? pc : lr;

endmodule
