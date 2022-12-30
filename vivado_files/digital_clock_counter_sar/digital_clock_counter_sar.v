module digital_clock_counter_sar (
    input wire clk,
    input wire rst_n,
    input wire en,
    output wire [7:0] hour,
    output wire [7:0] min,
    output wire [7:0] sec
);
    wire w1;
    wire w2;
    wire clk_100M;

    assign w1 = en & sec[6] & sec[4] & sec[3] & sec[0];
    assign w2 = w1 & min[6] & min[4] & min[3] & min[0];

        count60_sar eg1(.clk(clk_100M), .rst_n(rst_n), .cnt(sec), .en(en));
        count60_sar eg2(.clk(clk_100M), .rst_n(rst_n), .cnt(min), .en(w1));
        count24 eg3(.clk(clk_100M), .rst_n(rst_n), .cnt(hour), .en(w2));
        
    clk_100Mto100M u_clk_100Mto100M (
  .reset(~rst_n),        // input wire reset
  .clk_in1(clk),    // input wire clk_in1
  .clk_100M(clk_100M)  // output wire clk_100M
);

endmodule



module count10_sar (        /*æ¨?10è®¡æ•°å™?*/  
    clk, rst_n, cnt, en
);
    input clk, rst_n, en;
    output [3:0] cnt;
    reg [3:0] cnt;
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) cnt <= 4'b0;
        else if (en)begin
            if (cnt == 4'b1001)cnt <= 4'b0;
            else cnt <= cnt + 1'b1;
        end
    end
    
endmodule

module count6_sar(          /*æ¨?6è®¡æ•°å™?*/
    clk, rst_n, cnt, en
);
    input clk;
    input rst_n;
    input en;
    output [3:0] cnt;
    reg [3:0] cnt;
    always@(posedge clk, negedge rst_n) begin
        if (!rst_n) cnt <=4'b0;
        else if(en) begin
            if (cnt == 4'b0101) cnt <= 4'b0;
            else cnt <= cnt +1'b1;
        end
    end
endmodule


module count60_sar(         /*æ¨?60è®¡æ•°å™?*/ 
    clk, rst_n, cnt, en
);
    input clk, rst_n, en;
    output [7:0] cnt;
    wire [7:0] cnt;
    wire w1;
    assign w1 = en & cnt[0] & cnt [3];
    count10_sar U1(clk, rst_n, cnt[3:0], en);
    count6_sar U2(clk, rst_n, cnt[7:4], w1 );
    endmodule

    module count24(
        input clk,
        input rst_n,
        input en,
        output reg [7:0] cnt
    );
    always@(posedge clk, negedge rst_n) begin
        if (!rst_n) cnt <= 8'b0;
        else if (en) begin
            if (cnt[7:4] == 4'b0010 && cnt[3:0] == 4'b0011) cnt <= 8'b0;
            else if (cnt[3:0] == 4'b1001) begin
                cnt[3:0] <= 4'b0;
                cnt[7:4] <= cnt[7:4] + 1'b1;
            end
            else
            cnt[3:0] <= cnt[3:0] + 1'b1;
        end
    end

    endmodule