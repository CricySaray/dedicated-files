module control(
    input wire clk_1Hz,
    input wire rst_n,
    output reg count_en,
    output reg latch_en,
    output reg clear
);
    reg [1:0] state;
    always @(posedge clk_1Hz, negedge rst_n) begin
        if (!rst_n) begin
            state <= 2'd0; count_en <= 1'b0;
            latch_en <= 1'b0; clear <= 1'b0;    
        
        end
        else begin 
            case (state)
            2'd0: begin
                count_en <= 1'b1; latch_en <= 1'b0;
                clear <= 1'b0; state <= 2'd1;
            end
            2'd1: begin 
                count_en <= 1'b0; latch_en <= 1'b1;
                clear <= 1'b0; state <= 2'd2;
            end
            2'd2: begin
                count_en <= 1'b0; latch_en <= 1'b0;
                clear <= 1'b1; state <= 2'd0;
            
            end
            default: begin 
                count_en <= 1'b0; latch_en <= 1'b0;
                clear <= 1'b0; state <= 2'd0;
            end
            endcase
        end
    end 

endmodule