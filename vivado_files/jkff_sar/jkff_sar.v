module jkff_sar (
    clk, rst_n, set, j, k, q, qbar
);
    input clk, rst_n, set, j, k;
    output q, qbar;
    reg q;
    wire qbar;

    always @(posedge clk, negedge rst_n, posedge set) begin
        if(!rst_n)  q <= 1'b0;
        else if(set)    q <= 1'b1;
        else 
        begin
            case ({j, k})
                2'b00: q <= q;
                2'b01: q <= 1'b0;
                2'b10: q <= 1'b1;
                2'b11: q <= ~q;
                default: q <= q;
            endcase
        end
    end
    assign qbar = ~q;
endmodule