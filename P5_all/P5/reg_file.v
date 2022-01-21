`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"
//ÖĞÎÄ

module reg_file(
    input wire stall,
    input wire rst ,
    input wire clk,

    input wire in_cmp_is0,
    input wire in_cmp_g0,
    input wire [1:0] in_Tnew,
    input wire [31:0] in_instr,
    input wire [31:0] in_pc,
    input wire [31:0] in_v1,
    input wire [31:0] in_v2,
    input wire [31:0] in_e32,
    input wire [31:0] in_alu_o,
    input wire [31:0] in_DM_data,
    
    output reg cmp_is0,
    output reg cmp_g0,
    output reg [1:0] Tnew,
    output reg [31:0] instr,
    output reg [31:0] pc,
    output reg [31:0] v1,
    output reg [31:0] v2,
    output reg [31:0] e32,
    output reg [31:0] alu_o,
    output reg [31:0] DM_data
    );

    always @(posedge clk) begin
        if(rst) begin
            Tnew    <= 2'd0;
            instr   <= 32'd0;
            pc      <= 32'h3000;
            v1      <= 32'd0;
            v2      <= 32'd0;
            e32     <= 32'd0;    
            alu_o   <= 32'd0;
            DM_data <= 32'd0;
            cmp_is0 <= 1'b0;
            cmp_g0  <= 1'b0;
        end
        else if(stall) begin
            Tnew    <= Tnew;
            instr   <= instr;
            pc      <= pc;
            v1      <= v1;
            v2      <= v2;
            e32     <= e32;    
            alu_o   <= alu_o;
            DM_data <= DM_data;
            cmp_is0 <= cmp_is0;
            cmp_g0  <= cmp_g0;
        end
        else begin
            Tnew    <= in_Tnew;
            instr   <= in_instr;
            pc      <= in_pc;
            v1      <= in_v1;
            v2      <= in_v2;
            e32     <= in_e32;    
            alu_o   <= in_alu_o;
            DM_data <= in_DM_data;
            cmp_is0 <= in_cmp_is0;
            cmp_g0  <= in_cmp_g0;
        end
    end

endmodule
