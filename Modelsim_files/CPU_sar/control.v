module   control(clk,rst,start,zero,opcode,writepc,selldst,writemem,writeir,selload,selst,writereg,selalua,selalub,aluop,writezero);

input clk,rst,start,zero;
input [5:0] opcode;
output writepc,selldst,writemem,writeir,selload,selst,writereg,selalua,writezero;
output [1:0] selalub,aluop;

reg  [3:0] state;
reg  [3:0] next_state;
wire  zero;

wire op_and,op_andi,op_or,op_ori,op_add,op_addi,op_sub,op_subi,op_load,op_store,op_bne,op_beq,op_branch;
wire BR,RR,RI,BT,OP0,OP1;

always @(posedge clk)
	begin
		if(rst)
			state<=4'd0;
		else
			state<=next_state;									
	end	

assign op_and=~opcode[5] & ~opcode[4] & ~opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0];
assign op_andi=~opcode[5] & ~opcode[4] & ~opcode[3] & ~opcode[2] & ~opcode[1] & opcode[0];
assign op_or=~opcode[5] & ~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[1] & ~opcode[0];
assign op_ori=~opcode[5] & ~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[1] & opcode[0];
assign op_add=~opcode[5] & ~opcode[4] & ~opcode[3] & opcode[2] & ~opcode[1] & ~opcode[0];
assign op_addi=~opcode[5] & ~opcode[4] & ~opcode[3] & opcode[2] & ~opcode[1] & opcode[0];
assign op_sub=~opcode[5] & ~opcode[4] & ~opcode[3] & opcode[2] & opcode[1] & ~opcode[0];
assign op_subi=~opcode[5] & ~opcode[4] & ~opcode[3] & opcode[2] & opcode[1] & opcode[0];
assign op_load=~opcode[5] & ~opcode[4] & opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0];
assign op_store=~opcode[5] & ~opcode[4] & opcode[3] & ~opcode[2] & ~opcode[1] & opcode[0];
assign op_bne=~opcode[5] & ~opcode[4] & opcode[3] & ~opcode[2] & opcode[1] & ~opcode[0];
assign op_beq=~opcode[5] & ~opcode[4] & opcode[3] & ~opcode[2] & opcode[1] & opcode[0];
assign op_branch=~opcode[5] & ~opcode[4] & opcode[3] & opcode[2] & ~opcode[1] & ~opcode[0];

assign BR=op_bne|op_beq|op_branch;
assign RR=op_and|op_or|op_add|op_sub;
assign RI=op_andi|op_ori|op_addi|op_subi;
assign BT=op_branch|op_bne&~zero|op_beq&zero;
assign OP0=op_or|op_ori|op_sub|op_subi;
assign OP1=op_add|op_addi|op_sub|op_subi;

//next state generation
always @ (*)
    case(state)
        4'd0: if(start)
                 next_state=4'd1;
              else
                 next_state=4'd0; 
        4'd1: next_state=4'd2;
        4'd2: if(BR)
                 next_state=4'd1;
              else if(RR)
                 next_state=4'd3;
              else if(RI)
                 next_state=4'd4;
              else if(op_load)
                 next_state=4'd5;
              else if(op_store)
                 next_state=4'd6;
              else
                 next_state=4'd0;
        4'd3: next_state=4'd7;
        4'd4: next_state=4'd8;
        4'd5: next_state=4'd9;
        4'd6: next_state=4'd10;
        4'd7: next_state=4'd1;
        4'd8: next_state=4'd1;
        4'd9: next_state=4'd11;
        4'd10: next_state=4'd1;
        4'd11: next_state=4'd1;
        default: next_state=4'd0;
    endcase   

//control signal
assign writepc=(state==4'd1)|(state==4'd2)&BT;
assign selldst=(state==4'd5)|(state==4'd6)|(state==4'd9)|(state==4'd10)|(state==4'd11);
assign writemem=(state==4'd10);
assign writeir=(state==4'd1);
assign selload=(state==4'd5)|(state==4'd9)|(state==4'd11);
assign selst=(state==4'd6)|(state==4'd10);
assign writereg=(state==4'd7)|(state==4'd8)|(state==4'd11);
assign selalua=(state==4'd1)|(state==4'd2);
assign selalub[1]=(state==4'd1)|(state==4'd2);
assign selalub[0]=(state==4'd2)|(state==4'd4)|(state==4'd5)|(state==4'd6)|(state==4'd8)|(state==4'd9)|(state==4'd10)|(state==4'd11);
assign writezero=(state==4'd7)|(state==4'd8);
assign aluop[1]=(state==4'd1)|(state==4'd2)|(state==4'd5)|(state==4'd6)|(state==4'd9)|(state==4'd10)|(state==4'd11)|((state==4'd3)|(state==4'd4)|(state==4'd7)|(state==4'd8))&OP1;
assign aluop[0]=((state==4'd3)|(state==4'd4)|(state==4'd7)|(state==4'd8))&OP0;
/*
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
*/

endmodule
