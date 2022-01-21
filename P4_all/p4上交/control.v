`timescale 1ns / 1ps

module control(
    input [5:0] op_code,
    input [5:0] funct,
    input alu_is0,
    output [2:0] npc_op,
    output [2:0] alu_op,
    output [1:0] ext_op,
    output grf_we,
    output DM_we,
    output [1:0] mux_grf_a3,
    output [2:0] mux_grf_wd,
    output [1:0] mux_alu_in2
    );

    wire addu,subu,ori,lw,sw,beq,lui,nop,jal,jr;
    wire op_is0;

    assign op_is0=!( |op_code );

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

    //需不需要三目运算符?
    assign npc_op=(beq==1'b1 && alu_is0==1'b1) ? 3'b001 :
                  (jal==1'b1) ? 3'b010 :
                  (jr ==1'b1) ? 3'b011 :
                                3'b000 ;
    assign alu_op=(subu==1'b1 || beq==1'b1) ? 3'b001 :
                  (ori ==1'b1) ? 3'b010 :
                                 3'b000 ;
    assign ext_op=( lw==1'b1 || sw==1'b1) ? 2'b01 :
                  (lui==1'b1) ? 2'b10:
                                2'b00;

    assign grf_we= (addu==1'b1 || subu==1'b1 || ori==1'b1 || lw==1'b1 || lui==1'b1 || jal==1'b1) ;
    assign DM_we =(sw==1'b1);

    assign mux_grf_a3= (lw==1'b1 || lui==1'b1 || ori==1'b1) ? 2'b01 :
                       (jal==1'b1) ? 2'b10 :
                                     2'b00 ;
    assign mux_grf_wd= (lw==1'b1) ? 3'b001 :
                       (lui==1'b1)? 3'b010 :
                       (jal==1'b1)? 3'b011 :
                                    3'b000 ;
    assign mux_alu_in2= (ori==1'b1 || lw==1'b1 || sw==1'b1) ? 2'b01 : 2'b00;
                        

endmodule