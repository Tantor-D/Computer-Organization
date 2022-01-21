`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"

/*
关于清空延迟槽操作，注意一定是当前在D级的指令发出信号，决定要清空延迟槽。
此时需要进行一个stall信号的特判，如果说此时需要暂停，那么就暂停，不清空，如果此时不暂停，才清空延迟槽
D_rst = rst | ( D_is_new_instr & D_clear_yanchicao & ~stall )

如果是需要修改“写使能”端的指令，一定要同步修改A3，当写使能为0时也要将A3置0，

grf_we不是那么重要，因为A3暗含了grf_we的意义在里面 
注意对于那种在M级才能产生的指令，前几级control中根本就没连，是x，此时要用===而不是==

如果是利用 is_new_instr 和 assign 来实现多路选择器，那么要把 is_new_instr 放到最前面，否则可能无效，因为这条新信号也会产生对应的控制信号。
*/

/*
每一道题，考虑：
    1.基础实现   
    2.阻塞暂停，AT   
    3.转发，有时要转发新东西，例如PC4    
    4.如果是后面才能得到信号，要用===防止影响前面
*/

module Datapath(
    input  wire clk,
    input  wire rst,
	 
	input  wire [31:0] I_instr,	    //i_inst_rdata
    input  wire [31:0] M_DM_o_weichuli,
	 
    output wire [31:0] I_pc,		//i_inst_addr
    output wire [31:0] M_DM_addr,
    output wire [31:0] M_DM_wdata,
    output wire [3 :0] M_DM_byteen,
    output wire [31:0] M_pc,		//m_inst_addr
    output wire W_grf_we,
    output wire [4:0]  W_a3,
    output wire [31:0] W_wdata,
    output wire [31:0] W_pc
    );

///////////////////////////////////////////////////////////////////////////  I级

    pc I_PC (
        .clk   (clk), 
        .rst   (rst), 
        .stall (stall), 
        .in_npc(D_npc), 
        .pc_o  (I_pc)
    );
	 

///////////////////////////////////////////////////////////////////////////  D级
    wire [31:0] D_instr,D_pc;
    wire [4:0] D_a1,D_a2,D_a3;
    wire D_is_new_instr;

	 wire no_use;
	 assign no_use=0;
    //regfile,   流水寄存器
    reg_file D_Reg_water (
        .clk    (clk),
        .rst    (rst),  
        .stall  (stall),
		  
        .in_instr (I_instr), 
        .in_pc    (I_pc), 

        .instr  (D_instr), 
        .pc     (D_pc),
		  
		  .in_cmp_is0(no_use)
    );

    ///control  控制器
	 wire D_is_md_instr;
    control D_control_unit (
        .instr        (D_instr), 
        .cmp_is0      (D_cmp_is0), 
        .cmp_e0       (D_cmp_e0), 
        .cmp_l0       (D_cmp_l0), 
        .cmp_g0       (D_cmp_g0), 
        .cmp_new      (D_cmp_new),
        .grf_a1       (D_a1), 
        .grf_a2       (D_a2), 
        .grf_a3       (D_a3), 
        .grf_we       (D_grf_we), 
        .is_md_instr  (D_is_md_instr), 
        .ext_mod      (D_ext_mod), 
        .npc_mod      (D_npc_mod), 
        .is_new_instr (D_is_new_instr)
    );
    
    ///EXT   扩展器
    wire [31:0] D_e32;
    wire [1:0]  D_ext_mod;
    EXT D_EXT (
        .inn    (D_instr[15:0]), 
        .mod    (D_ext_mod), 
        .result (D_e32)
    );

    ///GRF    寄存器堆
    wire [31:0] D_v1_WuZhuanFa, D_v2_WuZhuanFa, D_v1, D_v2;
    wire D_grf_we;
    grf GRF (
        .clk  (clk), 
        .rst  (rst), 
        .we   (W_grf_we), 
        .a1   (D_a1), 
        .a2   (D_a2), 
        .a3   (W_a3), 
        .wd   (W_wd), 
        .pc   (W_pc), 
        .r1   (D_v1_WuZhuanFa), 
        .r2   (D_v2_WuZhuanFa)
    );
    assign D_v1 = ( E_Tnew==2'd0 && D_a1==E_a3 && E_a3!=5'd0 ) ? E_zhuanfa :
                  ( M_Tnew==2'd0 && D_a1==M_a3 && M_a3!=5'd0 ) ? M_zhuanfa :
                                                                 D_v1_WuZhuanFa    ;
    assign D_v2 = ( E_Tnew==2'd0 && D_a2==E_a3 && E_a3!=5'd0 ) ? E_zhuanfa :
                  ( M_Tnew==2'd0 && D_a2==M_a3 && M_a3!=5'd0 ) ? M_zhuanfa :
                                                                 D_v2_WuZhuanFa    ;                                                              
    
    ///CMP     比较器
    wire D_cmp_is0, D_cmp_e0, D_cmp_g0, D_cmp_l0, D_cmp_new;                                                    
    CMP D_CMP (
        .v1      (D_v1), 
        .v2      (D_v2), 
        .cmp_is0 (D_cmp_is0), 
        .cmp_e0  (D_cmp_e0),
        .cmp_g0  (D_cmp_g0),
        .cmp_l0  (D_cmp_l0),
        .cmp_new (D_cmp_new)
    );

    ///npc
    wire [2:0]  D_npc_mod;
	wire [31:0] D_npc;
    npc D_NPC (
        .npc_mod (D_npc_mod), //由D级决定
        .D_pc    (D_pc),
        .I_pc    (I_pc), 
        .imm26   (D_instr[25:0]), 
        .reg32   (D_v1), 
        .npc     (D_npc)
    );

///////////////////////////////////////////////////////////////////////////  E级

    wire E_cmp_is0, E_cmp_e0, E_cmp_g0, E_cmp_l0, E_cmp_new, E_is_new_instr;
    wire [31:0] E_pc8=E_pc+32'd8;

    //reg_file   流水寄存器
    wire [31:0] E_instr,E_pc,E_v1_wzf,E_v2_wzf,E_e32, E_HI, E_LO;
    wire [1:0]  E_Tnew;
    wire E_reg_rst = rst|stall;
    reg_file E_reg_water (
        .clk        (clk), 
        .rst        (E_reg_rst), 
         
        .in_cmp_is0 (D_cmp_is0), 
        .in_cmp_e0  (D_cmp_e0), 
        .in_cmp_g0  (D_cmp_g0), 
        .in_cmp_l0  (D_cmp_l0), 
        .in_cmp_new (D_cmp_new),
        .in_Tnew    (D_Tnew), 
        .in_instr   (D_instr), 
        .in_pc      (D_pc), 
        .in_v1      (D_v1), 
        .in_v2      (D_v2), 
        .in_e32     (D_e32), 
        
        .cmp_is0    (E_cmp_is0), 
        .cmp_e0     (E_cmp_e0), 
        .cmp_g0     (E_cmp_g0), 
        .cmp_l0     (E_cmp_l0), 
        .cmp_new    (E_cmp_new),
        .Tnew       (E_Tnew), 
        .instr      (E_instr), 
        .pc         (E_pc), 
        .v1         (E_v1_wzf), 
        .v2         (E_v2_wzf), 
        .e32        (E_e32)
    );

    //control   控制器
    wire [4:0] E_a1, E_a2, E_a3;
    wire [2:0] mux_E_alu_in2, E_mdu_mod;
    wire [3:0] E_alu_mod;
	 wire [1:0] mux_E_alu_in1;
	 wire [31:0] E_shift_num;
	 wire E_mdu_start;
    control E_control_unit (
        .instr         (E_instr), 
        .cmp_is0       (E_cmp_is0), 
        .cmp_e0        (E_cmp_e0), 
        .cmp_l0        (E_cmp_l0), 
        .cmp_g0        (E_cmp_g0), 
        .cmp_new       (E_cmp_new),
        .grf_a1        (E_a1), 
        .grf_a2        (E_a2), 
        .grf_a3        (E_a3), 

        .alu_mod       (E_alu_mod), 
        .shift_num     (E_shift_num), 
        .mdu_mod       (E_mdu_mod), 
        .mdu_start     (E_mdu_start), 
        .mux_E_alu_in1 (mux_E_alu_in1), 
        .mux_E_alu_in2 (mux_E_alu_in2), 
        .is_new_instr  (E_is_new_instr)
    );

    //alu  
    wire [31:0] E_alu_o, E_v1, E_v2, E_alu_in1, E_alu_in2;
    assign E_v1 = ( E_a1==M_a3 && E_a1!=5'd0 && M_Tnew==2'd0 ) ? M_zhuanfa :
                  ( E_a1==W_a3 && E_a1!=5'd0 )                 ? W_zhuanfa :
                                                                 E_v1_wzf  ;
    assign E_v2 = ( E_a2==M_a3 && E_a2!=5'd0 && M_Tnew==2'd0 ) ? M_zhuanfa :
                  ( E_a2==W_a3 && E_a2!=5'd0 )                 ? W_zhuanfa :
                                                                 E_v2_wzf  ;  
    assign E_alu_in1 = ( mux_E_alu_in1 == `mux_E_alu_in1_v1    ) ? E_v1 :
                       ( mux_E_alu_in1 == `mux_E_alu_in1_shift ) ? E_shift_num :
                                                                   32'd0 ; //无用，只是为了把宏都写出来

    assign E_alu_in2 = ( mux_E_alu_in2 == `mux_E_alu_in2_v2  ) ? E_v2  :
                       ( mux_E_alu_in2 == `mux_E_alu_in2_ext ) ? E_e32 :
                       ( mux_E_alu_in2 == `mux_E_alu_in2_pc8 ) ? E_pc8 :
                                                                 32'd0 ; //无用，只是为了把宏都写出来
    alu E_ALU (
        .d1(E_alu_in1), 
        .d2(E_alu_in2), 
        .mod(E_alu_mod), 
        .result(E_alu_o)
    );

    //MDU  乘除法
	 wire E_mdu_busy;
    mdu E_MDU (
        .clk    (clk), 
        .rst    (rst), 
        .d1     (E_v1), 
        .d2     (E_v2), 
        .start  (E_mdu_start), 
        .mod    (E_mdu_mod), 
        .HI     (E_HI), 
        .LO     (E_LO), 
        .busy   (E_mdu_busy)
    );

    //E_zhuanfa
    wire [31:0] E_zhuanfa = E_alu_in2; 

///////////////////////////////////////////////////////////////////////////  M级

    wire M_cmp_is0, M_cmp_e0, M_cmp_g0, M_cmp_l0, M_cmp_new, M_is_new_instr;
	wire [1:0] M_Tnew;

    //M_RegFile,   流水寄存器
    wire [1:0]  M_in_Tnew = (E_Tnew>2'd0) ? E_Tnew-1 : 2'd0;
    wire [31:0] M_alu_o, M_instr, M_v2_wzf, M_HI, M_LO;
    wire [31:0] M_v2=( M_a2==W_a3 && M_a2!=5'd0 ) ? W_zhuanfa : M_v2_wzf ;
    reg_file M_reg_water (
        .clk        (clk), 
        .rst        (rst), 
        
        .in_cmp_is0 (E_cmp_is0), 
        .in_cmp_e0  (E_cmp_e0), 
        .in_cmp_g0  (E_cmp_g0), 
        .in_cmp_l0  (E_cmp_l0), 
        .in_cmp_new (E_cmp_new),
        .in_Tnew    (M_in_Tnew), 
        .in_instr   (E_instr), 
        .in_pc      (E_pc), 
        .in_v2      (E_v2),  
        .in_alu_o   (E_alu_o), 
        .in_HI      (E_HI), 
        .in_LO      (E_LO),

        .cmp_is0    (M_cmp_is0), 
        .cmp_e0     (M_cmp_e0), 
        .cmp_g0     (M_cmp_g0), 
        .cmp_l0     (M_cmp_l0), 
        .cmp_new    (M_cmp_new),
        .Tnew       (M_Tnew), 
        .instr      (M_instr), 
        .pc         (M_pc),  
        .v2         (M_v2_wzf), 
        .alu_o      (M_alu_o),
        .HI         (M_HI), 
        .LO         (M_LO)
    );
    
    //M_Control  控制器
    wire [4:0] M_a1,M_a2,M_a3; //a1用不上，为了课上
    wire [2:0] M_beu_mod, M_DM_ext_mod;
    wire [1:0] mux_M_zhuanfa;
    control M_control_unit (
        .instr          (M_instr), 
        .cmp_is0        (M_cmp_is0), 
        .cmp_e0         (M_cmp_e0), 
        .cmp_l0         (M_cmp_l0), 
        .cmp_g0         (M_cmp_g0), 
        .cmp_new        (M_cmp_new),
        .grf_a1         (M_a1), 
        .grf_a2         (M_a2), 
        .grf_a3         (M_a3), 
        .beu_mod        (M_beu_mod), 
        .DM_ext_mod     (M_DM_ext_mod), 
        .mux_M_zhuanfa  (mux_M_zhuanfa), 
        .is_new_instr   (M_is_new_instr)
    );

    //M_BEU  写入时的字节使能
    assign M_DM_addr = M_alu_o;  //datapath端口定义
    BEU M_BEU (
        .addr     (M_DM_addr), 
        .mod      (M_beu_mod), 
        .in_wdata (M_v2),
        
        .byteen   (M_DM_byteen),   //datapath端口定义
        .wdata    (M_DM_wdata)    //datapath端口定义
    );

    //M_DM_ext
    wire [31:0] M_DM_o_final;
    DM_ext M_DM_ext (
        .addr    (M_DM_addr), 
        .mod     (M_DM_ext_mod), 
        .in_data (M_DM_o_weichuli), 
        .DM_ext_o(M_DM_o_final)
    );

    //M_zhuanfa
    wire [31:0] M_zhuanfa = ( mux_M_zhuanfa == `mux_M_zhuanfa_alu_o ) ? M_alu_o :
                            ( mux_M_zhuanfa == `mux_M_zhuanfa_HI    ) ? M_HI  :
                            ( mux_M_zhuanfa == `mux_M_zhuanfa_LO    ) ? M_LO  :
                                                                        32'd0 ;
    

///////////////////////////////////////////////////////////////////////////  W级

    wire W_cmp_is0, W_cmp_g0, W_cmp_e0, W_cmp_l0, W_cmp_new, W_is_new_instr;
    wire [31:0] W_zhuanfa = W_wd ;
    assign W_wdata = W_wd; //端口定义
	 wire [31:0] W_HI, W_LO;
    //reg_file,   流水寄存器
    wire [31:0] W_alu_o,W_instr,W_DM_o;
    reg_file w_reg_water (
        .clk        (clk), 
        .rst        (rst), 
        
        .in_cmp_is0 (M_cmp_is0), 
        .in_cmp_e0  (M_cmp_e0), 
        .in_cmp_g0  (M_cmp_g0), 
        .in_cmp_l0  (M_cmp_l0), 
        .in_cmp_new (M_cmp_new),
        .in_instr   (M_instr), 
        .in_pc      (M_pc), 
        .in_alu_o   (M_alu_o), 
        .in_DM_data (M_DM_o_final), 
        .in_HI      (M_HI), 
        .in_LO      (M_LO), 

        .cmp_is0    (W_cmp_is0), 
        .cmp_e0     (W_cmp_e0), 
        .cmp_g0     (W_cmp_g0), 
        .cmp_l0     (W_cmp_l0),    
        .cmp_new    (W_cmp_new),     
        .instr      (W_instr), 
        .pc         (W_pc), 
        .alu_o      (W_alu_o), 
        .DM_data    (W_DM_o), 
        .HI         (W_HI), 
        .LO         (W_LO)
    );

    //W_Control  控制器
    //wire [4:0]  W_a3;//端口定义
    wire [2:0]  mux_W_wd;
    //端口定义wire W_grf_we;
    control W_Control (
        .instr      (W_instr), 
        .cmp_is0    (W_cmp_is0), 
        .cmp_e0     (W_cmp_e0), 
        .cmp_l0     (W_cmp_l0), 
        .cmp_g0     (W_cmp_g0), 
        .cmp_new    (W_cmp_new),
        .grf_a3     (W_a3), 
        .grf_we     (W_grf_we), 
         
        .mux_W_wd   (mux_W_wd), 
        .is_new_instr (W_is_new_instr)
    );

    wire [31:0] W_wd = ( mux_W_wd == `mux_W_wd_alu_o ) ? W_alu_o :
                       ( mux_W_wd == `mux_W_wd_DM_o  ) ? W_DM_o :
                       ( mux_W_wd == `mux_W_wd_HI    ) ? W_HI :
                       ( mux_W_wd == `mux_W_wd_LO    ) ? W_LO :
                                                         32'd0;
     

///////////////////////////////////////////////////////////////////////////  暂停Control
    
    //Tgenerator
    wire [1:0] D_Tnew,D_Tuse1,D_Tuse2;
    TGenerator D_Tgenerator (
        .instr (D_instr), 
        .Tnew  (D_Tnew), 
        .Tuse1 (D_Tuse1), 
        .Tuse2 (D_Tuse2)
    );
    
    //Clash_Control
    wire stall;
    ClashControl Clash_Control (
        .D_a1   (D_a1), 
        .D_a2   (D_a2), 
        .Tuse1  (D_Tuse1), 
        .Tuse2  (D_Tuse2), 
        .E_a3   (E_a3), 
        .E_Tnew (E_Tnew), 
        .M_a3   (M_a3), 
        .M_Tnew (M_Tnew), 
        .mdu_busy  (E_mdu_busy), 
        .mdu_start (E_mdu_start), 
        .D_is_md_instr  (D_is_md_instr),
         
        .D_is_new_instr (D_is_new_instr),
        .E_is_new_instr (E_is_new_instr),
        .M_is_new_instr (M_is_new_instr),
        .do_stall       (stall)
    );
	 
	 
///////////////////////////////////////////////////////////////////////////  DASM
    wire [32*8-1:0] I_asm, D_asm, E_asm, M_asm, W_asm;
	/* DASM I_DASM (
		.pc(I_pc), 
		.instr(I_instr), 
		.reg_name(1'b0), //为0时表示显示寄存器编号，为1时表示显示寄存器名字
		.imm_as_dec(1'b1), //表示是否将立即数用十进制显示（默认HEX，用十进制时`addi`/`addiu`/`slti`/`sltiu`会进行符号扩展，其余进行无符号扩展）
		.asm(I_asm)
	 );*/
    DASM D_DASM (
		.pc(D_pc), 
		.instr(D_instr), 
		.reg_name(1'b0), //为0时表示显示寄存器编号，为1时表示显示寄存器名字
		.imm_as_dec(1'b1), //表示是否将立即数用十进制显示（默认HEX，用十进制时`addi`/`addiu`/`slti`/`sltiu`会进行符号扩展，其余进行无符号扩展）
		.asm(D_asm)
	 );
	 DASM E_DASM (
		.pc(E_pc), 
		.instr(E_instr), 
		.reg_name(1'b0), //为0时表示显示寄存器编号，为1时表示显示寄存器名字
		.imm_as_dec(1'b1), //表示是否将立即数用十进制显示（默认HEX，用十进制时`addi`/`addiu`/`slti`/`sltiu`会进行符号扩展，其余进行无符号扩展）
		.asm(E_asm)
	 );/*
	 DASM M_DASM (
		.pc(M_pc), 
		.instr(M_instr), 
		.reg_name(1'b0), //为0时表示显示寄存器编号，为1时表示显示寄存器名字
		.imm_as_dec(1'b1), //表示是否将立即数用十进制显示（默认HEX，用十进制时`addi`/`addiu`/`slti`/`sltiu`会进行符号扩展，其余进行无符号扩展）
		.asm(M_asm)
	 );
	 DASM W_DASM (
		.pc(W_pc), 
		.instr(W_instr), 
		.reg_name(1'b0), //为0时表示显示寄存器编号，为1时表示显示寄存器名字
		.imm_as_dec(1'b1), //表示是否将立即数用十进制显示（默认HEX，用十进制时`addi`/`addiu`/`slti`/`sltiu`会进行符号扩展，其余进行无符号扩展）
		.asm(W_asm)
	 );*/
    
endmodule