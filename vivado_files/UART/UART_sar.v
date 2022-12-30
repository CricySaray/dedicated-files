module UART_sar(reset, clk, byte_ready, data, txd, rxd, data_out); 
    input reset;
    input clk;
    input byte_ready;
    input [7:0] data;
    output txd;
    input rxd;
    output [7:0] data_out;

    UART_transmitter U1(.clk(clk),.reset(reset),.byte_ready(byte_ready),
                    .data(data),.TXD(txd));
    UART_receiver    U2(.clk(clk),.reset(reset),.RXD(rxd),.data_out(data_out));

endmodule

module UART_transmitter(clk,reset,byte_ready,data,TXD);
    input    clk,reset;
    input    byte_ready;    //load data control
    input    [7:0] data;
    output   TXD;      //serial data
    reg      [9:0] shift_reg;
    
    assign   TXD=shift_reg[0];
    
    always@(posedge clk or negedge reset)
    begin
        if(!reset)
            shift_reg<=10'b1111111111;
        else if(byte_ready)          
            shift_reg<={1'b1,data,1'b0};   //add start and stop bit
        else                     
            shift_reg<={1'b1,shift_reg[9:1]};  //output serial data
    end
endmodule

module UART_receiver(clk,reset,RXD,data_out);
    parameter  idle=2'b00;
    parameter  receiving=2'b01;
    
    input   clk,reset;
    input   RXD;           //serial data
    output  [7:0] data_out;
    
    reg     shift;           //shift control
    reg     inc_count;      //increase counter control
    reg     [7:0] data_out;
    reg     [7:0] shift_reg;
    reg     [3:0] count;
    reg     [2:0] state,next_state;

always@(state or RXD or count)
    begin
//        shift<=0;
//        inc_count<=0;
//        next_state<=state;
    case(state)
        idle:
            begin 
                if(!RXD)
                    next_state<=receiving;//check the start bit
                else
                    next_state <= idle;
                shift <= 0;
                inc_count <= 0;
            end
        receiving:
            begin
                if(count==8)
                    begin
//                data_out=shift_reg;         //output data
                        next_state<=idle;
//                		count<=0;                 //clear counter
                        inc_count<=0;
                        shift <= 0;
                    end
                else
                    begin
                    inc_count<=1;
                    shift<=1;
                    next_state <= receiving;
                end
            end
        default:next_state<=idle;
    endcase
    end
    
always@(posedge clk or negedge reset)
    begin
    if(!reset)
        begin
        data_out<=8'b0;
        count<=0;
        state<=idle;	
        shift_reg <= 8'b0;
        end
    else 
        begin
            state<=next_state;
            if(shift)
            shift_reg<={RXD, shift_reg[7:1]};  //receive serial data
            if(inc_count)
                begin 
                    count<=count+1;
                end
            if (count==8) 
                begin 
                    data_out <= shift_reg;
                    count <= 0;
                end
        
        end
    end
endmodule