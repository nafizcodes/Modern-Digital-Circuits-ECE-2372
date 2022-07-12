module dividend(CLK, SH, LD, PIN, POUT, SIN, REM, C);
    input CLK, SH, LD, C;
    input [4:0] SIN;
    input [8:0] PIN;

    output reg [4:0] REM = 5'b00000;
    output[4:0] POUT;
    reg[8:0] Q = 9'b000000000;
    always@(negedge CLK)begin
        if (SH == 1) begin
            Q[8] <= Q[7];
            Q[7] <= Q[6];
            Q[6] <= Q[5];
            Q[5] <= Q[4];
            Q[4] <= Q[3];
            Q[3] <= Q[2];
            Q[2] <= Q[1];
            Q[1] <= Q[0];
            Q[0] <= 1'd0;
        end else if (LD == 1) begin
            Q <= PIN;
        end else if (C == 1) begin
            Q[8:4] <= SIN;
            REM <= POUT;
        end
    end
    assign POUT = Q[8:4];
endmodule
