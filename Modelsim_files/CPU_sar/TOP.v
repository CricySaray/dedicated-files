module TOP(clk,rst,start,memwe,memin,memaddr,zero,n,v,c,dataout);

input clk,rst,start,memwe;
input [31:0]memin;
input [4:0]memaddr;
output [31:0]dataout;
output n,v,c,zero;

wire clk,rst;
wire writepc,selldst,writemem,writeir,selload,selst,writereg,selalua,writezero;
wire [5:0]opcode;
wire [1:0]aluop,selalub;
wire zero;

datapath u0(writepc,selldst,writemem,writeir,selload,selst,writereg,selalua,selalub,aluop,writezero,clk,rst,memin,memaddr,memwe,zero,n,v,c,opcode,dataout);
control u1(clk,start,zero,opcode,writepc,selldst,writemem,writeir,selload,selst,writereg,selalua,selalub,aluop,writezero);

endmodule