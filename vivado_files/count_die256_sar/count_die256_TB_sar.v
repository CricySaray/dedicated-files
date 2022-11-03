

`timescale 1ps/1ps
module Cricy;
    reg CLK, RST_N, EN;
    wire [7:0] CNT;
count_sar CON(CLK, RST_N, EN, CNT);

    initial 
        CLK = 0;
    initial 
        RST_N  = 0;
    initial 
        EN = 1'b1;
    always 
        #5  CLK = ~CLK;
    
    initial begin
        repeat(3) @(negedge CLK);
        RST_N = 1'b1;
        repeat(270) @(negedge CLK);
        EN = 0;
    end
        
    initial begin
        #2760 
        $finish;

    end
endmodule