`include "counter.v"
`timescale 1ns/1ps

module counter_test;

    //INPUTS
    reg A;

    //OUTPUTS
    wire [3:0] B;

    //UNIT UNDER TEST
    top UUT(A,B);

    
    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, counter_test);
        $display("START OF TEST");
        A = 1'b1; #5 ; A = 1'b0; #5; $display("%b", B);
        A = 1'b1; #5 ; A = 1'b0; #5; $display("%b", B);
        A = 1'b1; #5 ; A = 1'b0; #5; $display("%b", B);
        A = 1'b1; #5 ; A = 1'b0; #5; $display("%b", B);
        A = 1'b1; #5 ; A = 1'b0; #5; $display("%b", B);
        A = 1'b1; #5 ; A = 1'b0; #5; $display("%b", B);
        A = 1'b1; #5 ; A = 1'b0; #5; $display("%b", B);
        A = 1'b1; #5 ; A = 1'b0; #5; $display("%b", B);
        A = 1'b1; #5 ; A = 1'b0; #5; $display("%b", B);
        A = 1'b1; #5 ; A = 1'b0; #5; $display("%b", B);
        A = 1'b1; #5 ; A = 1'b0; #5; $display("%b", B);
        A = 1'b1; #5 ; A = 1'b0; #5; $display("%b", B);
        A = 1'b1; #5 ; A = 1'b0; #5; $display("%b", B);
        A = 1'b1; #5 ; A = 1'b0; #5; $display("%b", B);
        A = 1'b1; #5 ; A = 1'b0; #5; $display("%b", B);
        $display("END OF TEST");
    end 




endmodule    