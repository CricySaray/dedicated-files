module moore_seq_det_10010_sar(
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
    reg [2:0] next_state;
    reg [2:0] current_state;
    parameter S0 = 3'b000;
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;
    parameter S4 = 3'b100;
    parameter S5 = 3'b101;
        always @(posedge clk, negedge rst_n) begin
            if (!rst_n) current_state <= 3'b0;
            else current_state <= next_state;
        end
        always @(in, current_state) begin
            case(current_state)
            S0: next_state = (in == 1'b1) ? S1 : S0;
            S1: next_state = (in == 1'b0) ? S2 : S1;
            S2: next_state = (in == 1'b0) ? S3 : S1;
            S3: next_state = (in == 1'b1) ? S4 : S0;
            S4: next_state = (in == 1'b0) ? S5 : S1;
            S5: next_state = (in == 1'b0) ? S3 : S1;
            default: next_state = S0;
            endcase
        end
        always @(current_state) begin
            case (current_state)
            S0: out = 1'b0;
            S1: out = 1'b0;
            S2: out = 1'b0;
            S3: out = 1'b0;
            S4: out = 1'b0;
            S5: out = 1'b1;
            default: out = 1'b0;
            endcase
        end
endmodule