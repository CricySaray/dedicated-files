`timescale 1ps/1ps
module stimulus;
reg CLK, RST_N, IN;
wire L2H_SIG, f1, f2;

posedge_detect_sar POS_sar(CLK, RST_N, IN, L2H_SIG, f1, f2);

initial begin
    CLK = 0;
end
always
    #1 CLK = ~CLK;

initial 
begin
    IN = 0;
    repeat(3) @(posedge CLK); IN = ~IN;
    repeat(3) @(posedge CLK); IN = ~IN;
    repeat(3) @(posedge CLK); IN = ~IN;
    repeat(3) @(posedge CLK); IN = ~IN;
    repeat(3) @(posedge CLK); IN = ~IN;
    repeat(3) @(posedge CLK); IN = ~IN;
    repeat(3) @(posedge CLK); IN = ~IN;
    repeat(3) @(posedge CLK); IN = ~IN;
    repeat(3) @(posedge CLK); IN = ~IN;
    repeat(3) @(posedge CLK); IN = ~IN;
    repeat(3) @(posedge CLK); IN = ~IN;
end

initial
begin
    RST_N = 0;
    repeat(10) @(posedge CLK); RST_N = ~RST_N;
    repeat(10) @(posedge CLK); RST_N = ~RST_N;

end

endmodule
