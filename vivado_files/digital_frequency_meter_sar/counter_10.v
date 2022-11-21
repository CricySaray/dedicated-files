module counter_10(
    input wire en_in,
    input wire rst_n,
    input wire fin,
    input wire clear,
    output reg en_out,
    output reg [3:0] q
);
    always @(posedge fin, negedge rst_n) begin
        if (!rst_n) begin 
            en_out <= 1'b0;
            q <= 4'b0;
        end
        else if (en_in) begin 
            if (q == 4'b1001) begin 
                q <= 4'b0;
                en_out <= 1'b1;
            end
            else begin 
                q <= q + 1'b1;
                en_out <= 1'b0;
            end
        end
        else if (clear) begin
            q <= 4'b0;
            en_out <= 1'b0;
        end
        else begin
            q <= q;
            en_out <= 1'b0;
        end

    end


endmodule