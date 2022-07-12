module top(A,B,C,D,F);

    input A,B,C,D;
    output F;
    
    assign F = ~A & ~C & D | A & ~C & ~D | B & C & ~D;
    
endmodule

