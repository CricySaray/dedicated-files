`define TRUE 1'b1
`define FALSE 1'b0

//delay
`define Y2RDELAY 3  //delay from yellow to red 
`define R2GDELAY 2  //delay from red to green

module sig_control (hwy, cntry, X, clock, clear);

//input/output port declaration
output [1:0] hwy, cntry;
        //represents a 2-bit output of 3 states

reg [1:0] hwy, cntry;
        //declare the output to be of the register type

input X;
        //if true, it means that the car passes the country road

input clock, clear;
        //the state of the triffic light

parameter RED = 2'd0, YELLOW = 2'd1, GREEN = 2'd2;

//state definition
//                            HWY         CNTRY
parameter S0 = 3'd0,    // GREEN        RED
            S1 = 3'd1,  // YELLOW       RED
            S2 = 3'd2,  // RED          RED
            S3 = 3'd3,  // RED          GREEN
            S4 = 3'd4;  // RED          YELLOW

//internal state variable
reg [2:0] state;
reg [2:0] next_state;

//state only change when it has the posedge of the clock signal
always @(posedge clock)
    if (clear)
        state <= S0;    //state of the controller starts from S0
    else
        state <= next_state;    //change of the state

//calculate the value of main road and country road
always @(state)
begin
    hwy = GREEN;    //the default color assignment for the main signal light
    cntry = RED;      //the default color assignment for the country signal light
    case (state)
        S0: ;
        S1: hwy = YELLOW;
        S2: hwy = RED;
        S3: begin
            hwy = RED;
            cntry = GREEN;
        end
        S4: begin
            hwy = RED;
            cntry = YELLOW;
        end
    endcase
end

//use CASE statements to describe the state machine
always @(state, X)
begin
    case (state)
    S0: if(X)
        next_state = S1;
        else
        next_state = S0;
    S1: begin
        repeat(`Y2RDELAY) @(posedge clock);
        next_state = S2;
    end
    S2: begin
        repeat (`R2GDELAY) @(posedge clock);
        next_state = S3;
    end
    S3: if(X)
    next_state = S3;
    else
    next_state = S4;
    S4: begin
        repeat(`Y2RDELAY)@(posedge clock);
        next_state = S0;
    end
    default: next_state = S0;
endcase
end

endmodule
