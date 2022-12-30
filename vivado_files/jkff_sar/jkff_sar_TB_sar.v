`timescale 1ns/1ns

module stimulus;
    reg CLK, RST_N, SET, J, K;
    wire Q, QBAR;

jkff_sar jkff(CLK, RST_N, SET, J, K, Q, QBAR);

initial begin
    set_clock_initial;
end
always #10 CLK = ~CLK;
initial begin
    RST_N = 1'b0;
    #20 RST_N = 1'b1;
end

initial begin
    SET = 1'b1;
    #10 SET = 1'b0;
end

always begin
    {J, K} = 2'b00;
    #22 {J, K} = 2'b01;
    #22 {J, K} = 2'b10;
    #22 {J, K} = 2'b11;

    #50 {J, K} = 2'b10;
    #22 {J, K} = 2'b01;
    #22 {J, K} = 2'b00;

end

initial
    #200 $finish;

task set_clock_initial;
begin
    CLK = 1'b0;
end
endtask
endmodule
