`include "mux2to1.v"

module mux2to1_8bit(I1, I2, S, Y);
    //DATA INPUTS
    input [7:0] I1, I2;
    //CONTROL INPUTS
    input  S;
    //OUTPUTS
    output [7:0] Y;

    mux2to1 U0 (.S(S), .I0(I1[0]), .I1(I2[0]), .Y(Y[0]));  
    mux2to1 U1 (.S(S), .I0(I1[1]), .I1(I2[1]), .Y(Y[1])); 
    mux2to1 U2 (.S(S), .I0(I1[2]), .I1(I2[2]), .Y(Y[2]));  
    mux2to1 U3 (.S(S), .I0(I1[3]), .I1(I2[3]), .Y(Y[3])); 
    mux2to1 U4 (.S(S), .I0(I1[4]), .I1(I2[4]), .Y(Y[4])); 
    mux2to1 U5 (.S(S), .I0(I1[5]), .I1(I2[5]), .Y(Y[5])); 
    mux2to1 U6 (.S(S), .I0(I1[6]), .I1(I2[6]), .Y(Y[6])); 
    mux2to1 U7 (.S(S), .I0(I1[7]), .I1(I2[7]), .Y(Y[7])); 

endmodule

