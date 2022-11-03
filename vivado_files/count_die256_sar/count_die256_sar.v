module count_sar(clk, rst_n, en, cnt);
    input clk, rst_n, en;
    output [7:0] cnt;
    reg [7:0] cnt;

    always @(posedge clk, negedge rst_n)
    begin
        if (!rst_n) cnt <= 8'b0;
        else if (en) cnt <= cnt + 1'b1;
    end
endmodule


