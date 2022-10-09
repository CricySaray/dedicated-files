//-----------------------------------------------------------------------------
// Company: QUST
// Engineer: 宋安瑞
//
// Create Date: 2022年9月10日00:23:32
// Design Name: ripple carry counter    脉动进位计数器
// Module Name: stimulus file
// Target Device: any
// Tool versions: any
// Description:
// <Description here>   
// Dependencies: 
// <Dependencies here>
// Revision:
// <Code_revision_information>
// Additional Comments:
// <Additional comments>
//-----------------------------------------------------------------------------


`timescale 1ns/1ns
module stimulus;

reg clk;
reg reset;
wire [3: 0] q;

//Reference a module instance that has already been designed
ripple_carry_counter_sar r1(q, clk, reset);

//The control drives the clock signal of the design block, and the clock cycle is 10 time units
initial
    clk = 1'b0;     //Set CLK to 0
always
    #5 clk = ~clk;      //Turn the 5 time unit clock over once

//Control drive design block RESET signal
initial begin
    reset = 1'b1;
    #15 reset = 1'b0;
    #180 reset = 1'b1;
    #10 reset = 1'b0;
    #20 $finish;    //Termination of the simulation

end

//Monitoring the output
initial
    $monitor($time, "Output q = %d", q);

endmodule