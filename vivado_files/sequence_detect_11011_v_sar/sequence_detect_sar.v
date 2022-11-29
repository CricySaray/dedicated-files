module seq_det_sar (
    input wire reset,
    input wire clk,
    input wire seq_in,
    output reg seq_out,
    output reg [3:0] seq_num
);
    

    reg [5:0] state;
    reg [5:0] next_state;
    parameter 
                S0 = 6'b000001,
                S1 = 6'b000010,
                S2 = 6'b000100,
                S3 = 6'b001000,
                S4 = 6'b010000,
                S5 = 6'b100000;

    always@(posedge clk, negedge reset) begin
        if (!reset)
            state <= S0;
        else 
            state <= next_state;
    end
    always@(state, seq_in) begin
        case (state)
        S0: 
            if (seq_in)
            next_state = S1;
            else
            next_state = S0;
        S1:
            if (seq_in)
            next_state = S2;
            else
            next_state = S0;
        S2:
            if (~seq_in)
            next_state = S3;
            else 
            next_state = S2;
        S3:
            if (seq_in)
            next_state = S4;
            else 
            next_state = S0;
        S4:
            if (seq_in)
            next_state = S5;
            else 
            next_state = S0;
        default:
            next_state = S0;
        endcase

    end

    always@(posedge clk) begin
        case (state) 
        S5: 
            if (seq_num >= 4'd9)
            seq_num <= 4'd0;
            else 
            seq_num <= seq_num + 1'b1;
        endcase
    end

    always@(posedge clk) begin
        case (state)
            S0: seq_out <= 1'b0;
            S1: seq_out <= 1'b1;
            S2: seq_out <= 1'b1;
            S3: seq_out <= 1'b0;
            S4: seq_out <= 1'b1;
            S5: seq_out <= 1'b1;
        endcase
    end
endmodule