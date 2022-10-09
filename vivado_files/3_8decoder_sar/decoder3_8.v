//-----------------------------------------------------------------------------
// Company: QUST
// Engineer: 宋安瑞
//
// Create Date: 2022年9月10日09:06:06
// Design Name: 3_8decoder
// Module Name: design file
// Target Device: any
// Tool versions: any
// Description:
// 				
// Dependencies: 
// 				
// Revision:
// 				
// Additional Comments:
// 
//-----------------------------------------------------------------------------

`timescale 1ns/1ns

module decoder3_8_sar(in, out);
	input [0:2] in;
	output [0:7] out;
	reg [0:7] out;

	always @(in) 
		begin 
			case (in)
				3'b000 : out=8'b00000001;
				3'b001 : out=8'b00000010;
				3'b010 : out=8'b00000100;
				3'b011 : out=8'b00001000;
				3'b100 : out=8'b00010000;
				3'b101 : out=8'b00100000;
				3'b110 : out=8'b01000000;
				3'b111 : out=8'b10000000;
				default: out=8'b00000000;
			endcase
		end
endmodule 
		