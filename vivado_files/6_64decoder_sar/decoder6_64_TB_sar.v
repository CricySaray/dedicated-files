//-----------------------------------------------------------------------------
// Company: QUST
// Engineer: 宋安瑞
//
// Create Date: 2022年9月14日16:05:43
// Design Name: 6_64decoder
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
module decoder6_64_tb_sar;


//Internal signals declarations:
reg [0:5]in;
wire [0:63]out;

reg clk;

// Unit Under Test port map
	decoder6_64_sar UUT (
		.in(in),
		.out(out));

//initial
//	$monitor($realtime,,"ps %h %h ",in,out);
initial
	begin 
		clk=0;
		in=6'b000000;
	end

always #25 clk=~clk; 
	
always @(posedge clk)
	begin
		if (in==6'b111111) 
			in=6'b000000;
		else
			in=in+1;
	end
		
		
endmodule
