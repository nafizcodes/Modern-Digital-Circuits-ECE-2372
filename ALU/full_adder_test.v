`include "full_adder.v"
`timescale 1ps/1ps

module full_adder_test;
    reg A, B, Cin;
    wire Cout, S;
    full_adder UUT(A, B, Cin, Cout, S);
    initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0, full_adder_test);
        $display("Start of Test");
        {A, B, Cin} = 3'd0; #5; $display("%b + %b + %b = %b%b", A, B, Cin, Cout, S);
        {A, B, Cin} = 3'd1; #5; $display("%b + %b + %b = %b%b", A, B, Cin, Cout, S);
        {A, B, Cin} = 3'd2; #5; $display("%b + %b + %b = %b%b", A, B, Cin, Cout, S);
        {A, B, Cin} = 3'd3; #5; $display("%b + %b + %b = %b%b", A, B, Cin, Cout, S);
        {A, B, Cin} = 3'd4; #5; $display("%b + %b + %b = %b%b", A, B, Cin, Cout, S);
        {A, B, Cin} = 3'd5; #5; $display("%b + %b + %b = %b%b", A, B, Cin, Cout, S);
        {A, B, Cin} = 3'd6; #5; $display("%b + %b + %b = %b%b", A, B, Cin, Cout, S);
        {A, B, Cin} = 3'd7; #5; $display("%b + %b + %b = %b%b", A, B, Cin, Cout, S);
        $display("End of Test");
    end
endmodule
