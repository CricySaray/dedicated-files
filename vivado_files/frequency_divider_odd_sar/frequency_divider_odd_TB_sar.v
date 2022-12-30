`timescale 1ps/1ps
module stimulus;
    reg clk;
    reg rst_n;
    wire div;

    frequency_divider_odd_sar eg1(
        clk,
        rst_n,
        div
    );

    initial begin
        clk = 1'b0;
        rst_n = 1'b0;
    end
    always begin
        #1 clk = ~clk;
    end

    initial begin
        #4 rst_n = 1'b1;
        #50 $finish;
    end

endmodule