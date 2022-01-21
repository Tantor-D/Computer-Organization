`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"

//造数据

//!运算符的操作行为
//always 块  wire    begin end

//盘一盘之前留下的verilog问题
//改完以后最后再提交一次

module control(
    input wire [31:0] instr,
    input wire cmp_is0,
    input wire cmp_g0,
    
    output wire [4:0] grf_a1,
    output wire [4:0] grf_a2,
    output wire [4:0] grf_a3,
    output wire grf_we,

    output wire [1:0] ext_mod,
    output wire [2:0] npc_mod,

    output wire [2:0] alu_mod,
    output wire [2:0] mux_E_alu_in2,
    output wire DM_we,
    output wire [1:0] mux_W_wd,

    output wire is_new_instr
    );
	
    wire [5:0] op_code = instr [31:26] ;
    wire [5:0] funct = instr [5:0] ;
    wire [4:0] aa1 = instr [25:21];
    wire [4:0] aa2 = instr [20:16];
    wire [4:0] aa3 = instr [15:11];
    wire op_is0 = !( |op_code );

    //指令判断。   能不能把定义放在后面？可以
    wire addu,subu,ori,lw,sw,beq,lui,nop,jal,jr,j;
    assign addu=( op_is0==1'b1 && funct==6'h21 ) ? 1:0;
    assign subu=( op_is0==1'b1 && funct==6'h23 ) ? 1:0;
    assign nop =( op_is0==1'b1 && funct==6'h00 ) ? 1:0;
    assign jr  =( op_is0==1'b1 && funct==6'h08 ) ? 1:0;
    assign ori =( op_code == 6'h0d ) ? 1:0;             //ori对应的是0拓展
    assign lw  =( op_code == 6'h23 ) ? 1:0;
    assign sw  =( op_code == 6'h2b ) ? 1:0;
    assign beq =( op_code == 6'h04 ) ? 1:0;
    assign lui =( op_code == 6'h0f ) ? 1:0;             //写入地址为aa2，不是aa1，aa1对应的寄存器一定是读，不会写
    assign jal =( op_code == 6'h03 ) ? 1:0;
    assign j   =( op_code == 6'h02 ) ? 1:0;
    
    wire bltzal;
    assign bltzal =( op_code == 6'h01 ) ? 1:0;
    assign is_new_instr = bltzal  ;

    //D+W grf
    assign grf_a1 = ( addu || subu || ori || lw || sw || beq || jr || bltzal) ? aa1 : 5'd0;
    assign grf_a2 = ( addu || subu || sw || beq ) ? aa2 : 5'd0;
    assign grf_a3 = ( addu || subu )     ? aa3 :
                    ( ori  || lui || lw) ? aa2 :
                    ( jal  || bltzal )   ? 5'd31 :
                                           5'd0;
    assign grf_we = ( addu || subu || ori || lui || lw || jal || bltzal);

    //D   ext
    assign ext_mod=(lw ==1'b1 || sw==1'b1) ? `ext_sign :
                   (lui==1'b1) ? `ext_lui :
                                 `ext_0   ;

    //D   npc
    assign npc_mod=( (beq==1'b1 && cmp_is0==1'b1) || (bltzal==1'b1 && cmp_g0==1'b1) ) ? `npc_brch :
                   (jal==1'b1 || j == 1'b1) ? `npc_j :
                   (jr ==1'b1) ? `npc_jr :
                                 `npc_add4 ;

    //E   alu
    assign alu_mod=(subu==1'b1) ? `alu_sub :
                   (ori ==1'b1) ? `alu_or  :
                   (lui ==1'b1 || jal == 1'b1 || bltzal==1'b1) ? `alu_in2 :
                                                            `alu_add ;

    //E   mux_alu_in2
    assign mux_E_alu_in2 = ( ori || lui || lw || sw) ? 3'b001 :  //ext_out  (001)
                           ( jal || bltzal)          ? 3'b010 :  //pc8      (010)
                                                       3'b000;   //grf_v2

    //M   DM_we                                   
    assign DM_we = (sw==1'b1);

    //W   mux_W_wd
    assign mux_W_wd = ( lw ) ? 2'b01 :   //DM_out
                               2'b00;    //alu_out


endmodule