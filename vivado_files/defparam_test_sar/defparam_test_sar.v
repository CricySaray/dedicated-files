//define the module hello_world
module hello_world;
parameter id_num = 0;   //define the module ID as 0

initial begin
    $display("Displaying hello_world id number = %d", id_num);
end
endmodule

module top;
//change the parameter values in the referenced instance module with the defparam statement
defparam w1.id_num = 1, w2.id_num = 2;

//call two hello_world instance modules
hello_world w1();
hello_world w2();
//hello_world #(1) w1;
//hello_world #(.id_num(2)) w2;
endmodule