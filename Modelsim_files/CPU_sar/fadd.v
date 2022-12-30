module fadd(a,b,s,ci,co);

input a,b,ci;
output s,co;

reg s,co;

always @ (a or b or ci)
begin 

s<=(a&~b&~ci)|(~a&b&~ci)|(~a&~b&ci)|(a&b&ci);
co<=(a&b)|(a&ci)|(b&ci);

end

endmodule