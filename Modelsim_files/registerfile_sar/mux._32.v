module  mux_32(q,q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,
                             q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,
                             q26,q27,q28,q29,q30,q31,raddr);
     output[31:0] q;
     input[31:0] q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,
                         q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31;
     input[4:0] raddr;
     reg [31:0] q;
     always @(raddr or q0 or q1 or q2 or q3 or q4 or q5 or q6 or q7 or q8 or q9
                      or q10 or q11 or q12 or q13 or q14 or q15 or q16 or q17 or q18 
                      or q19 or q20 or q21 or q22 or q23 or q24 or q25 or q26 or q27 
                      or q28 or q29 or q30 or q31)
            case(raddr)
                   5'd0: q=q0;
                   5'd1: q=q1;
                   5'd2: q=q2;
                   5'd3: q=q3;
                   5'd4: q=q4;
                   5'd5: q=q5;
                   5'd6: q=q6;
                   5'd7: q=q7;
                   5'd8: q=q8;
                   5'd9: q=q9;
                   5'd10: q=q10;
                   5'd11: q=q11;
                   5'd12: q=q12;
                   5'd13: q=q13;
                   5'd14: q=q14;
                   5'd15: q=q15;
                   5'd16: q=q16;
                   5'd17: q=q17;
                   5'd18: q=q18;
                   5'd19: q=q19;
                   5'd20: q=q20;
                   5'd21: q=q21;
                   5'd22: q=q22;
                   5'd23: q=q23;
                   5'd24: q=q24;
                   5'd25: q=q25;
                   5'd26: q=q26;
                   5'd27: q=q27;
                   5'd28: q=q28;
                   5'd29: q=q29;
                   5'd30: q=q30;
                   5'd31: q=q31;
           endcase
endmodule 
