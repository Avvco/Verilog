module today0512(inputD, CLK, pre, LED) ; // ringCounter
	input pre ;
	input CLK ;
	input [3:0] inputD ;
	output [3:0] LED ;
	reg [3:0] temp ;
	wire [3:0] Q ;
	wire [3:0] _Q ;
	always @ (negedge CLK)
	begin
		temp = Q ;
		if(!pre) temp = inputD ;
	end
	D_FF D0(temp[3], Q[0], _Q[0], CLK) ;
	D_FF D1(temp[0], Q[1], _Q[1], CLK) ;
	D_FF D2(temp[1], Q[2], _Q[2], CLK) ;
	D_FF D3(temp[2], Q[3], _Q[3], CLK) ;
	assign LED = temp ;
endmodule
