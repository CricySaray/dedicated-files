module ir(irout,irin,clk,reset,writeir);

output[31:0] irout;
input[31:0] irin;
input clk,reset,writeir;

register  u(irout,irin,clk,reset,writeir);

endmodule
