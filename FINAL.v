module today0602(inputD, sw, outputQ, CLK) ; // counter
	input [2:0] inputD ;
	input sw, CLK ;
	output [6:0] outputQ ;
	wire d1q, d2q, d3q ;
	wire d1_q, d2_q, d3_q ;
	reg [2:0] t ;
	always @ (negedge CLK)
	begin
		t[0] = d3_q & d1_q ;
		t[1] = d2_q & d1_q ;
		t[2] = d3_q & d2_q & d1_q | d1q & d2q & d3q ;
		if(!sw) t = inputD ;
	end
	D_FF d1(t[0], d1q, d1_q,CLK) ;
	D_FF d2(t[1], d2q, d2_q,CLK) ;
	D_FF d3(t[2], d3q, d3_q, CLK) ;
	seven_segment_display({d3q, d2q, d1q}, outputQ) ;
endmodule

module D_FF(D, Q, _Q, CLK) ;
	input D, CLK ;
	output reg Q, _Q ;
	always @ (posedge CLK)
	begin
		Q <= D ;
		_Q <= !D ;
	end
endmodule


module seven_segment_display(value, outSeg) ;
	input [2:0] value ;
	output reg [6:0] outSeg ;
	always @(value)
	begin
		case(value)
			3'b000: outSeg = 7'b1000000 ; // 0
			3'b001: outSeg = 7'b1111001 ; // 1
			3'b010: outSeg = 7'b0100100 ; // 2
			3'b011: outSeg = 7'b0110000 ; // 3
			3'b100: outSeg = 7'b0011001 ; // 4
			3'b101: outSeg = 7'b0010010 ; // 5
			3'b110: outSeg = 7'b0000010 ; // 6
			3'b111: outSeg = 7'b1111000 ; // 7
		endcase
	end
endmodule
