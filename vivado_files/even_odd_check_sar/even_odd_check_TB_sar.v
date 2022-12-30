module stimulus;
reg [7:0] IN;
wire [8:0] EVEN, ODD;
even_odd_check_sar check_sar(
    .datain(IN),
    .data_even(EVEN),
    .data_odd(ODD)  
);
integer i;
initial begin
    IN = 8'b0000_0000;
//    #10 IN = 8'b0000_0001;
    // #10 IN = 8'b0000_0011;
    // #10 IN = 8'b0000_0111;
    // #10 IN = 8'b0000_1111;
    // #10 IN = 8'b0001_1111;
    // #10 IN = 8'b0011_1111;
    // #10 IN = 8'b0111_1111;
    // #10 IN = 8'b1111_1111;
    for (i = 0; i < 6; i = i + 1 )
    begin
        #10 IN = IN +1'b1;        
    end

end
endmodule