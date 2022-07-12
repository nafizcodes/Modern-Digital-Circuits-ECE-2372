`include "half_adder.v"
module full_adder(A, B, Cin, Cout, S);
    input A, B, Cin;
    output Cout, S;
    wire C0, S0, C1;
    half_adder HA0(.A(A), .B(B), .C(C0), .S(S0));
    half_adder HA1(.A(S0), .B(Cin), .C(C1), .S(S));
    assign Cout = C0 ^ C1;
endmodule