module d_latch(
    input d,e,
    output q, qbar
);
wire not1,and1,and2;
not n1(not1,d);
and a1(and1,not1,e);
and a2(and2,d,e);
nor o1(q,and1,qbar);
nor o2(qbar,and2,q);

endmodule

module top;
wire q,qbar;
reg d,e;
d_latch d1( d,e,q,qbar);
initial
begin
    $monitor($time, "E = %b, D = %b, Q = %b \n",e,d,q);
    e = 0; d = 0; #10;
    e = 0; d = 1; #10;
    e = 1; d = 0; #10;
    e = 1; d = 1; #10;
end
endmodule