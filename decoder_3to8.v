module decode3_8(IN, LED, ENABLE) ;
	input [2:0] IN ;
	input ENABLE ;
	output reg [7:0] LED ;
	always @ (IN)
	begin
		if(~ENABLE)
		begin
			case(IN)
				3'b000 : LED = 8'b11111110 ;
				3'b001 : LED = 8'b11111101 ;
				3'b010 : LED = 8'b11111011 ;
				3'b011 : LED = 8'b11110111 ;
				3'b100 : LED = 8'b11101111 ;
				3'b101 : LED = 8'b11011111 ;
				3'b110 : LED = 8'b10111111 ;
				3'b111 : LED = 8'b01111111 ;
			endcase
		end
		else LED = 8'b11111111 ;
	end
endmodule
