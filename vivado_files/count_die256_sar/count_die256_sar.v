module count_sar(clk, rst_n, en, cnt);
    input clk, rst_n, en;
    output [7:0] cnt;
    reg [7:0] cnt;

    always @(posedge clk, negedge rst_n)
    begin
        if (!rst_n) cnt <= 8'b0;
        else if (en) cnt <= cnt + 1'b1;
    end
endmodule




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