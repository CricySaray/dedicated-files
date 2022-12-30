/*  signal definition
clk;                The clock input
rst_n;              signal of system reset
half_dollar;        put in a nickel
one_dollar;         put in 1 dollar coin
change_out;         the change signal
dispense;           it means machine sells a drink
collect;            The signal is used to prompt the coin-hopper to pick up the drink
*/

module automatic_sale_of_beverage_machine_sar(
    one_dollar,
    half_dollar,
    collect,
    change_out,
    dispense,
    rst_n,
    clk
);
parameter idle = 0, half = 1, one = 2, two = 3, three = 4;
//idle, one, half, two, three are intermediate variables
input one_dollar, half_dollar, rst_n, clk;
output collect, change_out, dispense;
reg collect, change_out, dispense;
reg [2:0] D;

always@(posedge clk, negedge rst_n) begin
    if(!rst_n) begin
        dispense = 0; collect = 0; change_out = 0; D = idle;
    end
    case(D)
    idle: if(half_dollar) D = half;
    else if (one_dollar) D = one;
    half: if (half_dollar) D = one;
    else if (one_dollar) D = two;   //1.5
    one: if (half_dollar) D = two;  //1.5
    else if (one_dollar) D = three; //2
    two: if (half_dollar) D = three;    //2
    else if (one_dollar) begin
        dispense = 1;   //sell drink
        collect = 1;
        D = idle;
    end
    three: if (half_dollar) begin
        dispense = 1;   //sell drink
        collect = 1;
        D = idle;
    end
    else if (one_dollar) begin
        dispense = 1;   //sell drink 
        collect = 1;
        change_out = 1;
        D = idle;
    end
    endcase
end
endmodule