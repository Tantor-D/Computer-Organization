`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"
//ÖÐÎÄ GB 2312

module alu(
    input wire [31:0] d1,
    input wire [31:0] d2,
    input wire [3:0] mod,
    output reg [31:0] result
    );

    reg [31:0] new_out;

    always @(*) begin
        case (mod)
            `alu_add:   result = d1 + d2;                
            `alu_sub:   result = d1 - d2;
            `alu_or :   result = d1 | d2;
            `alu_in2:   result = d2;
            `alu_sll:   result = d2 << d1[4:0];
            `alu_srl:   result = d2 >> d1[4:0];
            `alu_sra:   result = $signed(d2) >>> d1[4:0];
            `alu_and:   result = d1 & d2;
            `alu_xor:   result = d1 ^ d2;
            `alu_nor:   result = ~(d1 | d2);
            `alu_slt_signed:   result = ($signed(d1) < $signed(d2)) ;// ? 1 : 0;
            `alu_slt_unsigned: result = ( d1 < d2 ) ;//? 1 : 0 ;
            default:    result = 32'd0;
        endcase
    end

endmodule

/*
Ñ­»·×óÒÆ
if(B[4:0] == 5'd0) out = A;
else out = A << B[4:0] | A >> (5'd31 - B[4:0] + 5'd1);
*/
