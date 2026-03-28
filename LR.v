module LR (input addr [0:7], output past[0:7])

	reg keep [0:7];

	if (addr) 
		keep <= addr;
	end else 
		if (keep)
			past <= keep;
			keep <= 8'b00000000;
		end
	end

endmodule
