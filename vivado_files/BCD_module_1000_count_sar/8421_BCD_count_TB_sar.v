`timescale 1ps/1ps
module stimulus;
    reg CLK, RST_N, EN;
    wire [11:0] CNT;

    initial begin
        CLK = 0;
        RST_N = 0;
        EN = 0;
    end
    always begin
        #1 CLK = ~CLK;
    end

    initial begin
        #4 RST_N = ~RST_N;
        #5 EN = ~EN;
        #2050 $finish;
    end
    
    BCD_module_1000_counter_sar eg_sar(.clk(CLK), .rst_n(RST_N), .en(EN), .cnt(CNT));
endmodule