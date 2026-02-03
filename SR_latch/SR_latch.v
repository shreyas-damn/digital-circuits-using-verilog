//module
module sr_latch(q, qbar, sbar, rbar);
//port declaration
input sbar, rbar;
output q, qbar;
//instantiate lower level modules
nand n1(q, sbar,qbar);
nand n2(qbar, rbar, q);
endmodule

//stimulus module
module top;
//declarations of wires, reg
wire q, qbar;
reg set, reset;
//instantiate sr_latch module
sr_latch m1(q,qbar,~set,~reset);
//behavioural block
initial begin
    $monitor($time, "set = %b, reset = %b, q = %b \n",set,reset,q);
    set = 0; reset = 0;
    #5 reset = 1;
    #5 reset = 0;
    #5 set = 1;
end
endmodule