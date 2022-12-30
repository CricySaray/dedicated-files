module datapath(writepc,selldst,writemem,writeir,selload,selst,writereg,selalua,selalub,aluop,writezero,clk,rst,memin,memaddr,memwe,zero,n,v,c,opcode,dataout);

input writepc,selldst,writemem,writeir,selload,selst,writereg,selalua,writezero,clk,rst,memwe;
input [1:0] selalub,aluop;
input [4:0]memaddr;
input [31:0]memin;
output zero,n,v,c;
output [5:0]opcode;
output [31:0]dataout;

wire [4:0]pcout,address,memaddr,mux3out;
wire [31:0]memin,mux4out,mux5out,imme,disp;
wire memwe,zero1;
wire [31:0]dataout,Q1,datain,irout,f,aluout;
//reg [31:0] Q11;
//reg [31:0] datain1;
//reg [31:0] imme1;
//reg [31:0] disp1;


pc pc1(pcout,aluout[4:0],writepc,clk,rst);
mux21_5 mux1(address,pcout,aluout[4:0],selldst);
memory mem(dataout,datain,address,writemem,memin,memaddr,memwe,clk,rst);
//memin,memaddr,memwe是为了在寄存器中输入数据而用
ir ir1(irout,dataout,clk,rst,writeir);
mux21_32 mux2(f,aluout,dataout,selload);
mux21_5  mux3(mux3out,irout[4:0],irout[25:21],selst);
registerfile registerfile(Q1,datain,f,clk,rst,writereg,irout[25:21],irout[20:16],mux3out);

//always @(posedge clk)
//   Q11<=Q1;

mux21_32 mux4(mux4out,Q1,{27'b0,pcout},selalua);

assign imme={irout[15],irout[15],irout[15],irout[15],irout[15],irout[15],irout[15],irout[15],irout[15],irout[15],irout[15],irout[15],irout[15],irout[15],irout[15],irout[15],irout[15:0]};
assign disp={irout[25],irout[25],irout[25],irout[25],irout[25],irout[25],irout[25:0]};

//always @(posedge clk)
//   datain1<=datain;
//always @(posedge clk)
//   imme1<=imme;
//always @(posedge clk)
//   disp1<=disp;

mux41_32 mux5(mux5out,datain,imme,32'd1,disp,selalub);
ALU alu1(aluop,mux4out,mux5out,aluout,n,v,c,zero1);
//zerostore ze(zero1,writezero,zero);
dff  zeroflag(zero,zero1,clk,rst,writezero);
assign opcode=irout[31:26];

endmodule






