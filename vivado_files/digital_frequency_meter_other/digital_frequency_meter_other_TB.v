


`timescale 1ns/1ps  

//测试模块  

module freDetect_tb;  

    //为了仿真方便，全部缩小100倍；
    parameter CLK_1HZ_DELAY = 1000_0000; //1Hz基准信号，对应周期为1s=1000_000_000ns

    parameter FIN_DELAY = 2;             //5MHz待测信号，对应周期为0.2*1000_000=200ns  

    reg clk_1Hz;  

    reg fin;  

    reg rst;  

        

    wire[3:0] d0, d1, d2, d3, d4, d5, d6, d7;  

        

    initial  

        begin  

        rst =1'b1;  

        #1 rst = 1'b0;  

        end  

        

    initial  

        begin  

        fin = 1'b0;  

        forever  

        # (FIN_DELAY/2) fin = ~fin;  

        end  

        

    initial  

        begin  

        clk_1Hz = 1'b0;  

        forever  

        # (CLK_1HZ_DELAY/2) clk_1Hz = ~clk_1Hz;  

        end  

        

        freDetect freDetect_inst(.clk_1Hz(clk_1Hz), .rst(rst), .fin(fin),  

        .d0(d0), .d1(d1), .d2(d2), .d3(d3), .d4(d4), .d5(d5), .d6(d6), .d7(d7));  

        

        

endmodule  