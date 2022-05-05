module full_adder(in1, in2, Cin, Sum, Cout) ;
	input in1, in2, Cin ;
	output Sum, Cout ;
	wire sum1, cout1, cout2 ;
	half_adder ha1(in1, in2, sum1, cout1) ;
	half_adder ha2(sum1, Cin, Sum, cout2) ;
	assign Cout = cout1 || cout2 ;
endmodule