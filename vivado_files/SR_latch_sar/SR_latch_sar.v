module SR_latch_sar(Q, Qbar, Sbar, Rbar);
output Q, Qbar;
input Sbar, Rbar;
    nand n1(Q, Sbar, Qbar);
    nand n2(Qbar, Rbar, Q);
endmodule
