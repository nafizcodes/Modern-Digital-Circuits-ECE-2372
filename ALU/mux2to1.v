`include "decoder1to2.v"

module mux2to1(S, I0, I1, Y);

    input S, I0, I1;
    output Y;

    wire D0, D1;

    decoder1to2 u0(.A(S), .D0(D0), .D1(D1));

    assign Y = (D0 && I0) || (D1 && I1);

endmodule
