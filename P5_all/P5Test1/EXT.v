`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"
//ÖÐÎÄ GB 2312

module EXT(
    input  wire [15:0] inn,
    input  wire [1:0]  mod,
    output wire [31:0] result
    );

    assign result = ( mod==`ext_0 )                     ? {16'h0000,inn[15:0]} :
                    ( mod==`ext_sign && inn[15]==1'b1 ) ? {16'hffff,inn[15:0]} :
                    ( mod==`ext_sign && inn[15]==1'b0 ) ? {16'h0000,inn[15:0]} :
                    ( mod==`ext_lui )                   ? {inn[15:0],16'h0000} :
                                                          32'd0;

endmodule
