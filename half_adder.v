module half_adder(in1, in2, Sum, Cout) ;
	input in1, in2 ;
	output Sum, Cout ;
	xor (Sum, in1, in2) ;
	and (Cout, in1, in2) ;
endmodule