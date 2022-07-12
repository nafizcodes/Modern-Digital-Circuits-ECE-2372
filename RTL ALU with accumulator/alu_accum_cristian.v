`include "alu_rtl.v"

module TOP(A, B, S, E, Q, CLK, CLR);
    
    input CLK, CLR, S, E;
    input [7:0] A, B;

    output reg[7:0] Q = 8'd0;

    wire [7:0]w0;

    alu_rtl U0(.A(A), .B(B) , .S(S), .E(E), .W(w0));

    always@(negedge CLK)begin
        if (CLR == 1'b1)begin
            Q <= 8'd0;
        end
        else begin
            {Q} <= Q + w0 ;
        end
    end
endmodule
