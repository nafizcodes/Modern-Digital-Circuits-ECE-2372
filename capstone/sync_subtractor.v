`include "subtractor.v"

module sync_subtractor(A, B, CLK, D, Comp, Pout);
    input [4:0] A, B;
    input CLK;
    output[4:0]D;
    output reg Comp = 1'b0;
    output reg[4:0] Pout = 5'b00000;
    wire Cout;

    subtractor SUB(.A(A), .B(B), .D(D), .Cout(Cout));
    always@(posedge CLK)begin
        if (Cout)begin
            Pout <= D;
        end else begin
            Pout = 5'b00000;
        end
        Comp = Cout;
    end
endmodule
