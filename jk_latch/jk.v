module jk_latch(
    input j, k,
    output q, qbar  // Remove the 'reg' keyword here
);
    wire nand1, nand2;

    // These primitives (nand) automatically drive the wires q and qbar
    nand #1 n1(nand1, j, qbar);
    nand #1 n2(nand2, k, q);
    nand #1 n3(q, nand1, qbar);
    nand #1 n4(qbar, nand2, q);

endmodule

module top();
    reg j, k;
    wire q, qbar; // These must be wires to connect to the module

    jk_latch m1(j, k, q, qbar);

    initial begin
        $monitor($time, " j=%b, k=%b, q=%b", j, k, q);

        // 1. Force a starting state (otherwise q will be 'x')
        force m1.q = 0; 
        force m1.qbar = 1;
        j = 0; k = 0;
        #5;
        
        // 2. Release so the gates can actually function
        release m1.q;
        release m1.qbar;

        // 3. Run your tests
        #10 j = 1; k = 0; // Set
        #10 j = 0; k = 1; // Reset
        #10 j = 1; k = 1; // Toggle (will oscillate)
        #20 $finish;
    end
endmodule