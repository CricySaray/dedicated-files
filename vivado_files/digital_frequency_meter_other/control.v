`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// blog: https://blog.csdn.net/Reborn_Lee
// Engineer: 李锐博恩
// Design Name: frequency detect
// Module Name: control
// 
//////////////////////////////////////////////////////////////////////////////////


module control(
    input wire clk_1Hz,
    input wire rst,
    output reg count_en,
    output reg latch_en,
    output reg clear

        );
        
    
    reg[1:0] state; //状态信号，用于控制各种使能信号  

    
    always @(posedge clk_1Hz or posedge rst)  
    
    if(rst)   //复位信号有效  
    
        begin    //各种使能信号清零  
    
        state <= 2'd0;  
        count_en <= 1'b0;  
    
        latch_en <=1'b0;  
        clear <= 1'b0;  
    
        end  
    
        else    //遇到基准信号的下一个上升沿，状态变化一次，每次变化后状态持续1s  
    
        begin  
    
        case(state)  
    
                2'd0:   
                begin //第一个上升沿到达，开始计数，计数1个基准信号周期内待测信号的上升沿个数，此个数即为待测信号的频率  
                count_en <= 1'b1;  //计数使能信号有效  
    
                latch_en <=1'b0;  
                clear <= 1'b0;  
    
                state <= 2'd1;  
            end  
            2'd1:  
    
            begin //第二个上升沿到达，计数完成，锁存使能信号有效，测得频率锁存至锁存器中  
    
                count_en <= 1'b0;  
                latch_en <=1'b1;  
    
                clear <= 1'b0;  
                state <= 2'd2;  
    
            end  
    
            2'd2:   
            begin //第三个上升沿到达，清零使能信号有效，计数器清零，为下一次计数做准备  
                count_en <= 1'b0;  
    
                latch_en <=1'b0;  
                clear <= 1'b1;  
    
                state <= 2'd0; //状态清零，进入下一次测量  
            end  
            default:  
            begin  
                count_en <= 1'b0;  
    
                latch_en <=1'b0;  
                clear <= 1'b0;  
    
                state <= 2'd0;  
            end  
                
        endcase  
                
        end      
endmodule