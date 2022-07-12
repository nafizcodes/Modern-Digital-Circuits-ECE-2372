`include "toggler.v"

module top(A,B);
    input A;
    output [3:0] B;


    wire W0,W1,W2;


    toggler U0(.A(A), .F(W0));
    toggler U1(.A(W0), .F(W1));
    toggler U2(.A(W1), .F(W2));
    toggler U3(.A(W3), .F(B[3]));


    assign B[0] = W0;
    assign B[1] = W1;
    assign B[2] = W2;

endmodule