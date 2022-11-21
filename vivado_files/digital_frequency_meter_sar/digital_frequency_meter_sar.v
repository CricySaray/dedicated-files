module digital_frequency_meter_sar(
    input wire clk_1Hz,
    input wire fin,
    input wire rst_n,
    output wire [3:0] d0,
    output wire [3:0] d1,
    output wire [3:0] d2,
    output wire [3:0] d3,
    output wire [3:0] d4,
    output wire [3:0] d5,
    output wire [3:0] d6,
    output wire [3:0] d7
);
    wire [3:0] q0, q1, q2, q3, q4, q5, q6, q7;
    wire count_en, latch_en, clear;

    //control module
    control control(
        clk_1Hz,
        rst_n,
        count_en,
        latch_en,
        clear
    );

    //counter module
    counter_10 counter0(.en_in(count_en), .clear(clear), .rst_n(rst_n), .fin(fin), .en_out(en_out0), .q(q0));
    counter_10 counter1(.en_in(en_out0), .clear(clear), .rst_n(rst_n), .fin(fin), .en_out(en_out1), .q(q1));
    counter_10 counter2(.en_in(en_out1), .clear(clear), .rst_n(rst_n), .fin(fin), .en_out(en_out2), .q(q2));
    counter_10 counter3(.en_in(en_out2), .clear(clear), .rst_n(rst_n), .fin(fin), .en_out(en_out3), .q(q3));
    counter_10 counter4(.en_in(en_out3), .clear(clear), .rst_n(rst_n), .fin(fin), .en_out(en_out4), .q(q4));
    counter_10 counter5(.en_in(en_out4), .clear(clear), .rst_n(rst_n), .fin(fin), .en_out(en_out5), .q(q5));
    counter_10 counter6(.en_in(en_out5), .clear(clear), .rst_n(rst_n), .fin(fin), .en_out(en_out6), .q(q6));
    counter_10 counter7(.en_in(en_out6), .clear(clear), .rst_n(rst_n), .fin(fin), .en_out(en_out7), .q(q7));

    //latch module
    latch u1(
        .clk_1Hz(clk_1Hz),
        .rst_n(rst_n),
        .latch_en(latch_en),

        .q0(q0), 
        .q1(q1), 
        .q2(q2), 
        .q3(q3), 
        .q4(q4), 
        .q5(q5), 
        .q6(q6), 
        .q7(q7),

        .d0(d0), 
        .d1(d1), 
        .d2(d2), 
        .d3(d3), 
        .d4(d4), 
        .d5(d5), 
        .d6(d6), 
        .d7(d7)
    );


endmodule