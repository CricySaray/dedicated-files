module fulladd4_sar(sum, c_out, a, b, c_in);
	output [3:0] sum;
	output c_out;
	input[3:0] a, b;
	input c_in;
	wire c1, c2, c3;
	fulladd_sar fa0(sum[0], c1, a[0], b[0], c_in);
	fulladd_sar fa1(sum[1], c2, a[1], b[1], c1);
	fulladd_sar fa2(sum[2], c3, a[2], b[2], c2);
	fulladd_sar fa3(sum[3], c_out, a[3], b[3], c3);
endmodule

