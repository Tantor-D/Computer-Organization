`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"
//中文 GB 2312

module CMP(
    input wire [31:0] v1,
    input wire [31:0] v2,
    output wire cmp_is0,
    output wire cmp_e0,
    output wire cmp_g0,
    output wire cmp_l0,
    output wire cmp_new
    );

    assign cmp_is0= ( v1==v2 ) ? 1'b1 : 1'b0;
    assign cmp_e0 = ( v1==32'd0 ) ? 1'b1 : 1'b0;
    assign cmp_g0 = ( v1[31]==1'b0 && v1!=32'd0 ) ? 1'b1 : 1'b0;  //v1的首位为0且v1不为0则v1为正数，
    assign cmp_l0 = ( v1[31]==1'b1 ) ? 1'b1 : 1'b0;
    assign cmp_new= ( v2==32'd0) ;
endmodule
