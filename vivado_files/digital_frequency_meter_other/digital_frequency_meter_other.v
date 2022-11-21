`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// blog: https://blog.csdn.net/Reborn_Lee
// Engineer: 李锐博恩
// Design Name: frequency detect
// Module Name: freDetect
// 
//////////////////////////////////////////////////////////////////////////////////

module freDetect(

    input wire clk_1Hz,            //1Hz基准频率，周期1s;
    input wire fin,                //输入待测信号
    input wire rst,                //复位信号
    output wire [3:0] d0,
    output wire [3:0] d1,
    output wire [3:0] d2,
    output wire [3:0] d3,
    output wire [3:0] d4,
    output wire [3:0] d5,
    output wire [3:0] d6,
    output wire [3:0] d7  

        );
        

    wire [3:0] q0, q1, q2, q3, q4, q5, q6, q7;   //中间数据  


    //控制模块实例  

        control control_inst(.clk_1Hz(clk_1Hz),
    .rst(rst),
    .count_en(count_en),  
        .latch_en(latch_en),
        .clear(clear)
        );  

        

    //计数器模块实例  

    counter_10 counter_inst0(.en_in(count_en),.clear(clear),.rst(rst),  

                        .fin(fin),.en_out(en_out0),.q(q0));  

    counter_10 counter_inst1(.en_in(en_out0),.clear(clear),.rst(rst),  

                        .fin(fin),.en_out(en_out1),.q(q1));  

    counter_10 counter_inst2(.en_in(en_out1),.clear(clear),.rst(rst),  

                        .fin(fin),.en_out(en_out2),.q(q2));  

    counter_10 counter_inst3(.en_in(en_out2),.clear(clear),.rst(rst),  

                        .fin(fin),.en_out(en_out3),.q(q3));  

    counter_10 counter_inst4(.en_in(en_out3),.clear(clear),.rst(rst),  

                        .fin(fin),.en_out(en_out4),.q(q4));  

    counter_10 counter_inst5(.en_in(en_out4),.clear(clear),.rst(rst),  

                        .fin(fin),.en_out(en_out5),.q(q5));  

    counter_10 counter_inst6(.en_in(en_out5),.clear(clear),.rst(rst),  

                        .fin(fin),.en_out(en_out6),.q(q6));  

    counter_10 counter_inst7(.en_in(en_out6),.clear(clear),.rst(rst),  

                        .fin(fin),.en_out(en_out7),.q(q7));  

        

    //锁存器模块实例  

    latch_freq latch_freq_inst(.clk_1Hz(clk_1Hz),.rst(rst),.latch_en(latch_en),  

                    .q0(q0),.q1(q1),.q2(q2),.q3(q3),.q4(q4),.q5(q5),  

                    .q6(q6),.q7(q7),.d0(d0),.d1(d1),.d2(d2),.d3(d3),  

                    .d4(d4),.d5(d5),.d6(d6),.d7(d7));  
endmodule

