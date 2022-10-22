`timescale 1ps/1ps
module stimulus;
reg CLK, RST_N;
wire[3:0] CNT;

modular_9_substraction_counter_sar counter_sar(
    .clk(CLK),
    .rst_n(RST_N),
    .cnt(CNT)
);

initial
CLK = 0;
always
#1 CLK = ~CLK;

initial begin
    RST_N = 0;
    #6 RST_N = ~RST_N;
    #50 $finish;
end
endmodule
