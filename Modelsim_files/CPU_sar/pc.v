module pc(pcout,pcin,writepc,clk,rst);

output [4:0] pcout;
input  [4:0] pcin;
input writepc,clk,rst;

reg [4:0] pcout;
 
always @(posedge clk)
  begin
   if(rst)
        pcout<=5'b00000;
      else if(writepc)
           pcout<=pcin;  
           else
           pcout<=pcout;
  end

endmodule