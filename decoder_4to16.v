// decode4_16
module today0519(IN, LED, ALL) ;
	input ALL ;
	input [3:0] IN ;
	output [15:0] LED ;
	wire [3:0] temp ;
	
	//valid temp : 0 and 2
	decode2_4 d1({IN[3], 1'b0}, temp, ALL) ;
	
	decode3_8 d2(IN[2:0], LED[7:0], temp[0]) ;
	decode3_8 d3(IN[2:0], LED[15:8], temp[2]) ;
endmodule
