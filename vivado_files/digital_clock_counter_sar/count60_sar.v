module count10_sar (        /*模10计数器*/  
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

module count6_sar(          /*模6计数器*/
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


module count60_sar(         /*模60计数器*/ 
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