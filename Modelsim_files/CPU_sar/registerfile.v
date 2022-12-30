module registerfile(Q1,Q2,DI,clk,reset,writeen,AD,A1,A2);

output[31:0] Q1,Q2;
input[31:0] DI;
input clk,reset,writeen;
input[4:0] AD,A1,A2;

wire[31:0] decoderout;
wire[31:0] regen;
wire[31:0] q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31;

decoder dec0(decoderout,AD);

assign  regen[0]=decoderout[0] & writeen;
assign  regen[1]=decoderout[1] & writeen;
assign  regen[2]=decoderout[2] & writeen;
assign  regen[3]=decoderout[3] & writeen;
assign  regen[4]=decoderout[4] & writeen;
assign  regen[5]=decoderout[5] & writeen;
assign  regen[6]=decoderout[6] & writeen;
assign  regen[7]=decoderout[7] & writeen;
assign  regen[8]=decoderout[8] & writeen;
assign  regen[9]=decoderout[9] & writeen;
assign  regen[10]=decoderout[10] & writeen;
assign  regen[11]=decoderout[11] & writeen;
assign  regen[12]=decoderout[12] & writeen;
assign  regen[13]=decoderout[13] & writeen;
assign  regen[14]=decoderout[14] & writeen;
assign  regen[15]=decoderout[15] & writeen;
assign  regen[16]=decoderout[16] & writeen;
assign  regen[17]=decoderout[17] & writeen;
assign  regen[18]=decoderout[18] & writeen;
assign  regen[19]=decoderout[19] & writeen;
assign  regen[20]=decoderout[20] & writeen;
assign  regen[21]=decoderout[21] & writeen;
assign  regen[22]=decoderout[22] & writeen;
assign  regen[23]=decoderout[23] & writeen;
assign  regen[24]=decoderout[24] & writeen;
assign  regen[25]=decoderout[25] & writeen;
assign  regen[26]=decoderout[26] & writeen;
assign  regen[27]=decoderout[27] & writeen;
assign  regen[28]=decoderout[28] & writeen;
assign  regen[29]=decoderout[29] & writeen;
assign  regen[30]=decoderout[30] & writeen;
assign  regen[31]=decoderout[31] & writeen;

register reg0(q0,DI,clk,reset,regen[0]);
register reg1(q1,DI,clk,reset,regen[1]);
register reg2(q2,DI,clk,reset,regen[2]);
register reg3(q3,DI,clk,reset,regen[3]);
register reg4(q4,DI,clk,reset,regen[4]);
register reg5(q5,DI,clk,reset,regen[5]);
register reg6(q6,DI,clk,reset,regen[6]);
register reg7(q7,DI,clk,reset,regen[7]);
register reg8(q8,DI,clk,reset,regen[8]);
register reg9(q9,DI,clk,reset,regen[9]);
register reg10(q10,DI,clk,reset,regen[10]);
register reg11(q11,DI,clk,reset,regen[11]);
register reg12(q12,DI,clk,reset,regen[12]);
register reg13(q13,DI,clk,reset,regen[13]);
register reg14(q14,DI,clk,reset,regen[14]);
register reg15(q15,DI,clk,reset,regen[15]);
register reg16(q16,DI,clk,reset,regen[16]);
register reg17(q17,DI,clk,reset,regen[17]);
register reg18(q18,DI,clk,reset,regen[18]);
register reg19(q19,DI,clk,reset,regen[19]);
register reg20(q20,DI,clk,reset,regen[20]);
register reg21(q21,DI,clk,reset,regen[21]);
register reg22(q22,DI,clk,reset,regen[22]);
register reg23(q23,DI,clk,reset,regen[23]);
register reg24(q24,DI,clk,reset,regen[24]);
register reg25(q25,DI,clk,reset,regen[25]);
register reg26(q26,DI,clk,reset,regen[26]);
register reg27(q27,DI,clk,reset,regen[27]);
register reg28(q28,DI,clk,reset,regen[28]);
register reg29(q29,DI,clk,reset,regen[29]);
register reg30(q30,DI,clk,reset,regen[30]);
register reg31(q31,DI,clk,reset,regen[31]);

mux_32 mux0(Q1,q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31,A1);
mux_32 mux1(Q2,q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31,A2);


endmodule



