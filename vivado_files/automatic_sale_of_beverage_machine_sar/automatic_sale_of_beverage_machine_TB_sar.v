`timescale 1ps/1ps

module stimulus_sar;
    reg one_dollar, half_dollar, rst_n, clk;
    wire collect, change_out, dispense;

    automatic_sale_of_beverage_machine_sar eg1(
        one_dollar,
        half_dollar,
        collect,
        change_out,
        dispense,
        rst_n,
        clk
    );

    initial begin
        clk = 0;
        rst_n = 0;
        one_dollar = 0;
        half_dollar = 0;
    end

    always begin
        #1 clk = ~clk;
    end

    initial begin
        #4 rst_n = ~rst_n;

        #2 one_dollar = ~one_dollar;
        #2 one_dollar = ~one_dollar;

        #2 half_dollar = ~half_dollar;
        #2 half_dollar = ~half_dollar;

        #2 one_dollar = ~one_dollar;
        #2 one_dollar = ~one_dollar;

        #2 rst_n = ~rst_n;


        #4 rst_n = ~rst_n;

        #2 one_dollar = ~one_dollar;
        #2 one_dollar = ~one_dollar;

        #2 one_dollar = ~one_dollar;
        #2 one_dollar = ~one_dollar;

        #2 one_dollar = ~one_dollar;
        #2 one_dollar = ~one_dollar;

        #2 rst_n = ~rst_n;


        #2 half_dollar = ~half_dollar;
        #2 half_dollar = ~half_dollar;

        #2 half_dollar = ~half_dollar;
        #2 half_dollar = ~half_dollar;

        #2 half_dollar = ~half_dollar;
        #2 half_dollar = ~half_dollar;

        #2 half_dollar = ~half_dollar;
        #2 half_dollar = ~half_dollar;

        #2 half_dollar = ~half_dollar;
        #2 half_dollar = ~half_dollar;

        #2 rst_n = ~rst_n;


    end
endmodule