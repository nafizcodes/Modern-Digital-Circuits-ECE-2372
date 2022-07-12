`include "project4.v"
`timescale 10ns/1ns

module project4_test;

    reg A, B, C, D;
    wire F;
    top UUT(A, B, C, D, F);
    initial begin
        $dumpfile("project4.vcd");
        $dumpvars(0, project4_test);
        $display("Start of Test");
        {A, B, C, D} = 4'd0; #5; $display("%b %b %b %b | %b", A, B, C, D, F);
        {A, B, C, D} = 4'd1; #5; $display("%b %b %b %b | %b", A, B, C, D, F);
        {A, B, C, D} = 4'd2; #5; $display("%b %b %b %b | %b", A, B, C, D, F);
        {A, B, C, D} = 4'd3; #5; $display("%b %b %b %b | %b", A, B, C, D, F);
        {A, B, C, D} = 4'd4; #5; $display("%b %b %b %b | %b", A, B, C, D, F);
        {A, B, C, D} = 4'd5; #5; $display("%b %b %b %b | %b", A, B, C, D, F);
        {A, B, C, D} = 4'd6; #5; $display("%b %b %b %b | %b", A, B, C, D, F);
        {A, B, C, D} = 4'd7; #5; $display("%b %b %b %b | %b", A, B, C, D, F);
        {A, B, C, D} = 4'd8; #5; $display("%b %b %b %b | %b", A, B, C, D, F);
        {A, B, C, D} = 4'd9; #5; $display("%b %b %b %b | %b", A, B, C, D, F);
        {A, B, C, D} = 4'd10; #5; $display("%b %b %b %b | %b", A, B, C, D, F);
        {A, B, C, D} = 4'd11; #5; $display("%b %b %b %b | %b", A, B, C, D, F);
        {A, B, C, D} = 4'd12; #5; $display("%b %b %b %b | %b", A, B, C, D, F);
        {A, B, C, D} = 4'd13; #5; $display("%b %b %b %b | %b", A, B, C, D, F);
        {A, B, C, D} = 4'd14; #5; $display("%b %b %b %b | %b", A, B, C, D, F);
        {A, B, C, D} = 4'd15; #5; $display("%b %b %b %b | %b", A, B, C, D, F);
        $display("End of Test");
    end
endmodule