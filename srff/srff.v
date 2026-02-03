module srff(
    input s,r,clk,
    output q,qbar   
);
wire nand1,nand2;
nand n1(nand1,s,clk);
nand n2(nand2,r,clk);
nand n3(q,nand1,qbar);
nand n4(qbar,nand2,q);
endmodule

module top();
reg s,r,clk;
wire q,qbar;
srff m1(s,r,clk,q,qbar);
initial begin
    force q = 0;
    force qbar = 1;
    #1; 
    release q;
    release qbar;
    s = 1'b0; r = 1'b0; clk = 1'b0;
    $monitor($time," clk = %b | s = %b | r = %b | q = %b",clk,s,r,q);
    #1000 $finish;
end
    always #30 clk = ~clk;
    always #60 s = ~s;
    always #120 r = ~r;


endmodule