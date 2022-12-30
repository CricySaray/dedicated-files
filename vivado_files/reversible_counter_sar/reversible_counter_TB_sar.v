`timescale 1ps/1ps

module stimulus;
    reg clk;
    reg rst_n;
    reg up_down;
    wire [3:0] cnt;

    reversible_counter_sar eg1(
        clk,
        rst_n,
        up_down,
        cnt
    );

    initial begin
        clk = 1'b0;
        rst_n = 1'b0;
        up_down = 1'b1;
    end

    always begin
        #1 clk = ~clk;
    end

    initial begin
        #4 rst_n = 1'b1;

        #40 rst_n = 1'b0;
        up_down = 1'b0;
        #2 rst_n = 1'b1;

        #46 up_down = 1'b1;
        #10 $finish;
    end

endmodule