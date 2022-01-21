`timescale 1ns / 1ps


module npc(
    input [2:0] op,
    input [31:0] pc,
    input [25:0] imm26,
    input [31:0] reg32,
    output [31:0] npc,
    output [31:0] pc_plus4
    );

    wire [31:0] signed_ext_16;    


    assign signed_ext_16 = ( imm26[15]==1'b1) ? {14'h3fff,imm26[15:0],2'b00 } : { 14'h0000,imm26[15:0],2'b00};

    assign pc_plus4= pc + 32'd4;

    assign  npc=(op==3'b000) ? pc_plus4 :
                (op==3'b001) ? pc_plus4+signed_ext_16 :
                (op==3'b010) ? {pc[31:28],imm26[25:0],2'b00} :
                (op==3'b011) ? reg32
                             : 32'h3000;
    
endmodule
