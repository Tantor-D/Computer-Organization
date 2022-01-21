`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"

module npc(
    input  wire [2:0]  npc_mod,
    input  wire [31:0] I_pc,
    input  wire [31:0] D_pc,
    input  wire [25:0] imm26,
    input  wire [31:0] reg32,
    output wire [31:0] npc
    );
    
    wire [31:0] signed_ext_16_00 = ( imm26[15]==1'b1) ? {14'h3fff,imm26[15:0],2'b00 } : { 14'h0000,imm26[15:0],2'b00};
    
    wire [31:0] new_npc;
    assign new_npc = 32'h3000;

    assign  npc=(npc_mod==`npc_add4 ) ? I_pc + 32'd4 :
                (npc_mod==`npc_brch ) ? D_pc + 32'd4 + signed_ext_16_00 :
                (npc_mod==`npc_j    ) ? {D_pc[31:28], imm26[25:0], 2'b00} :
                (npc_mod==`npc_jr   ) ? reg32 :
                (npc_mod==3'b100    ) ? new_npc :
                                        32'h3000;
    
endmodule
