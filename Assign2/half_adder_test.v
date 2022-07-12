`include "half_adder.v"
`timescale 1ps/1ps

module half_adder_test;

    reg A, B;
    wire C, S;

    top UUT(A, B, C, S);

    initial begin
        $display("Start of Test.");
        $dumpfile("half_adder.vcd");
        $dumpvars(0, half_adder_test);
        {A, B} = 2'b00; #10; $display("%b + %b = %b%b", A, B, C, S);
        {A, B} = 2'b01; #10; $display("%b + %b = %b%b", A, B, C, S);
        {A, B} = 2'b10; #10; $display("%b + %b = %b%b", A, B, C, S);
        {A, B} = 2'b11; #10; $display("%b + %b = %b%b", A, B, C, S);
        $display("End of Test.");
    end

endmodule