`include "dividend.v"
`include "controller.v"
`include "sync_subtractor.v"

module top (START, DONE, DIVIDEND, DIVISOR, QUOTIENT, REMAINDER, CLK);
    input CLK, START;
    input[4:0] DIVISOR;
    input[8:0] DIVIDEND;

    output reg [3:0] QUOTIENT;
    output [4:0] REMAINDER, Q_BUS;
    output DONE;

    wire SH, LD, Compare;
    wire [4:0] B1, B2, REM_OUT;
    wire [4:0] REM_BUS;
    
    dividend div(.CLK(CLK), .SH(SH), .LD(LD), .PIN(DIVIDEND), .SIN(B2), .C(Compare));
    sync_subtractor sub(.A(B1), .B(DIVISOR), .CLK(CLK), .D(), .Comp(Compare), .Pout(B2));
    controller control(.CLK(CLK), .ST(START), .SH(SH), .LD(LD), .D(DONE), .C(Compare), .QUOT(Q_BUS), .REM_IN(REM_OUT)), .REM(REMAINDER);

    always@(posedge CLK)begin
        QUOTIENT <= Q_BUS;
    end
endmodule