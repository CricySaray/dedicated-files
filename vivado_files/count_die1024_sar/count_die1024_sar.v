module count_sar(clk, rst_n, cnt);
    input clk, rst_n;
    output [9:0] cnt;
    reg [9:0] cnt;

    always @(posedge clk, negedge rst_n)
    begin
        if (!rst_n) cnt <= 10'b0;
        else cnt <= cnt + 1'b1;
    end
endmodule



