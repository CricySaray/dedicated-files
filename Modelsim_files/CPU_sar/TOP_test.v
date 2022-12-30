module TOP_test;

reg clk,rst,start,memwe;
reg [31:0] memin;
reg [4:0] memaddr;

wire zero,n,v,c;
wire [31:0] dataout;

TOP u(clk,rst,start,memwe,memin,memaddr,zero,n,v,c,dataout);

always #50 clk=~clk;

initial
  begin
     clk=1;
     rst=0;
     start=0;
#20  rst=1;       
//load instruction and data to memory.
#100 rst=0;
     memwe=1;
     memin=32'b001000_00000_11111_0000000000010000;//load r0,r31,16
     memaddr=5'd0;
#100 memwe=1;
     memin=32'b001001_00000_11111_0000000000010001;//store r0,r31,17
     memaddr=5'd1;
#100 memwe=1;
     memin=32'b001000_00001_11111_0000000000010001;//load r1,r31,17
     memaddr=5'd2;
#100 memwe=1;
     memin=32'b000001_00010_00000_0101010101010101;//andi r2,r0,16'b0101010101010101
     memaddr=5'd3;
#100 memwe=1;
     memin=32'b000101_00011_00010_0000000000001011;//addi r3,r2,16'b0000000000001011
     memaddr=5'd4;
#100 memwe=1;
     memin=32'b001100_11111111111111111111111011;//branch -5
     memaddr=5'd5;     
#100 memwe=1;
     memin=32'hFFFF_FFFF;//load data to memory 
     memaddr=5'd16;
//start to execuit instructions.
#100 memwe=0;
     start=1;
#100 start=0;
#10000 $stop;
end

endmodule