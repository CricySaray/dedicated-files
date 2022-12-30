`timescale 1ps/1ps
module stimulus;
reg CLK, RST_N, EN;
wire  CNT;
count60_sar COUNT60(CLK, RST_N, CNT, EN);
initial begin
    CLK = 0;
end
always
    #1 CLK = ~CLK;

initial begin
    RST_N = 1'b0;
    #1 RST_N = ~RST_N;
    // #1 RST_N = ~RST_N;
end

initial begin
    EN = 0;
    #4 EN = 1'b1;
end
endmodule