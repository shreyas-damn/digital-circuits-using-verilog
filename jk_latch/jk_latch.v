module jk_latch(
    input j,k,
    output reg q,qbar
);
wire nand1,nand2;
nand n1(nand1,j,qbar);
nand n2(nand2,k,q);
nand n3(q,nand1,qbar);
nand n4(qbar,nand2,q);
endmodule

module top()
reg j,k;
wire q,qbar;
jk_latch m1(j,k,q,qbar);
initial begin
    $monitor($time,"j = %b, k = %b, q = %b",j,k,q);
    q = 0; qbar = 0;
    j = 0; k = 0; #10;
    j = 0; k = 1; #10;
    j = 1; k = 0; #10;
    j = 1; k = 1; #10;

end


endmodule