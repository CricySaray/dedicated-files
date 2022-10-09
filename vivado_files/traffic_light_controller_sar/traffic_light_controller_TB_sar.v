//`timescale 1ms/1ms
module stimulus;

wire [1:0] MAIN_SIG, CNTRY_SIG;
reg CAR_ON_CNTRY_RD;    //if true, indicates there is a car on the contry road
reg CLOCK, CLEAR;
sig_control SC(MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD, CLOCK, CLEAR);

//set up monitering system tasks
initial
$monitor($time, "Main Sig = %b   Country Sig = $b   Car_on_cntry = %b", MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD);

//set the clock
initial
begin
    CLOCK = `FALSE;
    forever begin
        #1 CLOCK = ~CLOCK;  
    end
end

//control zore clearing signal
initial
begin
    CLEAR = `TRUE;
    repeat (5) @(negedge CLOCK);
    CLEAR = `FALSE;
end

//apple excitation signal
initial
begin
    CAR_ON_CNTRY_RD = `FALSE;

    repeat (20) @(negedge CLOCK); CAR_ON_CNTRY_RD = `TRUE;
    repeat (10) @(negedge CLOCK); CAR_ON_CNTRY_RD = `FALSE;

    repeat (20) @(negedge CLOCK); CAR_ON_CNTRY_RD = `TRUE;
    repeat (10) @(negedge CLOCK); CAR_ON_CNTRY_RD = `FALSE;

    repeat (20) @(negedge CLOCK); CAR_ON_CNTRY_RD = `TRUE;
    repeat (10) @(negedge CLOCK); CAR_ON_CNTRY_RD = `FALSE;

    repeat (10) @(negedge CLOCK); $stop;
end
endmodule