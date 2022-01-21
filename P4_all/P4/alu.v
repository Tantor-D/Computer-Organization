`timescale 1ns / 1ps

module alu(
    input [31:0] d1,
    input [31:0] d2,
    input [2:0] op,
    output is_0,
    output [31:0] result
    );

    assign is_0 = (result==32'd0) ? 1 : 0;

    assign result = (op==3'd0) ? d1+d2 :
                    (op==3'd1) ? d1-d2 :
                    (op==3'd2) ? d1|d2 :
                                 32'd0 ;

endmodule
