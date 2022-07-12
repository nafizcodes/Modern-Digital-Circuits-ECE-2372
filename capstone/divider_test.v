`include "divider.v"

module divider_test;
    reg CLK = 1'b0, START = 1'b0;
    reg [8:0] DIVIDEND = 9'd0;
    reg [4:0] DIVISOR = 5'd0;
    wire [3:0] QUOTIENT;
    wire[4:0] REMAINDER;

    wire DONE;

    divider UUT (START, DONE, DIVIDEND, DIVISOR, QUOTIENT, REMAINDER, CLK);
    initial begin
        $dumpfile("divider.vcd");
        $dumpvars(0, top_test);
        DIVIDEND = 9'd135 ; DIVISOR = 4'd10; #5; CLK = 1'b1; #5; CLK = 1'b0; UUT.DIV.DIV.REG = 9'd111;
        START = 1'b1; #5; CLK = 1'b1; #5; CLK = 1'b0; $display("|DONE | QUOTIENT | REMAINDER | DIVIDEND = %d  DIVISOR = %d", DIVIDEND, DIVISOR);
        while (DONE != 1)begin
            #5; CLK = 1'b1; #5; CLK = 1'b0;           $display("|  %b |    %b   |    %b   |", DONE, QUOTIENT, REMAINDER);
        end
        $display("%2d / %2d = %2d R%2d", DIVIDEND, DIVISOR, QUOTIENT, REMAINDER);

        DIVIDEND = 9'd6; DIVISOR = 4'd4; #5; CLK = 1'b1; #5; CLK = 1'b0;
        START = 1'b1; #5; CLK = 1'b1; CLK = 1'b0;     $display("|DONE | QUOTIENT | REMAINDER | DIVIDEND =%d   DIVISOR = %d", DIVIDEND,  DIVISOR);
    
        
        while(DONE != 1)begin
            #5; CLK = 1'b1; #5; CLK =1'b0;            $display("  %b  |  %b      |    %b     | ", DONE, QUOTIENT, REMAINDER);
        end
        $display("%2d / %2d = %2d R%2d", DIVIDEND, DIVISOR, QUOTIENT, REMAINDER);
    end
endmodule
            