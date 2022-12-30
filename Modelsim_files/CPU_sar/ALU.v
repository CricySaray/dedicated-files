module ALU(op,a,b,s,n,v,c,z);

input [1:0]op;
input [31:0]a,b;
output[31:0]s;
output n,v,c,z;

wire [31:0]d,e,f,s1;

assign d=a&b;
assign e=a|b;
mux21_32 u0(f,d,e,op[0]);
add u2(a,b,op[0],s1,c,v,n);
mux21_32 u1(s,f,s1,op[1]);

assign z=~(|s);

endmodule





