`timescale 1ns / 1ps

module EXT(
    input [15:0] inn,
    input [1:0] op,
    output [31:0] result
    );

    assign result = (op==2'b00) ? {16'h0000,inn[15:0]} :
                    (op==2'b01 && inn[15]==1'b1 ) ? {16'hffff,inn[15:0]} :
                    (op==2'b01 && inn[15]==1'b0 ) ? {16'h0000,inn[15:0]} :
                    (op==2'b10) ? {inn[15:0],16'h0000} :
                                32'd0;
endmodule
