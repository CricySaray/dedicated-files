module reversible_counter_sar (
    input wire clk,
    input wire rst_n,
    input wire up_down,
    output reg [3:0] cnt
);
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            if (up_down) cnt <= 4'b0;
            else cnt <= 4'b1111;
        end
        else begin 
            if (up_down) cnt <= cnt + 1'b1;
            else cnt <= cnt - 1'b1;
        end
    end
    
endmodule