module Mux8to1(iClk, iSw, oData, oSelect, sw);
	input	iClk, sw;
	input [7:0] iSw;
	output oData;
	output [2:0] oSelect;
	
	wire nClk;
	// main
	FD(iClk, nClk, sw);
	mod8Counter(nClk, oSelect);
	MUX_81(iSw, oSelect, oData);

endmodule


module FD(iClk, oClk, sw);
	input iClk, sw;
	output reg oClk;
	integer count;
	parameter RATE = 50000000;
	
	initial
		count = 0;
	// frequency divider
	always@(negedge iClk)
	begin
		if (sw)
		begin
			if (count > RATE / 2)
				oClk = 1;
			else
				oClk = 0;
		end
		else
			oClk = 0;
		count = (count + 1) % RATE;
	end
	
endmodule

module mod8Counter(iClk, Q);
	input iClk;
	output [2:0] Q;
	
	// asynchrounous up counter by JK Flip-Flop mod 8
	JK_FF(iClk, Q[0], 1'b1, 1'b1);
	JK_FF(Q[0], Q[1], 1'b1, 1'b1);
	JK_FF(Q[1], Q[2], 1'b1, 1'b1);
	
endmodule

module JK_FF(iClk, Q, J, K);
	input	iClk, J, K;
	output reg Q;
	// JK Flip-Flop
	always@(negedge iClk)
	begin
		case({J, K})
			2'b00: Q = Q;
			2'b01: Q = 0;
			2'b10: Q = 1;
			2'b11: Q = ~Q;
		endcase
	end

endmodule

module MUX_81(iData, iSelect, oData);
	input [7:0] iData;
	input [2:0] iSelect;
	output reg oData;
	
	// MUX 8 to 1
	always@(iSelect)
	begin
		//check value and assign data
		case(iSelect)
			3'b000: oData = iData[0];
			3'b001: oData = iData[1];
			3'b010: oData = iData[2];
			3'b011: oData = iData[3];
			3'b100: oData = iData[4];
			3'b101: oData = iData[5];
			3'b110: oData = iData[6];
			3'b111: oData = iData[7];
			default: oData = 1'b0;
		endcase
	end
	
endmodule
