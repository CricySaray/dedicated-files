module frequency_divider_odd_sar (
    input wire clk,
    input wire rst_n,
    output wire div

);
    
    parameter n = 5;
    reg [3:0] cnt;
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) cnt <= 4'b0;
        else if (cnt == 2 * n) cnt <= 4'b0;
        else cnt <= cnt + 1'b1;
    end

    assign div = (cnt < n) ? 1'b1 : 1'b0;
endmodule