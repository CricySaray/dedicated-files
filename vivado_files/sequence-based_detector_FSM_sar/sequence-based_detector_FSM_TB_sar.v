`timescale 1ns/1ns

module FSM_TB_sar;

    reg CLK;
    reg RST_N;
    reg IN;
    wire OUT;

    FSM_sar uut(
        .clk(CLK),
        .rst_n(RST_N),
        .in(IN),
        .out(OUT)
    );

    initial 
    begin
        CLK = 1'b0;
    end

    always #5 CLK = ~CLK;

    initial
    begin
        RST_N =  1'b0;
        # 10 RST_N =  1'b1;
    end

    initial 
        $monitor ($time, "IN = %b OUT = %b",
            IN, OUT);

    initial
    begin
        IN = 1'b0;
        #10 IN = 1'b1;
        #10 IN = 1'b0;
        #10 IN = 1'b1;
        #10 IN = 1'b0;
        
        #10 IN = 1'b1;    
        #10 IN = 1'b1;
        #10 IN = 1'b0;
        #10 IN = 1'b1;
        #10 IN = 1'b0;
        
        #10 IN = 1'b0;
        #10 IN = 1'b1;
        #10 IN = 1'b0;
        #10 IN = 1'b1;
        #10 IN = 1'b0;
        
        #10 $stop;
    end
endmodule