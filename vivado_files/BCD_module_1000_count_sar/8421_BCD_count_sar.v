module module_10_counter_sar (     /*Module 10 counter*/
    clk, rst_n, cnt, en
);
    input clk;
    input rst_n;
    input en;
    output [3:0] cnt;
    reg [3:0] cnt;
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) cnt <= 4'b0;
        else if (en) begin
            if (cnt == 4'b1001) cnt <= 4'b0;
            else cnt <= cnt + 1'b1;
        end
    end
endmodule

module BCD_module_1000_counter_sar(
    clk, rst_n, cnt, en
);
    input clk;
    input rst_n;
    input en;
    output [11:0] cnt;
    wire [11:0] cnt;
    assign w1 = en & cnt[0] & cnt[3];
    assign w2 = w1 & cnt[4] & cnt[7];
        module_10_counter_sar U1(.clk(clk), .rst_n(rst_n), .cnt(cnt[3:0]), .en(en));
        module_10_counter_sar U2(.clk(clk), .rst_n(rst_n), .cnt(cnt[7:4]), .en(w1));
        module_10_counter_sar U3(.clk(clk), .rst_n(rst_n), .cnt(cnt[11:8]), .en(w2));
endmodule