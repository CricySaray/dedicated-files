module mux41_32(e,a,b,c,d,s);

output[31:0] e;
input[31:0] a,b,c,d;
input [1:0] s;

reg [31:0] e;

always @(s or a or b or c or d)
case(s)
2'd0: e=a;
2'd1: e=b;
2'd2: e=c;
2'd3: e=d;
endcase

endmodule