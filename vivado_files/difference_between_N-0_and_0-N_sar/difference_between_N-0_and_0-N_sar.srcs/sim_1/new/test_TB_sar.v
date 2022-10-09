`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/24 16:50:27
// Design Name: 
// Module Name: test_TB_sar
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_TB_sar(

    );
endmodule
module stimulus;  
            reg [4:0] A;  
            reg [0:4] B;  
            reg [4:0] data;  
            reg C;  
    initial  
      begin  
        #10 A=5'b11101;  
        #10 B=5'b11101;  
        #10 data=11100;  
        #10 A<=data;//test assignment of MSB & LSB  
        #10 B<=data;//test assignment of MSB & LSB  
        //#10 A<=A+2'b01;//test compare value  
        #10 C=A>B?1:0;  
        #10 C=A==B?1:0;  
        #10 B=B+2'b01;  
        #10 B=B+2'b01;  
        #10 A[4:0]=B[0:4];  //test assignment of MSB & LSB  
        #10 A=5'b1110x;//text variable x  
        #10 if(A==5'b11101) A=5'b11111;  
            else if(A==5'b11100) A=5'b00000;  
            else if(A==5'b1110x) A=5'b11100;  
        #10 if(B==5'b11110) B<=5'b00000;  
        end  
    endmodule  
   
endmoudle