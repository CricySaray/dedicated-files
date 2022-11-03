
`timescale 1ps/1ps
module Cricy;
    reg CLK, RST_N;
    wire [9:0] CNT;
count_sar CON(CLK, RST_N, CNT);

    initial 
        CLK = 0;
    initial 
        RST_N  = 0;
    always 
        #1  CLK = ~CLK;
    
    initial begin
        repeat(3) @(negedge CLK);
        RST_N = 1'b1;
    end
endmodule