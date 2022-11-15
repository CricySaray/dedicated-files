module universal_shift_sar(
    input clk,
    input rst_n,
    input [1:0] mod,
    input rightin,
    input leftin,
    input [15:0] pin,
    output reg [15:0] dout
);
    always@(posedge clk, negedge rst_n) begin
        if (!rst_n) dout <= 16'b0;
        else begin
            case(mod)
            2'b00: dout <= {dout[14:0], rightin};
            2'b01: dout <= {leftin, dout[15:1]};
            2'b10: dout <= pin;
            default: dout <= 16'b0;
            endcase

        end
    end

endmodule