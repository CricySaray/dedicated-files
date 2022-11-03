`timescale 1ps/1ps
module stimulus;
    reg clk;
    reg rst_n;
    reg in;
    wire out;

    initial begin
        clk = 0;
        rst_n = 0;
        in = 0;
    end

    always
    #1 clk = ~clk;

    initial
    #3 rst_n = 1'b1;

    initial begin
        #3 in = 1'b1;
        #2 in = 1'b0;
        #2 in = 1'b1;
        #2 in = 1'b0;

        #2 in = 1'b1;
        #2 in = 1'b0;
        #2 in = 1'b0;
        #2 in = 1'b1;
        #2 in = 1'b0;

        #2 in = 1'b0;
        #2 in = 1'b1;
        #2 in = 1'b0;
        #2 in = 1'b1;
        #2 in = 1'b1;
        #2 in = 1'b0;

        #5 $finish;
    end

    mealy_seq_det_10010_sar eg1(
        .clk(clk),
        .rst_n(rst_n),
        .in(in),
        .out(out)
    );

endmodule