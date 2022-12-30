module signal_maker_sar (
    input wire clk,
    input wire rst_n,
    input wire load,
    input wire [5:0] din,
    output wire dout
);
    reg [5:0] temp;
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) temp <= 6'b011001;
        else if (load) temp <= din;
        else temp <= {temp[4:0], temp[5]};
    
    end
    assign dout = temp[5];
endmodule