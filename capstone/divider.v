`include "dividend.v"
`include "controller.v"
`include "sync_subtractor.v"

module divider (START, DONE, DIVIDEND, DIVISOR, QUOTIENT, REMAINDER, CLK);
    input CLK, START;
    input[4:0] DIVISOR;
    input[8:0] DIVIDEND;

    output reg [3:0] QUOTIENT;
    output [4:0] REMAINDER, Q_BUS;
    output DONE;

    wire SH, LD, Compare, DONE_W;
    wire [4:0] B1, B2, REM_OUT;
    wire [3:0] REM_BUS;

    dividend div(.CLK(CLK), .SH(SH), .LD(LD), .PIN(DIVIDEND), .POUT(B1), .SIN(B2), .C(Compare), .REM());
    sync_subtractor sub(.A(B1), .B(DIVISOR), .CLK(CLK), .D(), .Comp(Compare), .Pout(B2));
    controller control(.CLK(CLK), .ST(START), .SH(SH), .LD(LD), .D(DONE_W), .C(Compare), .QUOT(Q_BUS), .REM_IN(B2), .REM(REMAINDER));

    always@(posedge CLK)begin
        QUOTIENT <= Q_BUS;
    end
    assign DONE = DONE_W;
endmodule

