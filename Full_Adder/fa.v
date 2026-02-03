`timescale 1ns/1ps
module fa(
    input ain,bin,cin,
    output sum,cout
);
assign sum = ain^bin^cin;
assign cout = (ain & bin)|(ain & cin)|(bin & cin);
endmodule

module pa(
    input a1,b1,cin,a2,b2,a3,b3,a4,b4,
    output sum1,sum2,sum3,sum4,cout
);

wire c1,c2,c3;
fa m1(a1,b1,cin,sum1,c1);
fa m2(a2,b2,c1,sum2,c2);
fa m3(a3,b3,c2,sum3,c3);
fa m4(a4,b4,c3,sum4,cout);

endmodule

module tb_pa;

    reg a1, b1, cin;
    reg a2, b2;
    reg a3, b3;
    reg a4, b4;

    wire sum1, sum2, sum3, sum4, cout;

    // Instantiate DUT
    pa dut (
        .a1(a1), .b1(b1), .cin(cin),
        .a2(a2), .b2(b2),
        .a3(a3), .b3(b3),
        .a4(a4), .b4(b4),
        .sum1(sum1), .sum2(sum2),
        .sum3(sum3), .sum4(sum4),
        .cout(cout)
    );

    initial begin
        $dumpfile("adder.vcd");
        $dumpvars(0, tb_pa);

        $display("Time | A4A3A2A1 + B4B3B2B1 | Cin || Cout Sum4Sum3Sum2Sum1");
        $display("---------------------------------------------------------");

        {a4,a3,a2,a1} = 4'b0000;
        {b4,b3,b2,b1} = 4'b0000; cin = 0; #10;

        {a4,a3,a2,a1} = 4'b0001;
        {b4,b3,b2,b1} = 4'b0001; cin = 0; #10;

        {a4,a3,a2,a1} = 4'b0011;
        {b4,b3,b2,b1} = 4'b0101; cin = 0; #10;

        {a4,a3,a2,a1} = 4'b1111;
        {b4,b3,b2,b1} = 4'b0001; cin = 0; #10;

        {a4,a3,a2,a1} = 4'b1010;
        {b4,b3,b2,b1} = 4'b0101; cin = 1; #10;

        $finish;
    end

    initial begin
        $monitor("  %4t |  %b%b%b%b + %b%b%b%b |  %b  ||   %b    %b%b%b%b",
                 $time,
                 a4,a3,a2,a1,
                 b4,b3,b2,b1,
                 cin,
                 cout,
                 sum4,sum3,sum2,sum1);
    end

endmodule