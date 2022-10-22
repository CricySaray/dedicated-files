module posedge_detect_sar (
    clk, rst_n, in, L2H_Sig, F1, F2
);
    input clk;
    input rst_n;
    input in;
    output L2H_Sig, F1, F2;
    reg F1;
    reg F2;
    wire L2H_Sig;

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n)
        begin
            F1 <= 1'b1;
            F2 <= 1'b1;
        end
        else
        begin
            F1 <= in;
            F2 <= F1;
        end    
    end
    assign L2H_Sig = !F2 & F1;
endmodule