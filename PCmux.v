module PCmux (input pc, input lr, output final, input src)

	assign final =  (src == 1) ? pc : lr;

endmodule
