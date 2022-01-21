`timescale 1ns / 1ps

//npc
`define npc_add4 3'b000
`define npc_brch 3'b001
`define npc_j    3'b010
`define npc_jr   3'b011

//ext
`define ext_0    2'b00
`define ext_sign 2'b01
`define ext_lui  2'b10

//alu
`define alu_add 4'b0000
`define alu_sub 4'b0001
`define alu_or  4'b0010
`define alu_in2 4'b0011
`define alu_sll 4'b0100
`define alu_srl 4'b0101
`define alu_sra 4'b0110
`define alu_and 4'b0111
`define alu_xor 4'b1000
`define alu_nor 4'b1001
`define alu_slt_signed   4'b1010
`define alu_slt_unsigned 4'b1011

//mdu
`define mdu_mul_signed    3'b000
`define mdu_mul_unsigned  3'b001
`define mdu_div_signed    3'b010
`define mdu_div_unsigned  3'b011
`define mdu_moveto_HI     3'b100
`define mdu_moveto_LO     3'b101

//beu
`define beu_w    3'b000
`define beu_h    3'b001
`define beu_b    3'b010
`define beu_none 3'b011

//DM_ext
`define DM_ext_none         3'b000
`define DM_ext_b_signed     3'b001
`define DM_ext_b_unsigned   3'b010
`define DM_ext_h_signed     3'b011
`define DM_ext_h_unsigned   3'b100

//mux_alu_in1
`define mux_E_alu_in1_v1    2'b00
`define mux_E_alu_in1_shift 2'b01

//mux_alu_in2
`define mux_E_alu_in2_v2  3'b000
`define mux_E_alu_in2_ext 3'b001
`define mux_E_alu_in2_pc8 3'b010

//mux_M_zhuanfa
`define mux_M_zhuanfa_alu_o 2'b00
`define mux_M_zhuanfa_HI    2'b01
`define mux_M_zhuanfa_LO    2'b10

//mux_W_wd
`define mux_W_wd_alu_o 3'b000
`define mux_W_wd_DM_o  3'b001
`define mux_W_wd_HI    3'b010
`define mux_W_wd_LO    3'b011