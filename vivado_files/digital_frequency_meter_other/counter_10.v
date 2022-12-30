`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// blog: https://blog.csdn.net/Reborn_Lee
// Engineer: 李锐博恩
// Design Name: frequency detect
// Module Name: counter_10
// 
//////////////////////////////////////////////////////////////////////////////////



module counter_10(

input wire en_in,       //输入使能信号    
input wire rst,         //复位信号    
input wire clear,       //清零信号    
input wire fin,         //待测信号    
output reg en_out,      //输出使能，用于控制下一个计数器的状态，当输出使能有效时，下一个模10计数器计数加1    
output reg [3:0] q      //计数器的输出，4位BCD码输出  

        );
        
        always@  (posedge  fin  or  posedge  rst)      //输入待测信号的上升沿作为敏感信号    
if(rst)  begin                          //复位信号有效，计数器输出清零    
                en_out  <=  1'b0;    
                q  <=  4'b0;    
        end    
        else  if(en_in)  begin                  //进位输入使能信号有效    
                if(q  ==  4'b1001)  begin            //若q  =  4'b1001的话，q清零，同时进位输出使能有效，即en_out  赋值为1'b1    
                        q  <=  4'b0;    
                        en_out  <=  1'b1;    
                end    
else  begin                        //若q未达到4'b1001时，每到达待测信号的一个上升沿，q加1，同时输出进位清零  
                        q  <=  q  +  1'b1;    
                        en_out  <=1'b0;    
                end    
        end    
        else  if(clear)  begin                //若清零信号有效，计数器清零，主要用于为下一次测量准备  
                q  <=  4'b0;    
                en_out  <=  1'b0;    
        end    
        else    begin    
        q  <=  q;    
        en_out  <=1'b0;    
        end      
        
        
endmodule