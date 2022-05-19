module decode2_4(IN, OUT, ENABLE) ;
	input [1:0] IN ;
	output reg [3:0] OUT ;
	input ENABLE ;
	always @ (IN)
	begin
		if(~ENABLE)
		begin
			case(IN)
				2'b00 : OUT = 4'b1110 ;
				2'b01 : OUT = 4'b1101 ;
				2'b10 : OUT = 4'b1011 ;
				2'b11 : OUT = 4'b0111 ;
			endcase
		end
		else OUT = 4'b1111 ;
	end
endmodule
