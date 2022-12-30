`timescale 1ns/1ps
module stimulus;
    reg clk;
    reg rst_n;
    reg en;
    wire [7:0] hour;
    wire [7:0] min;
    wire [7:0] sec;

    initial begin
        clk = 1'b0;
        rst_n = 1'b0;
        en = 1'b0;
    end

    always
        #5 clk = ~clk;

    initial begin
        #8 rst_n = 1'b1;
        #7 en = 1'b1;

    end
    
    digital_clock_counter_sar eg4(clk, rst_n, en, hour, min, sec);

endmodule