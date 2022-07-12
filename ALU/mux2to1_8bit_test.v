`include  "mux2to1_8bit.v"
`timescale 1ps/1ps

module mux2to1_8bit_test;

    reg [7:0] I1, I2;
    reg S;
    wire [7:0] Y;

    integer TOTAL_PASSED = 131072;
    integer TOTAL_TESTS = 131072;

    mux2to1_8bit UUT(I1, I2, S, Y);

    initial begin
        $display("\nStart of Test.");

        for (integer a = 0; a < 256; a = a + 1)
        begin
            for (integer b = 0; b < 256; b = b + 1)
            begin
                I1 = a[7:0];
                I2 = b[7:0];
                S = 1'b0;
                #10
                if (Y != I1)
                begin
                    $display("TEST FAILED %b and %b through %b -> %b", I1, I2, S, Y);
                    TOTAL_PASSED = TOTAL_PASSED - 1;
                end

                I1 = a[7:0];
                I2 = b[7:0];
                S = 1'b1;
                #10
                if (Y != I2)
                begin
                    $display("TEST FAILED %b and %b through %b -> %b", I1, I2, S, Y);
                    TOTAL_PASSED = TOTAL_PASSED - 1;
                end
            end
        end

        $display("\nEnd of Test. Test cases passed %d of %d ,Test cases failed %d \n", TOTAL_PASSED, TOTAL_TESTS, TOTAL_TESTS - TOTAL_PASSED);
    end

endmodule

