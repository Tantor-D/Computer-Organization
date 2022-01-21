`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"

module TGenerator(
    input  wire [31:0] instr,
    output wire [1:0] Tnew,
    output wire [1:0] Tuse1,
    output wire [1:0] Tuse2
    );

    wire [5:0] op_code = instr [31:26] ;
    wire [5:0] funct = instr [5:0] ;
    wire op_is0 = !( |op_code );
    
    //instruction
    wire addu,subu,ori,lw,sw,beq,lui,nop,jal,jr,j;
    assign addu=( op_is0==1'b1 && funct==6'h21 ) ? 1:0;
    assign subu=( op_is0==1'b1 && funct==6'h23 ) ? 1:0;
    assign nop =( op_is0==1'b1 && funct==6'h00 ) ? 1:0;
    assign jr  =( op_is0==1'b1 && funct==6'h08 ) ? 1:0;
    assign ori =( op_code == 6'h0d ) ? 1:0;
    assign lw  =( op_code == 6'h23 ) ? 1:0;
    assign sw  =( op_code == 6'h2b ) ? 1:0;
    assign beq =( op_code == 6'h04 ) ? 1:0;
    assign lui =( op_code == 6'h0f ) ? 1:0;
    assign jal =( op_code == 6'h03 ) ? 1:0;
    assign j   =( op_code == 6'h02 ) ? 1:0;

    //generate Tnew and Tuse
    assign Tnew = ( lui || jal )         ? 2'd0 :
                  ( addu || subu || ori) ? 2'd1 :
                  ( lw )                 ? 2'd2 :
                                           2'd0 ;
    
    assign Tuse1 = ( beq || jr )                       ? 2'd0 :
                   ( addu || subu || ori || lw || sw ) ? 2'd1 :
                                                         2'd3 ;
                                            
    assign Tuse2 = ( beq )          ? 2'd0 :
                   ( addu || subu ) ? 2'd1 :
                   ( sw )           ? 2'd2 :
                                      2'd3 ;
endmodule
