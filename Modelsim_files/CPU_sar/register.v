module register(q,data,clk,reset,en);

output[31:0] q;
input[31:0] data;
input clk,reset,en;

dff u0(q[0],data[0],clk,reset,en);
dff u1(q[1],data[1],clk,reset,en);
dff u2(q[2],data[2],clk,reset,en);
dff u3(q[3],data[3],clk,reset,en);
dff u4(q[4],data[4],clk,reset,en);
dff u5(q[5],data[5],clk,reset,en);
dff u6(q[6],data[6],clk,reset,en);
dff u7(q[7],data[7],clk,reset,en);
dff u8(q[8],data[8],clk,reset,en);
dff u9(q[9],data[9],clk,reset,en);
dff u10(q[10],data[10],clk,reset,en);
dff u11(q[11],data[11],clk,reset,en);
dff u12(q[12],data[12],clk,reset,en);
dff u13(q[13],data[13],clk,reset,en);
dff u14(q[14],data[14],clk,reset,en);
dff u15(q[15],data[15],clk,reset,en);
dff u16(q[16],data[16],clk,reset,en);
dff u17(q[17],data[17],clk,reset,en);
dff u18(q[18],data[18],clk,reset,en);
dff u19(q[19],data[19],clk,reset,en);
dff u20(q[20],data[20],clk,reset,en);
dff u21(q[21],data[21],clk,reset,en);
dff u22(q[22],data[22],clk,reset,en);
dff u23(q[23],data[23],clk,reset,en);
dff u24(q[24],data[24],clk,reset,en);
dff u25(q[25],data[25],clk,reset,en);
dff u26(q[26],data[26],clk,reset,en);
dff u27(q[27],data[27],clk,reset,en);
dff u28(q[28],data[28],clk,reset,en);
dff u29(q[29],data[29],clk,reset,en);
dff u30(q[30],data[30],clk,reset,en);
dff u31(q[31],data[31],clk,reset,en);

endmodule
