//-----------------------------------------------------------------------------
// Company: QUST
// Engineer: 宋安瑞
//
// Create Date: 2022年9月10日00:23:32
// Design Name: ripple carry counter    脉动进位计数器
// Module Name: design file
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

module ripple_carry_counter_sar (
    q, clk, reset
);
    output [3: 0] q;
    input clk, reset;

    //Generate four instances of T triggers, each with its own name
    T_FF tff0(q[0], clk, reset);
    T_FF tff1(q[1], q[0], reset);
    T_FF tff2(q[2], q[1], reset);
    T_FF tff3(q[3], q[2], reset);

endmodule

module T_FF(q, clk, reset);
    output q;
    input clk, reset;
    wire d;

    D_FF dff0(q, d, clk, reset);
    not n1(d, q);   //Non gate is a built-in source language part of Verilog language
endmodule

//D trigger with asynchronous reset
module D_FF (
    q, d, clk, reset
);
    output q;
    input d, clk, reset;
    reg q;

    //There can be many new constructs, regardless of the functionality of those constructs, just how are design blocks written in a top-down manner
    always @(posedge reset or negedge clk) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule