module stimulus;
    reg clk;
    reg rst_n;
    reg load;
    reg [5:0] din;
    wire dout;

    signal_maker_sar eg1(
        clk,
        rst_n,
        load,
        din,
        dout    
    );

    initial begin
        clk = 1'b0;
        rst_n = 1'b0;
        load = 1'b0;
        din = 6'b100111;

    end

    always begin
        #1 clk = ~clk;
    end

    initial begin
        #4 rst_n = 1'b1;
        #14 load = 1'b1;
        #2 load = 1'b0;
        #24 $finish;
    end
endmodule