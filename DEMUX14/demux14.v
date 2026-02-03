module demux41(
    input i,s0,s1,
    output reg y0,y1,y2,y3
);
always @(*) begin
    y0 = 0; y1 = 0; y2 = 0; y3 = 0;
    case({s0,s1})
        2'b00 : y0 = i;
        2'b01 : y1 = i;
        2'b10 : y2 = i;
        2'b11 : y3 = i;
    endcase

end
endmodule

module top;
reg i,s0,s1;
wire y0,y1,y2,y3;
demux41 m1(i,s0,s1,y0,y1,y2,y3);
initial
begin   
    $monitor($time, "   s0 = %b, s1 = %b, y0 = %b, y1 = %b, y2 = %b, y3 = %b",s0,s1,y0,y1,y2,y3);
    i = 1;
    s0 = 0; s1 = 0; #10;
    s0 = 0; s1 = 1; #10;
    s0 = 1; s1 = 0; #10;
    s0 = 1; s1 = 1; #10;
end

endmodule