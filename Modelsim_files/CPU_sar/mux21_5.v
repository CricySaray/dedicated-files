module mux21_5(address,pcout,aluout,selldst);

output[4:0] address;
input[4:0] pcout,aluout;
input selldst;

reg [4:0] address;

always @(selldst or pcout or aluout)
case(selldst)
1'd0: address=pcout;
1'd1: address=aluout;
endcase

endmodule