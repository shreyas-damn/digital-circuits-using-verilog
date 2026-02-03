module mux41(
    output reg y,
    input s1,s0,
    input i0,i1,i2,i3
);
always @(*) begin
    case({s1,s0})
        2'b00 : y = i0;
        2'b01 : y = i1;
        2'b10 : y = i2;
        2'b11 : y = i3;
    endcase
end
endmodule

module top;
reg i0,i1,i2,i3;
reg s0,s1;
wire y;
mux41 m1(y, s1, s0, i0, i1, i2, i3);
initial 
begin 
    $dumpfile("mux41_test.vcd"); // Name of the output file
    $dumpvars(0, top);     
    $monitor($time, "S0 = %b, S1 = %b, Y = %b", s0, s1, y);
    i0 = 1; i1 = 0; i2 = 1; i3 = 0;
    s1 = 0; s0 = 0; #5;
    s1 = 0; s0 = 1; #5;
    s1 = 1; s0 = 0; #5;
    s1 = 1; s0 = 1; #5;
end
endmodule


