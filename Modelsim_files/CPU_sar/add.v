module add(a,b,sub,s,c,v,n);

input [31:0]a;
input [31:0]b;
input sub;
output [31:0]s;
output c,v,n;

wire [31:0]a;
wire [31:0]b;
wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31;

fadd f0(a[0],b[0]^sub,s[0],sub,c1);
fadd f1(a[1],b[1]^sub,s[1],c1,c2);
fadd f2(a[2],b[2]^sub,s[2],c2,c3);
fadd f3(a[3],b[3]^sub,s[3],c3,c4);
fadd f4(a[4],b[4]^sub,s[4],c4,c5);
fadd f5(a[5],b[5]^sub,s[5],c5,c6);
fadd f6(a[6],b[6]^sub,s[6],c6,c7);
fadd f7(a[7],b[7]^sub,s[7],c7,c8);
fadd f8(a[8],b[8]^sub,s[8],c8,c9);
fadd f9(a[9],b[9]^sub,s[9],c9,c10);
fadd f10(a[10],b[10]^sub,s[10],c10,c11);
fadd f11(a[11],b[11]^sub,s[11],c11,c12);
fadd f12(a[12],b[12]^sub,s[12],c12,c13);
fadd f13(a[13],b[13]^sub,s[13],c13,c14);
fadd f14(a[14],b[14]^sub,s[14],c14,c15);
fadd f15(a[15],b[15]^sub,s[15],c15,c16);
fadd f16(a[16],b[16]^sub,s[16],c16,c17);
fadd f17(a[17],b[17]^sub,s[17],c17,c18);
fadd f18(a[18],b[18]^sub,s[18],c18,c19);
fadd f19(a[19],b[19]^sub,s[19],c19,c20);
fadd f20(a[20],b[20]^sub,s[20],c20,c21);
fadd f21(a[21],b[21]^sub,s[21],c21,c22);
fadd f22(a[22],b[22]^sub,s[22],c22,c23);
fadd f23(a[23],b[23]^sub,s[23],c23,c24);
fadd f24(a[24],b[24]^sub,s[24],c24,c25);
fadd f25(a[25],b[25]^sub,s[25],c25,c26);
fadd f26(a[26],b[26]^sub,s[26],c26,c27);
fadd f27(a[27],b[27]^sub,s[27],c27,c28);
fadd f28(a[28],b[28]^sub,s[28],c28,c29);
fadd f29(a[29],b[29]^sub,s[29],c29,c30);
fadd f30(a[30],b[30]^sub,s[30],c30,c31);
fadd f31(a[31],b[31]^sub,s[31],c31,c);

assign n=s[31];
assign v=c^c31;

endmodule