`timescale 1ps/1ps
module stimulus;
    reg clk;
    reg rst_n;
    reg [1:0] mod;
    reg rightin;
    reg leftin;
    reg [15:0] pin;
    wire [15:0] dout;

    universal_shift_sar eg1(
        clk,
        rst_n,
        mod,
        rightin,
        leftin,
        pin,
        dout    
        );

    initial begin
        clk = 1'b0;
        rst_n = 1'b0;
        mod = 2'b10;
        rightin = 1'b0;
        leftin = 1'b0;
        pin = 16'hffff;

    end

    always begin
        #1 clk = ~clk;
    end

    initial begin
        #4 rst_n = 1'b1;
        #6 mod = 2'b00;
        #30 rightin = 1'b1;
        #8 mod = 2'b01;
        #30 rst_n = 1'b0;
        #6 $finish;
    end


endmodule