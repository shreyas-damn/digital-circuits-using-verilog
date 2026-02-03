module mux81(
    output reg y,
    input s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7
);
always @(*) begin
    case({s0,s1,s2})
        3'b000 : y = i0;
        3'b001 : y = i1;
        3'b010 : y = i2;
        3'b011 : y = i3;
        3'b100 : y = i4;
        3'b101 : y = i5;
        3'b110 : y = i6;
        3'b111 : y = i7;
    endcase
end
endmodule

module top;
wire y;
reg s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7;
mux81 m1(y,s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7);
initial begin
    $dumpfile("mux81_test.vcd");
    $dumpvars(0,top);
    $monitor($time, "s0 = %b, s1 = %b, s2 = %b, y = %b", s0,s1,s2,y);
    i0 = 1; i1 = 0; i2 = 1; i3 = 0; i4 = 1; i5 = 0; i6 = 1; i7 = 0;
    s0 = 0; s1 = 0; s2 = 0; #10;
    s0 = 0; s1 = 0; s2 = 1; #10;
    s0 = 0; s1 = 1; s2 = 0; #10;
    s0 = 0; s1 = 1; s2 = 1; #10;
    s0 = 1; s1 = 0; s2 = 0; #10;
    s0 = 1; s1 = 0; s2 = 1; #10;
    s0 = 1; s1 = 1; s2 = 0; #10;
    s0 = 1; s1 = 1; s2 = 1; #10;
end
endmodule