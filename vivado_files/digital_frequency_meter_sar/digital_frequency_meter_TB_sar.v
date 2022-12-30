`timescale 1ns/1ps

module digital_frequency_meter_sar_stimulus;
    //为了仿真方便，全部缩小数倍；
    parameter CLK1HZ_DELAY = 5_0000_0000;       //1 Hz signal
    parameter FIN_DELAY = 100;                  //5 MHz frequency detected
    reg clk_1Hz;
    reg fin;
    reg rst_n;
    wire [3:0] d0;
    wire [3:0] d1;
    wire [3:0] d2;
    wire [3:0] d3;
    wire [3:0] d4;
    wire [3:0] d5;
    wire [3:0] d6;
    wire [3:0] d7;

    initial begin
        rst_n = 1'b0;
        #1 rst_n = 1'b1;
    end
    initial begin
        fin = 1'b0;
        forever
            #FIN_DELAY fin = ~fin;
    end
    initial begin
        clk_1Hz = 1'b0;
        forever
        #CLK1HZ_DELAY clk_1Hz = ~clk_1Hz;
    end

    digital_frequency_meter_sar freDetect(
        .clk_1Hz(clk_1Hz),
        .rst_n(rst_n),
        .fin(fin),
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .d4(d4),
        .d5(d5),
        .d6(d6),
        .d7(d7)
    );

endmodule