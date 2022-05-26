// 1 to 8 DeMux
module today0526(inValue, x, LED) ;
	input [2:0] inValue ;
	input x ;
	output reg [7:0] LED ;
	
	always @ (inValue)
		begin
			case(inValue)
				3'b111 : LED = {x, 7'b0000000} ;
				3'b110 : LED = {1'b0, x, 6'b000000} ;	
				3'b101 : LED = {2'b00, x, 5'b00000} ;
				3'b100 : LED = {3'b000, x, 4'b0000} ;
				3'b011 : LED = {4'b0000, x, 3'b000} ;
				3'b010 : LED = {5'b00000, x, 2'b00} ;
				3'b001 : LED = {6'b000000, x, 1'b0} ;
				3'b000 : LED = {7'b0000000, x} ;
				default : LED = {8'b00000000} ;
			endcase
		end
endmodule