module mealy_seq_det_1001_1110_sar (
    clk,
    rst_n,
    in,
    out
);
    input clk;
    input rst_n;
    input in;
    output [3:0] out;
    reg [3:0] out;
    reg [7:0] next_state;
    reg [7:0] current_state;
    parameter S0 = 8'b0000_0000;
    parameter S1 = 8'b0000_0001;
    parameter S2 = 8'b0000_0010;
    parameter S3 = 8'b0000_0100;
    parameter S4 = 8'b0000_1000;
    parameter S5 = 8'b0001_0000;
    parameter S6 = 8'b0010_0000;
    parameter S7 = 8'b0100_0000;
        always @(posedge clk, negedge rst_n) begin
            if (!rst_n) current_state <= 8'b0;
            else current_state <= next_state;
        end
        always @(in, current_state) begin
            case(current_state)
            S0: if (in == 1'b1) next_state = S1; else next_state = S0;
            S1: if (in == 1'b0) next_state = S2; else next_state = S1;
            S2: if (in == 1'b0) next_state = S3; else next_state = S1;
            S3: if (in == 1'b1) next_state = S4; else next_state = S0;
            S4: if (in == 1'b1) next_state = S5; else next_state = S2;
            S5: if (in == 1'b1) next_state = S6; else next_state = S2;
            S6: if (in == 1'b1) next_state = S7; else next_state = S2;
            S7: if (in == 1'b0) next_state = S2; else next_state = S1;
            default: next_state = S0;
            endcase
        end
        always @(current_state) begin
            case(current_state)
            S0: out = 4'b0000;
            S1: out = 4'b0000;
            S2: out = 4'b0000;
            S3: out = 4'b0000;
            S4: out = 4'b1001;
            S5: out = 4'b1001;
            S6: out = 4'b1001;
            S7: out = (in == 1'b0) ? 4'b1110: 1'b1001;
            // S7: out = 4'b1110;
            default: out = 4'b0000;
            endcase
        $monitor("in = %b, out = %b", in, out);
        end
endmodule