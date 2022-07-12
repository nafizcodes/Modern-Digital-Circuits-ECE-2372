`include "full_adder.v"
module subtractor(A, B, D, Cout);
    
    input [4:0] A,B;
    output [4:0] D;
    output Cout;

    wire [3:0] carry;

    
    full_adder U0(.A(A[0]), .B(~B[0]), .Cin(1'd1),     .Cout(carry[0]), .S(D[0]));
    full_adder U1(.A(A[1]), .B(~B[1]), .Cin(carry[0]), .Cout(carry[1]), .S(D[1]));
    full_adder U2(.A(A[2]), .B(~B[2]), .Cin(carry[1]), .Cout(carry[2]), .S(D[2]));
    full_adder U3(.A(A[3]), .B(~B[3]), .Cin(carry[2]), .Cout(carry[3]), .S(D[3]));
    full_adder U4(.A(A[4]), .B(~B[4]), .Cin(carry[3]), .Cout(Cout), .S(D[4]));
    

endmodule
