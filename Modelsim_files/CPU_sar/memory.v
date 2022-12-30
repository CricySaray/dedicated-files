module memory(dataout,datain,address,we,memin,memaddr,memwe,clk,reset);

output[31:0] dataout;
input[31:0] datain,memin;
input[4:0] address,memaddr;
input clk,reset,we,memwe;

wire we1;
wire[4:0] address1;
wire[31:0] decoderout;
wire[31:0] regen;
wire[31:0] datain1;
wire[31:0] q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31;

assign address1=memwe?memaddr:address;
assign datain1=memwe? memin:datain;
decoder dec0(decoderout,address1);

assign we1=we | memwe;

assign  regen[0]=decoderout[0] & we1;
assign  regen[1]=decoderout[1] & we1;
assign  regen[2]=decoderout[2] & we1;
assign  regen[3]=decoderout[3] & we1;
assign  regen[4]=decoderout[4] & we1;
assign  regen[5]=decoderout[5] & we1;
assign  regen[6]=decoderout[6] & we1;
assign  regen[7]=decoderout[7] & we1;
assign  regen[8]=decoderout[8] & we1;
assign  regen[9]=decoderout[9] & we1;
assign  regen[10]=decoderout[10] & we1;
assign  regen[11]=decoderout[11] & we1;
assign  regen[12]=decoderout[12] & we1;
assign  regen[13]=decoderout[13] & we1;
assign  regen[14]=decoderout[14] & we1;
assign  regen[15]=decoderout[15] & we1;
assign  regen[16]=decoderout[16] & we1;
assign  regen[17]=decoderout[17] & we1;
assign  regen[18]=decoderout[18] & we1;
assign  regen[19]=decoderout[19] & we1;
assign  regen[20]=decoderout[20] & we1;
assign  regen[21]=decoderout[21] & we1;
assign  regen[22]=decoderout[22] & we1;
assign  regen[23]=decoderout[23] & we1;
assign  regen[24]=decoderout[24] & we1;
assign  regen[25]=decoderout[25] & we1;
assign  regen[26]=decoderout[26] & we1;
assign  regen[27]=decoderout[27] & we1;
assign  regen[28]=decoderout[28] & we1;
assign  regen[29]=decoderout[29] & we1;
assign  regen[30]=decoderout[30] & we1;
assign  regen[31]=decoderout[31] & we1;

register reg0(q0,datain1,clk,reset,regen[0]);
register reg1(q1,datain1,clk,reset,regen[1]);
register reg2(q2,datain1,clk,reset,regen[2]);
register reg3(q3,datain1,clk,reset,regen[3]);
register reg4(q4,datain1,clk,reset,regen[4]);
register reg5(q5,datain1,clk,reset,regen[5]);
register reg6(q6,datain1,clk,reset,regen[6]);
register reg7(q7,datain1,clk,reset,regen[7]);
register reg8(q8,datain1,clk,reset,regen[8]);
register reg9(q9,datain1,clk,reset,regen[9]);
register reg10(q10,datain1,clk,reset,regen[10]);
register reg11(q11,datain1,clk,reset,regen[11]);
register reg12(q12,datain1,clk,reset,regen[12]);
register reg13(q13,datain1,clk,reset,regen[13]);
register reg14(q14,datain1,clk,reset,regen[14]);
register reg15(q15,datain1,clk,reset,regen[15]);
register reg16(q16,datain1,clk,reset,regen[16]);
register reg17(q17,datain1,clk,reset,regen[17]);
register reg18(q18,datain1,clk,reset,regen[18]);
register reg19(q19,datain1,clk,reset,regen[19]);
register reg20(q20,datain1,clk,reset,regen[20]);
register reg21(q21,datain1,clk,reset,regen[21]);
register reg22(q22,datain1,clk,reset,regen[22]);
register reg23(q23,datain1,clk,reset,regen[23]);
register reg24(q24,datain1,clk,reset,regen[24]);
register reg25(q25,datain1,clk,reset,regen[25]);
register reg26(q26,datain1,clk,reset,regen[26]);
register reg27(q27,datain1,clk,reset,regen[27]);
register reg28(q28,datain1,clk,reset,regen[28]);
register reg29(q29,datain1,clk,reset,regen[29]);
register reg30(q30,datain1,clk,reset,regen[30]);
register reg31(q31,datain1,clk,reset,regen[31]);


mux_32 mux0(dataout,q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31,address);

endmodule



