`include "alu_accum.v" 

module testbench;
    //Inputs
    reg [7:0] A, B;
    //Control inputs
    reg CLR, S, E;
    //
    reg CLK = 1'b0;

    wire [7:0] Q;
    wire [7:0]temp;

    TOP UUT( A, B, S, E, CLK, CLR, Q);

    
    always 
    begin 
        CLK = ~CLK;
        #5;
    end  

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0, testbench);

        CLR <= 1'b1; #5;

        CLR <= 1'b0; #5;

        A <= 3;
        B <= 7;
    
        S <= 1'b0;
        
        E <= 1'b1;
        #60;

        CLR <= 1'b1; #5;

        temp <= (Q/ 8'b00001100); #5;

        $display("Q = %b, A = %b, B = %b, temp = %b", Q, A, B, temp); #5;

        $display("((%b + %b) *6/ 12 - %b - 5", A, B, temp); #5;

        $finish;
    end
endmodule


