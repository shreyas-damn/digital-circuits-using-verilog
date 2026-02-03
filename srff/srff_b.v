module srff(
    input s,r,clk,
    output reg q,qbar
);
always @(posedge clk) begin
     case({s,r})
        1'b10 :  q = 1'b1;
        1'b01 ; q = 1'b0;
        

    endcase
end
endmodule

module top();
re


endmodule