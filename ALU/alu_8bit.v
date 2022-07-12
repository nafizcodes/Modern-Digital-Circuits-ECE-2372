`include "subtractor_8bit.v"
`include "mux2to1_8bit.v" 
 
/*only including the subtractor and the mux in the ALU module as 
  adding the adder causes the full adder to be included twice*/

module alu_8bit(A, B, S, E, W);

    input [7:0] A, B;
    input S, E;
    output [7:0] W;

    wire[7:0]w0,w1,w2;

    adder_8bit AD0(.A(A), .B(B), .S(w0));
    subtractor_8bit SUB0(.A(A), .B(B), .S(w1));
    mux2to1_8bit MUX0(.I1(w0), .I2(w1), .S(S) , .Y(w2));


endmodule
