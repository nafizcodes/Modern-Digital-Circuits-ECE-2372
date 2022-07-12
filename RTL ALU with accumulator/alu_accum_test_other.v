`include "alu_accum.v" 
`timescale 1ns/1ns

module testbench;

    
    reg CLR;
    reg S;
    reg E;
    

    wire [7:0] Q;
    reg [7:0] D;
    reg[7:0]B;

    reg[7:0] count = 0;

    reg CLK = 1'b0;
    
    always 
    begin 
        CLK = ~CLK;
        #5;
    end  

    TOP UUT(B, S, E, CLK, CLR, Q);
    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0, testbench);
        $display("Start of test.");

        E = 1;
        S = 0;
        CLR = 0;
        
        B=0;    #10;
        B = 3;  #10;
        B = 7;  #10;
        B = 10; #50;
        S = 1;

        while (Q != 0)begin
            B =12;
            count = count + 1;  #10;
        end
        #50;

        $dislay("((3+7)*6/12 = %d", count);
        $("End of Test")
        $finish;
    end
endmodule


