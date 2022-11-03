module mealy_seq_det_10010_sar (
    clk,
    rst_n,
    in,
    out
);
    input clk;
    input rst_n;
    input in;
    output out;
    reg out;
    reg [1:0] next_state;
    reg [1:0] current_state;
    parameter S0 = 1'b01;
    parameter S1 = 1'b10;

        always @(negedge clk, negedge rst_n) begin
            if (!rst_n) current_state <= S0;
            else current_state <= next_state;
        end
        always @(in, current_state) begin
            case(current_state)
            S0: next_state = (in == 1'b1) ? S1 : S0;
            S1: next_state = (in == 1'b0) ? S0 : S1;
            default: next_state = S0;
            endcase
        end
        always @(in, current_state) begin
            case(current_state)
            S0: out = 1'b0;
            S1: out = (in == 1'b0) ? 1'b1 : 1'b0;
            default: out = 1'b0;
            endcase
        end
endmodule