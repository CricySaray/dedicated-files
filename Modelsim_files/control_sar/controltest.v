module controltest;

reg clk,rst,zero;
reg [5:0] opcode;
wire writepc,selldst,writemem,writeir,selload,selst,writereg,selalua,writezero;
wire [1:0] selalub,aluop;

control con(clk,rst,zero,opcode,writepc,selldst,writemem,writeir,selload,selst,writereg,selalua,selalub,aluop,writezero);

always #50 clk=~clk;

initial
  begin
    clk=1;
    rst=0;
#20 rst=1;
#100 rst=0;//IF
#100 opcode=6'd0;//ID and rd,rs1,rs2     
#100//EXE
#100//WB

#100//IF     
#100 opcode=6'd1;//ID andi rd,rs1,imme
#100//EXE
#100//WB

#100//IF     
#100 opcode=6'd2;//ID or rd,rs1,rs2
#100//EXE
#100//WB

#100//IF     
#100 opcode=6'd3;//ID ori rd,rs1,imme
#100//EXE
#100//WB

#100//IF     
#100 opcode=6'd4;//ID add rd,rs1,rs2
#100//EXE
#100//WB

#100//IF     
#100 opcode=6'd5;//ID addi rd,rs1,imme
#100//EXE
#100//WB

#100//IF     
#100 opcode=6'd6;//ID sub rd,rs1,rs2
#100//EXE
#100//WB

#100//IF     
#100 opcode=6'd7;//ID subi rd,rs1,imme
#100//EXE
#100//WB

#100//IF     
#100 opcode=6'd8;//ID load rd,rs1,imme
#100//EXE
#100//MEM
#100//WB

#100//IF     
#100 opcode=6'd9;//ID store rd,rs1,imme
#100//EXE
#100//MEM

#100//IF     
#100 opcode=6'd10;//ID bne disp
     zero=1;
     
#100//IF     
#100 opcode=6'd10;//ID bne disp
     zero=0;

#100//IF     
#100 opcode=6'd11;//ID beq disp
     zero=1;
     
#100//IF     
#100 opcode=6'd11;//ID beq disp
     zero=0;

#100//IF     
#100 opcode=6'd12;//ID branch disp
     

#100 $stop;
end

endmodule