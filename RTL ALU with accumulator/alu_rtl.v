module alu_rtl(A,B,S,E,W);

    //DATA INPUTS
    input [7:0] A,B;

    //CONTROL INPUTS
    input S,E;

    //OUTPUT REGISTERS
    output reg[7:0]W;


    //RTL LOGIC IMPLEMENTATION
    always@(*) begin
        if (E == 1)begin
            if(S == 0 )begin
                W <= A + B;
            end else begin
                W <= A - B;
            end
        end else begin
            W <= 8'd0;
        end    
    end
