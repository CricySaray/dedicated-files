module latch(
    input wire clk_1Hz,
    input wire latch_en,
    input wire rst_n,
    input wire [3:0] q0,
    input wire [3:0] q1,
    input wire [3:0] q2,
    input wire [3:0] q3,
    input wire [3:0] q4,
    input wire [3:0] q5,
    input wire [3:0] q6,
    input wire [3:0] q7,
    
    output reg [3:0] d0,
    output reg [3:0] d1,
    output reg [3:0] d2,
    output reg [3:0] d3,
    output reg [3:0] d4,
    output reg [3:0] d5,
    output reg [3:0] d6,
    output reg [3:0] d7

);
    always @(posedge clk_1Hz, negedge rst_n) begin
        if (!rst_n) begin 
            d0 <= 4'b0;
            d1 <= 4'b0;
            d2 <= 4'b0;
            d3 <= 4'b0;
            d4 <= 4'b0;
            d5 <= 4'b0;
            d6 <= 4'b0;
            d7 <= 4'b0;
            
        end
        else if (latch_en) begin 
            d0 <= q0;
            d1 <= q1;
            d2 <= q2;
            d3 <= q3;
            d4 <= q4;
            d5 <= q5;
            d6 <= q6;
            d7 <= q7;
        end
        else begin
            d0 <= d0;
            d1 <= d1;
            d2 <= d2;
            d3 <= d3;
            d4 <= d4;
            d5 <= d5;
            d6 <= d6;
            d7 <= d7;
        end
    end 

endmodule