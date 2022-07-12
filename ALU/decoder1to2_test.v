`include "decoder1to2.v"
`timescale 1ps/1ps

module decoder1to2_test;

    reg A;
    wire D0, D1;

    decoder1to2 UUT(A, D0, D1);

    initial begin
        $display("Start of Test.");

        A = 1'b0; #10; $display("%b | %b %b", A, D0, D1);
        A = 1'b1; #10; $display("%b | %b %b", A, D0, D1);

        $display("End of Test.");
    end

endmodule