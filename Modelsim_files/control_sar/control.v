module   control(clk,start,zero,opcode,writepc,selldst,writemem,writeir,selload,selst,writereg,selalua,selalub,aluop,writezero);

input clk,start,zero;
input [5:0] opcode;
output writepc,selldst,writemem,writeir,selload,selst,writereg,selalua,writezero;
output [1:0] selalub,aluop;

reg  [3:0]q;
wire [3:0]d;
wire  zero;

always @(posedge clk)
	begin
		if(start)
			q<=4'd0;
		else
			q<=d;									
	end	
assign d[0]=(~q[3]&~q[2]&~q[1]&~q[0])|((~q[3]&~q[2]&~q[1]&q[0])&(~opcode[3]&opcode[0]))|((~q[3]&~q[2]&~q[1]&q[0])&(opcode[3]&~opcode[2]&~opcode[1]&opcode[0]))|(~q[3]&~q[2]&q[1]&q[0])|(~q[3]&q[2]&~q[1]&q[0]);
assign d[1]=((~q[3]&~q[2]&~q[1]&q[0])&(~opcode[3]&~opcode[0]))|((~q[3]&~q[2]&~q[1]&q[0])&(~opcode[3]&opcode[0]))|(~q[3]&~q[2]&q[1]&~q[0])|(~q[3]&~q[2]&q[1]&q[0])|(q[3]&~q[2]&~q[1]&~q[0]);
assign d[2]=((~q[3]&~q[2]&~q[1]&q[0])&(opcode[3]&~opcode[2]&~opcode[1]&~opcode[0]))|((~q[3]&~q[2]&~q[1]&q[0])&(opcode[3]&~opcode[2]&~opcode[1]&opcode[0]))|(~q[3]&~q[2]&q[1]&~q[0])|(~q[3]&~q[2]&q[1]&q[0]);
assign d[3]=(~q[3]&q[2]&~q[1]&~q[0])|(~q[3]&q[2]&~q[1]&q[0])|(q[3]&~q[2]&~q[1]&~q[0]);
assign writepc=(~q[3]&~q[2]&~q[1]&~q[0])|((~q[3]&~q[2]&~q[1]&q[0])&((opcode[3]&opcode[2]&~opcode[1]&~opcode[0])|(opcode[3]&~opcode[2]&opcode[1]&~opcode[0]&~zero)|(opcode[3]&~opcode[2]&opcode[1]&opcode[0]&zero)));
assign selldst=(~q[3]&q[2]&~q[1]&~q[0])|(~q[3]&q[2]&~q[1]&q[0])|(q[3]&~q[2]&~q[1]&~q[0])|(q[3]&~q[2]&~q[1]&q[0])|(q[3]&~q[2]&q[1]&~q[0]);
assign writemem=q[3]&~q[2]&~q[1]&q[0];
assign writeir=~q[3]&~q[2]&~q[1]&~q[0];
assign selload=(~q[3]&q[2]&~q[1]&~q[0])|(q[3]&~q[2]&~q[1]&~q[0])|(q[3]&~q[2]&q[1]&~q[0]);
assign selst=(~q[3]&q[2]&~q[1]&q[0])|(q[3]&~q[2]&~q[1]&q[0]);
assign writereg=(~q[3]&q[2]&q[1]&~q[0])|(~q[3]&q[2]&q[1]&q[0])|(q[3]&~q[2]&q[1]&~q[0]);
assign selalua=(~q[3]&~q[2]&~q[1]&~q[0])|(~q[3]&~q[2]&~q[1]&q[0]);
assign selalub[1]=(~q[3]&~q[2]&~q[1]&~q[0])|(~q[3]&~q[2]&~q[1]&q[0]);
assign selalub[0]=(~q[3]&~q[2]&~q[1]&q[0])|(~q[3]&~q[2]&q[1]&q[0])|(~q[3]&q[2]&~q[1]&~q[0])|(~q[3]&q[2]&~q[1]&q[0])|(~q[3]&q[2]&q[1]&q[0])|(q[3]&~q[2]&~q[1]&~q[0])|(q[3]&~q[2]&~q[1]&q[0])|(q[3]&~q[2]&q[1]&~q[0]);
assign writezero=(~q[3]&q[2]&q[1]&~q[0])|(~q[3]&q[2]&q[1]&q[0]);
assign aluop[1]=(~q[3]&~q[2]&~q[1]&~q[0])|(~q[3]&~q[2]&~q[1]&q[0])|((~q[3]&~q[2]&q[1]&~q[0])&(~opcode[3]&opcode[2]))|((~q[3]&~q[2]&q[1]&q[0])&(~opcode[3]&opcode[2]))|(~q[3]&q[2]&~q[1]&~q[0])|(~q[3]&q[2]&~q[1]&q[0])|((~q[3]&q[2]&q[1]&~q[0])&(~opcode[3]&opcode[2]))|((~q[3]&q[2]&q[1]&q[0])&(~opcode[3]&opcode[2]))|(q[3]&~q[2]&~q[1]&~q[0])|(q[3]&~q[2]&~q[1]&q[0])|(q[3]&~q[2]&q[1]&~q[0]);
assign aluop[0]=((~q[3]&~q[2]&q[1]&~q[0])&(~opcode[3]&opcode[1]))|((~q[3]&~q[2]&q[1]&q[0])&(~opcode[3]&opcode[1]))|((~q[3]&q[2]&q[1]&~q[0])&(~opcode[3]&opcode[1]))|((~q[3]&q[2]&q[1]&q[0])&(~opcode[3]&opcode[1]));

endmodule
