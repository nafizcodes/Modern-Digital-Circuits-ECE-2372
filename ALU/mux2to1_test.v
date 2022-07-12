`include "mux2to1.v"
`timescale 1ps/1ps

module mux2to1_test;

    reg S, I0, I1;
    wire Y;

    mux2to1 UUT(S, I0, I1, Y);

    initial begin
        /* for (integer i = 0; i<8; i++)begin
                {S,I0,I1}  = i ; #10;
                if()
        $display("Start of Test.");

        {S, I0, I1} = 3'b000; #10; $display("%b > %b & %b = %b", S, I0, I1, Y);
        {S, I0, I1} = 3'b001; #10; $display("%b > %b & %b = %b", S, I0, I1, Y);
        {S, I0, I1} = 3'b010; #10; $display("%b > %b & %b = %b", S, I0, I1, Y);
        {S, I0, I1} = 3'b011; #10; $display("%b > %b & %b = %b", S, I0, I1, Y);
        {S, I0, I1} = 3'b100; #10; $display("%b > %b & %b = %b", S, I0, I1, Y);
        {S, I0, I1} = 3'b101; #10; $display("%b > %b & %b = %b", S, I0, I1, Y);
        {S, I0, I1} = 3'b110; #10; $display("%b > %b & %b = %b", S, I0, I1, Y);
        {S, I0, I1} = 3'b111; #10; $display("%b > %b & %b = %b", S, I0, I1, Y);

        $display("End of Test.");
    end

endmodule
