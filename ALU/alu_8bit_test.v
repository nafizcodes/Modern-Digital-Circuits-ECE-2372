`include "alu_8bit.v"
`timescale 1ps/1ps

module alu_8bit_test;

    reg [7:0] A, B;
    reg S, E;
    wire [7:0] W;

    alu_8bit UUT(A, B, S, E, W);

    integer TOTAL_TESTS = 262144;
    integer TOTAL_PASSED = 262144;
    
    
    initial begin
        $display("Start of Test.");
      

        for (integer a = 0; a < 256; a = a + 1)
        begin
            for (integer b = 0; b < 256; b = b + 1)
            begin

                S = 0;
                E = 0;
                #10
                if (W == 8'b00000000)
                begin
                    $display("TEST FAILED %b and %b = %b | S = %b, E = #b", A, B, W, S, E);
                    TOTAL_PASSED = TOTAL_PASSED - 1;
                end

                S = 0;
                E = 1;
                #10
                if (W == A + B)
                begin
                    $display("TEST FAILED %b and %b = %b | S = %b, E = #b", A, B, W, S, E);
                    TOTAL_PASSED = TOTAL_PASSED - 1;
                end

                S = 1;
                E = 0;
                #10
                if (W == 8'b00000000)
                begin
                    $display("TEST FAILED %b and %b = %b | S = %b, E = #b", A, B, W, S, E);
                    TOTAL_PASSED = TOTAL_PASSED - 1;
                end

                S = 1;
                E = 1;
                #10
                if (W == A - B )
                begin
                    $display("TEST FAILED  %b and %b = %b | S = %b, E = #b", A, B, W, S, E);
                    TOTAL_PASSED = TOTAL_PASSED - 1;
                end
            end
        end

        $display("\nEnd of Test. %d of %d cases passed, %d cases failed", TOTAL_PASSED, TOTAL_TESTS, TOTAL_TESTS - TOTAL_PASSED);
    end

endmodule
