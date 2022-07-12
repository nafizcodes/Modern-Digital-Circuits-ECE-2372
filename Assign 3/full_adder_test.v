`include "full_adder.v"
`timescale 10ns/1ns


module full_adder_test;

    //Inputs
    reg A;
    reg B;
    reg Cin;

    //Outputs
    wire S;
    wire Cout;

    //UNIT UNDER TEST
    top UUT(A,B,Cin,S,Cout);

    initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0,full_adder_test);
        $display("START OF TEST");
        {A,B,Cin} = 3'b000; #10; $display("%b + %b + %b= %b%b",A,B,Cin,S,Cout);
        {A,B,Cin} = 3'b001; #10; $display("%b + %b + %b= %b%b",A,B,Cin,S,Cout);
        {A,B,Cin} = 3'b010; #10; $display("%b + %b + %b= %b%b",A,B,Cin,S,Cout);
        {A,B,Cin} = 3'b011; #10; $display("%b + %b + %b= %b%b",A,B,Cin,S,Cout);
        {A,B,Cin} = 3'b100; #10; $display("%b + %b + %b= %b%b",A,B,Cin,S,Cout);
        {A,B,Cin} = 3'b101; #10; $display("%b + %b + %b= %b%b",A,B,Cin,S,Cout);
        {A,B,Cin} = 3'b110; #10; $display("%b + %b + %b= %b%b",A,B,Cin,S,Cout);
        {A,B,Cin} = 3'b111; #10; $display("%b + %b + %b= %b%b",A,B,Cin,S,Cout);
        $display("END OF TEST");

 
    end

endmodule

