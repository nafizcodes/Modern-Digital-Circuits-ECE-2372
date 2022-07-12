module decoder1to2(A, D0, D1);

    input A;
    output D0, D1;

    assign D0 = ~A;
    assign D1 = A;

endmodule