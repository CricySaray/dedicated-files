module mux21_32(f,a,b,s);

output[31:0] f;
input[31:0] a,b;
input s;

reg [31:0] f;

always @(s or a or b)
case(s)
1'd0: f=a;
1'd1: f=b;
endcase

endmodule