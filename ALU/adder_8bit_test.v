`include "adder_8bit.v"
`timescale 1ps/1ps

module testbench; 

reg[7:0]A,B;

wire[7:0]S;

adder_8bit UUT(A,B,S);

    initial begin
        $display("Begin Test");
        for (integer TEST = 0; TEST < 15; TEST++)
        begin
        A = TEST[15:8];
        B = TEST[7:0];
        #10;
        if ({S} != A + B )
        begin 
            $display("TEST FAILED FOR %b + %b = %b", A, B, S);

        end
        end
        $display("End Test");
    end

endmodule