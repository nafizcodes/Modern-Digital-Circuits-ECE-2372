`include "half_adder.v"
module top(A,B,Cin,Cout,S);

    input A,B,Cin;
    output S,Cout;

    wire W0,W1,W2;


    half_adder u1(.A(A), .B(B), .C(W1), .S(W0));
    half_adder U2(.B(Cin) , .A(W0) , .S(S) , .C(W2));
   
    assign Cout = W1 ^ W2;

endmodule
