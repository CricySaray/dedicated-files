module even_odd_check_sar (
    datain, data_even, data_odd
);
    output [8:0] data_even, data_odd;
    input [7:0] datain;
    wire even, odd;
    assign even = ^datain;
    assign odd = ~even;
    assign data_even = {datain, even};
    assign data_odd = {datain, odd};
endmodule