
`timescale 1ns/1ns

module Top_sar;
wire q, qbar;
reg set, reset;
SR_latch_sar m1(q, qbar, ~set, ~reset);
initial
begin
    $monitor($time, " set = %b, reset= %b, q= %b\n",set,reset,q);
    set = 0; reset = 0;
    #5 reset = 1;
    #5 reset = 0;
    #5 set = 1;
end
endmodule
