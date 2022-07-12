`include "alu_rtl.v"

module TOP(B, S, E, CLK, CLR, Q);
    
    input CLK,CLR,S,E;
    input [7:0]B;

    output reg[7:0] Q = 8'd0;

    wire [7:0]D;

    alu_rtl U0(.A(Q), .B(B) , .S(S), .E(E), .W(D));

    always@(negedge CLK)begin
        if (CLR == 1'b1)begin
            Q <= 8'd0;
        end
        else begin
            Q <= D;
        end
    end
endmodule
