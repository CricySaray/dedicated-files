`timescale 1ns / 1ns
module registerfile_test;
     wire [31:0]q11,q22;
     reg [31:0]data;
     reg [4:0]waddr;
     reg [4:0]raddr1,raddr2;
     reg clk,reset,we;
     registerfile r(q11,q22,data,clk,reset,we,waddr,raddr1,raddr2);
     always #50 clk=~clk;
     initial
          begin 
                clk=0;
                reset=1;
                we=0;
                #120 reset=0;
                        data=32'd2008040112;
                        we=1;
                        waddr=5'd0;
                #100 data=32'd2008040113;
                         waddr=5'd1;
                #100 data=32'd2008040114;
                         waddr=5'd2;
                #100 data=32'd2008040115;
                         waddr=5'd3;
                #100 data=32'd2008040116;
                         waddr=5'd4;
                #100 data=32'd2008040117;
                         waddr=5'd5;
                #100 data=32'd2008040118;
                         waddr=5'd6;
                #100 data=32'd2008040119;
                         waddr=5'd7;
                #100 data=32'd2008040120;
                         waddr=5'd8;
                #100 data=32'd2008040121;
                         waddr=5'd9;
                #100 data=32'd2008040122;
                         waddr=5'd10;
                #100 data=32'd2008040123;
                         waddr=5'd11;
                #100 data=32'd2008040124;
                         waddr=5'd12;
                #100 data=32'd2008040125;
                         waddr=5'd13;
                #100 data=32'd2008040126;
                         waddr=5'd14;
                #100 data=32'd2008040127;
                         waddr=5'd15;
                #100 data=32'd2008040128;
                         waddr=5'd16; 
                #100 data=32'd2008040129;
                         waddr=5'd17;
                #100 data=32'd2008040130;
                         waddr=5'd18;
                #100 data=32'd2008040131;
                         waddr=5'd19;
                #100 data=32'd2008040132;
                         waddr=5'd20;
                #100 data=32'd2008040133;
                         waddr=5'd21;
                #100 data=32'd2008040134;
                         waddr=5'd22;
                #100 data=32'd2008040135;
                         waddr=5'd23;
                #100 data=32'd2008040136;
                         waddr=5'd24; 
                #100 data=32'd2008040137;
                         waddr=5'd25; 
                #100 data=32'd2008040138;
                         waddr=5'd26;
                #100 data=32'd2008040139;
                         waddr=5'd27;
                #100 data=32'd2008040140;
                         waddr=5'd28;
                #100 data=32'd2008040141;
                         waddr=5'd29;
                #100 data=32'd2008040142;
                         waddr=5'd30;
                #100 data=32'd2008040143;
                         waddr=5'd31;

                #100 we=0;
                   raddr1=5'd0;
                         raddr2=5'd1;
                #100 raddr1=5'd1;
                         raddr2=5'd2; 
                #100 raddr1=5'd2;
                         raddr2=5'd3;
                #100 raddr1=5'd3;
                         raddr2=5'd4;
                #100 raddr1=5'd4;
                         raddr2=5'd5;
                #100 raddr1=5'd5;
                         raddr2=5'd6;
                #100 raddr1=5'd6;
                         raddr2=5'd7;
                #100 raddr1=5'd7;
                         raddr2=5'd8;
                #100 raddr1=5'd8;
                         raddr2=5'd9;
                #100 raddr1=5'd9;
                         raddr2=5'd10;
                #100 raddr1=5'd10;
                         raddr2=5'd11; 
                #100 raddr1=5'd11;
                         raddr2=5'd12;
                #100 raddr1=5'd12;
                         raddr2=5'd13;
                #100 raddr1=5'd13;
                         raddr2=5'd14;
                #100 raddr1=5'd14;
                         raddr2=5'd15;
                #100 raddr1=5'd15;
                         raddr2=5'd16;
                #100 raddr1=5'd16;
                         raddr2=5'd17;
                #100 raddr1=5'd17;
                         raddr2=5'd18;
                #100 raddr1=5'd18;
                         raddr2=5'd19;
                #100 raddr1=5'd19;
                         raddr2=5'd20; 
                #100 raddr1=5'd20;
                         raddr2=5'd21;
                #100 raddr1=5'd21;
                         raddr2=5'd22;
                #100 raddr1=5'd22;
                         raddr2=5'd23;
                #100 raddr1=5'd23;
                         raddr2=5'd24;
                #100 raddr1=5'd24;
                         raddr2=5'd25;
                #100 raddr1=5'd25;
                         raddr2=5'd26;
                #100 raddr1=5'd26;
                         raddr2=5'd27;
                #100 raddr1=5'd27;
                         raddr2=5'd28;
                #100 raddr1=5'd28;
                         raddr2=5'd29;
                #100 raddr1=5'd29;
                         raddr2=5'd30;
                #100 raddr1=5'd30;
                         raddr2=5'd31;
                #100 raddr1=5'd31;
                         raddr2=5'd0;
                #200 $stop;
          end  
endmodule 
