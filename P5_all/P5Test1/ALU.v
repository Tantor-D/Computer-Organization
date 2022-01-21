`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"
//ÖÐÎÄ GB 2312

module alu(
    input wire [31:0] d1,
    input wire [31:0] d2,
    input wire [2:0] mod,
    output wire [31:0] result
    );

    wire [31:0] new_out;

    assign result = ( mod==`alu_add ) ? d1+d2 :
                    ( mod==`alu_sub ) ? d1-d2 :
                    ( mod==`alu_or  ) ? d1|d2 :
                    ( mod==`alu_in2 ) ? d2    :
                    ( mod== 3'b100  ) ? new_out :
                                        32'd0 ;

endmodule
