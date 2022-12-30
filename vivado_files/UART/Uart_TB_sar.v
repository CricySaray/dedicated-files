`timescale 1ns / 1ns
module UART_TB_sar;


//Internal signals declarations:
reg reset;
reg clk;
reg byte_ready;
reg [7:0]data;
wire txd;
wire rxd;
wire [7:0]data_out;



// Unit Under Test port map
	UART_sar UUT (
		.reset(reset),
		.clk(clk),
		.byte_ready(byte_ready),
		.data(data),
		.txd(txd),
		.rxd(rxd),
		.data_out(data_out));	
		
assign rxd=txd;		

initial
    begin
        clk=0;
        reset=0;
        byte_ready=0;
        data=8'b11011000;
        #40 byte_ready=1;
        #50 reset=1;
        #200 byte_ready=0;
    end

always #80 clk=~clk;
	
endmodule
