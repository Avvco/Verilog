// ripple_carry_4_bit_adder
module four_bit_adder(in1, in2, C0, Sum, C4) ;
	input C0 ;
	input[3:0] in1, in2 ;
	output C4 ;
	output [3:0] Sum ;
	wire c1, c2, c3 ;
	full_adder f1(in1[0], in2[0], C0, Sum[0], c1) ;
	full_adder f2(in1[1], in2[1], c1, Sum[1], c2) ;
	full_adder f3(in1[2], in2[2], c2, Sum[2], c3) ;
	full_adder f4(in1[3], in2[3], c3, Sum[3], C4) ;
endmodule
