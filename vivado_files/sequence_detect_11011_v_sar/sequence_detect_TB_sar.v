`timescale 1ns/1ps
module stimulus;
    reg reset;
    reg clk;
    reg seq_in;
    wire seq_out;
    wire [3:0] seq_num;

    integer cnt1;
    integer cnt2;
    integer cnt3;

    seq_det_sar u_seq_det_sar(
        reset,
        clk,
        seq_in,
        seq_out,
        seq_num
    );
    initial begin
        reset = 1'b0;
        clk = 1'b0;
        #110 reset = 1'b1;
    end
    always 
    #50 clk = ~clk;

    always @(posedge clk, negedge reset) begin
        if (reset == 1'b0) begin
            cnt1 <= 0;
            cnt2 <= 0;
            cnt3 <= 0;
        end
        else if (cnt1 == 0) begin
            if (cnt2 == 4) begin
                if (cnt3 == 9) begin
                    cnt3 <= 0;
                    cnt1 <= cnt1 + 1;
                end
                else 
                    cnt3 <= cnt3 + 1;

                cnt2 <= 0;
            end
            else 
            cnt2 <= cnt2 + 1;
        end
        else if (cnt1 == 1) begin
            if (cnt2 == 5) begin
                if (cnt3 <= 9) begin
                    cnt3 <= 0;
                    cnt1 <= cnt3 + 1;
                end
                else
                cnt3 <= cnt3 + 1;

                cnt2 <= 0;
            end 
            else 
            cnt2 <= cnt2 + 1;
        end
        else if (cnt1 == 2) begin
            if (cnt2 == 6) begin
                if (cnt3 == 9) begin
                    cnt3 <= 0;
                    cnt1 <= cnt1 + 1;
                end 
                else 
                cnt3 <= cnt3 + 1;

                cnt2 <= 0;
            end
            cnt2 <= cnt2 + 1;
        end
        else if (cnt1 == 3) begin
            if (cnt2 == 7) begin
                if (cnt3 == 9)begin
                    cnt3 <= 0;
                    cnt1 <= cnt1 + 1;
                end
                else
                cnt3 <= cnt3 + 1;

                cnt2 <= 0;
            end
            else
            cnt2 <= cnt2 + 1;
        end
        else if (cnt1 == 4) begin
            if (cnt2 == 8) begin 
                if(cnt3 == 9) begin
                    cnt3 <= 0;
                    cnt1 <= cnt1 + 1;
                end 
                else 
                cnt3 <= cnt3 + 1;

                cnt2 <= 0;
            end 
            else 
            cnt2 <= cnt2 + 1;
        end
        else if (cnt1 == 5) begin
            if (cnt2 == 9)begin
                if (cnt3 == 9) begin
                    cnt3 <= 0;
                    cnt1 <= cnt1 + 1;
                end 
                else 
                cnt3 <= cnt3 + 1;

                cnt2 <= 0;
            end
            else 
            cnt2 <= cnt2 + 1;
        end
        else if (cnt1 == 6) begin
            if (cnt2 == 15)begin
                if (cnt3 == 9) begin
                    cnt3 <= 0;
                    cnt1 <= cnt1 + 1;
                end 
                else 
                cnt3 <= cnt3 + 1;

                cnt2 <= 0;
            end
            else 
            cnt2 <= cnt2 + 1;
        end
    end


    always@(posedge clk, negedge reset) begin
        if (reset) seq_in <= 1'b0;
        else if (cnt2 == 0) seq_in <= 1'b1;
        else if (cnt2 == 1) seq_in <= 1'b1;
        else if (cnt2 == 2) seq_in <= 1'b0;
        else if (cnt2 == 3) seq_in <= 1'b1;
        else if (cnt2 == 4) seq_in <= 1'b1;
        else if (cnt2 == 5) seq_in <= 1'b0;
        else if (cnt2 == 6) seq_in <= 1'b1;
        else if (cnt2 == 7) seq_in <= 1'b1;
        else if (cnt2 == 8) seq_in <= 1'b0;
        else if (cnt2 == 9) seq_in <= 1'b1;
        else seq_in <= 1'b1;
    end


endmodule