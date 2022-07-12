module controller (CLK, ST, SH, LD, D, C, REM, QUOT, REM_IN);

    input CLK, ST, C;
    input [4:0] REM_IN;
    reg [2:0] COUNT = 3'd0;
    output reg SH = 1'd0, LD = 1'd0, D = 1'd0;
    output reg [4:0] REM = 5'b00000;
    output reg [3:0] QUOT = 4'd0;

    reg [2:0] STATE = 3'd0;

    parameter[2:0] REST = 3'd0;  
    parameter[2:0] LOAD = 3'd1;
    parameter[2:0] SHIFT = 3'd2; 
    parameter[2:0] DONE = 3'd3; 
    parameter[2:0] SUB = 3'd4; 

    always@(posedge CLK)begin
        casex({STATE, ST, C, COUNT})
            {REST, 1'd1, 1'dX, 3'dX} : {STATE, SH, LD, D} = {LOAD, 1'd0, 1'd1, 1'd0};
            {LOAD, 1'dX, 1'dX, 3'dX} : {STATE, SH, LD, D} = {SHIFT, 1'd0, 1'd0, 1'd0};
            {SHIFT, 1'dX, 1'd1, 3'dX} : {STATE, SH, LD, D} = {SUB, 1'd0, 1'd0, 1'd0}; 
            {SUB, 1'dX, 1'd1, 3'd0} : begin {STATE, SH, LD, D} = {SHIFT, 1'd0, 1'd0, 1'd0}; QUOT[4] = 1'b1;end
            {SUB, 1'dX, 1'd1, 3'd1} : begin {STATE, SH, LD, D} = {SHIFT, 1'd0, 1'd0, 1'd0}; QUOT[3] = 1'b1;end
            {SUB, 1'dX, 1'd1, 3'd2} : begin {STATE, SH, LD, D} = {SHIFT, 1'd0, 1'd0, 1'd0}; QUOT[2] = 1'b1;end
            {SUB, 1'dX, 1'd1, 3'd3} : begin {STATE, SH, LD, D} = {SHIFT, 1'd0, 1'd0, 1'd0}; QUOT[1] = 1'b1;end
            {SUB, 1'dX, 1'd1, 3'd4} : begin {STATE, SH, LD, D} = {SHIFT, 1'd0, 1'd0, 1'd0}; QUOT[0] = 1'b1;end
            {SUB, 1'dX, 1'd0, 3'dX} : begin {STATE, SH, LD, D} = {SHIFT, 1'd1, 1'd0, 1'd0}; end
            {SHIFT, 1'dX, 1'd0, 3'd0} : begin {STATE, SH, LD, D} = {SUB, 1'd0, 1'd0, 1'd0}; COUNT = COUNT + 1'd1;end
            {SHIFT, 1'dX, 1'd0, 3'd1} : begin {STATE, SH, LD, D} = {SUB, 1'd0, 1'd0, 1'd0}; COUNT = COUNT + 1'd1;end
            {SHIFT, 1'dX, 1'd0, 3'd2} : begin {STATE, SH, LD, D} = {SUB, 1'd0, 1'd0, 1'd0}; COUNT = COUNT + 1'd1;end    
            {SHIFT, 1'dX, 1'd0, 3'd3} : begin {STATE, SH, LD, D} = {SUB, 1'd0, 1'd0, 1'd0}; COUNT = COUNT + 1'd1;end
            {SHIFT, 1'dX, 1'd0, 3'd4} : begin {STATE, SH, LD, D} = {SUB, 1'd0, 1'd0, 1'd0}; COUNT = COUNT + 1'd1;end
            {SHIFT, 1'dX, 1'd0, 3'd5} : begin {STATE, SH, LD, D} = {DONE, 1'd0, 1'd0, 1'd1}; end
            {DONE,  1'dX, 1'dX, 3'dX} : begin {STATE, SH, LD, D} = {REST, 1'd0, 1'd0, 1'd0}; REM <= 5'd0; QUOT <= 5'd0; COUNT <= 3'd0;end 
            default : {STATE, SH, LD, D} = {REST, 1'd0, 1'd0, 1'd0};
        endcase
        if (REM_IN > 0) begin REM <= REM_IN; end
    end
endmodule





