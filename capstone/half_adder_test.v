`include "half_adder.v"
`timescale 1ps/1ps
module half_adder_test;
    reg A, B;
    wire C, S;
    half_adder UUT(A, B, C, S);
    initial begin
        {A, B} = 2'b00; #5; $display("%b + %b = %b%b", A, B, C, S);
        {A, B} = 2'b01; #5; $display("%b + %b = %b%b", A, B, C, S);
        {A, B} = 2'b10; #5; $display("%b + %b = %b%b", A, B, C, S);
        {A, B} = 2'b11; #5; $display("%b + %b = %b%b", A, B, C, S);
    end
endmodule