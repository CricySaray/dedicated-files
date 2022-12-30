module modular_9_substraction_counter_sar(
    clk, rst_n, cnt
);
input clk;
input rst_n;
output [3:0] cnt;
reg [3:0] cnt;
always @(posedge clk, negedge rst_n) begin
    if (!rst_n) cnt <= 4'b1000;
    else if (cnt == 4'b0) cnt <= 4'b1000;
    else cnt <= cnt - 1'b1;
end
endmodule