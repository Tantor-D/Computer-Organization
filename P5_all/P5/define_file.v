`timescale 1ns / 1ps

//alu
`define alu_add 3'b000
`define alu_sub 3'b001
`define alu_or  3'b010
`define alu_in2 3'b011

//npc
`define npc_add4 3'b000
`define npc_brch 3'b001
`define npc_j    3'b010
`define npc_jr   3'b011

//ext
`define ext_0    2'b00
`define ext_sign 2'b01
`define ext_lui  2'b10
