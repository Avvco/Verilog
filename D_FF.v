module D_FF(D, Q, _Q, CLK) ;
	input D, CLK ;
	output reg Q, _Q ;
	always @ (posedge CLK)
	begin
		Q <= D ;
		_Q <= !D ;
	end
endmodule
