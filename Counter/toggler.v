module toggler(A,F);
    input A;
    output reg F = 1;


    always@(negedge A) begin
        F = ~F;
    end



endmodule