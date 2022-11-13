`timescale 1ps/1ps
module stimulus;
    reg clk;
    reg rst_n;
    reg en;

    initial begin
        clk = 1'b0;
        rst_n = 1'b0;
        en = 1'b0;
    end

    always
        #1 clk = ~clk;

    initial begin
        #5 rst_n = 1'b1;
        #3 en = 1'b1;

    end

endmodule