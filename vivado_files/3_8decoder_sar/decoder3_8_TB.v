//-----------------------------------------------------------------------------
// Company: QUST
// Engineer: 宋安瑞
//
// Create Date: 2022年9月10日09:06:06
// Design Name: 3_8decoder
// Module Name: stimulus file
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

`timescale 1ns / 1ns
module decoder3_8_tb;


//Internal signals declarations:
reg [0:2]in;
wire [0:7]out;

reg clk;

// Unit Under Test port map
	decoder3_8_sar UUT (
		.in(in),
		.out(out));

//initial
//	$monitor($realtime,,"ps %h %h ",in,out);
initial
	begin 
		clk=0;
		in=8'b00000000;
	end

always #25 clk=~clk; 
	
always @(posedge clk)
	begin
		if (in==3'b111) 
			in=3'b000;
		else
			in=in+1;
	end
		
		
endmodule
