module FSM_sar(clk, rst_n, in, out);
    input clk;
    input rst_n;
    input in;
    output out;
    reg out;
    reg[4:0] next_stage;
    reg[4:0] current_stage;
    parameter s0 = 5'b00001;
    parameter s1 = 5'b00010;
    parameter s2 = 5'b00100;
    parameter s3 = 5'b01000;
    parameter s4 = 5'b10000;
        always @(posedge clk or negedge rst_n)
        begin
            if(!rst_n) current_stage <= 5'b00000; 
            else current_stage <= next_stage;          
        end
        always @(in or current_stage)
        begin
            case(current_stage)
                s0 : next_stage = (in == 1'b1) ? s1 : s0;
                s1 : next_stage = (in == 1'b1) ? s2 : s0;
                s2 : next_stage = (in == 1'b0) ? s3 : s2;
                s3 : next_stage = (in == 1'b1) ? s4 : s0;
                s4 : next_stage = (in == 1'b0) ? s0 : s1;
                default : next_stage = s0;
            endcase
        end
        always @(in or current_stage)
        begin
            case(current_stage)
                s0 : out = 1'b0;
                s1 : out = 1'b0;
                s2 : out = 1'b0;
                s3 : out = 1'b0;
                s4 : out = (in == 1'b0) ? 1'b1 : 1'b0;
                default : out = 1'b0;
            endcase
        end
endmodule