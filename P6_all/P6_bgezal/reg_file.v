`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"
//¹ú±ê2312

module reg_file(
    input wire clk,
	 input wire rst ,
	 input wire stall,
	 
    input wire in_cmp_is0,
    input wire in_cmp_e0,
    input wire in_cmp_g0,
    input wire in_cmp_l0,
    input wire in_cmp_new,
    input wire [1:0] in_Tnew,
    input wire [31:0] in_instr,
    input wire [31:0] in_pc,
    input wire [31:0] in_v1,
    input wire [31:0] in_v2,
    input wire [31:0] in_e32,
    input wire [31:0] in_alu_o,
    input wire [31:0] in_DM_data,
    input wire [31:0] in_HI,
    input wire [31:0] in_LO,

    output reg cmp_is0,
    output reg cmp_e0,
    output reg cmp_g0,
    output reg cmp_l0,
    output reg cmp_new,
    output reg [1:0] Tnew,
    output reg [31:0] instr,
    output reg [31:0] pc,
    output reg [31:0] v1,
    output reg [31:0] v2,
    output reg [31:0] e32,
    output reg [31:0] alu_o,
    output reg [31:0] DM_data,
    output reg [31:0] HI,
    output reg [31:0] LO
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
            cmp_e0  <= 1'b0;
            cmp_g0  <= 1'b0;
            cmp_l0  <= 1'b0;
            cmp_new <= 1'b0;
            HI      <= 32'd0;
            LO      <= 32'd0;
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
            cmp_e0  <= cmp_e0;
            cmp_g0  <= cmp_g0;
            cmp_l0  <= cmp_l0;
            cmp_new <= cmp_new;
            HI      <= HI;
            LO      <= LO;
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
            cmp_e0  <= in_cmp_e0;
            cmp_g0  <= in_cmp_g0;
            cmp_l0  <= in_cmp_l0;
            cmp_new <= in_cmp_new;
            HI      <= in_HI;
            LO      <= in_LO;
        end
    end

endmodule
