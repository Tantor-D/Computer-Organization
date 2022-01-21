`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"

/*
��������ӳٲ۲�����ע��һ���ǵ�ǰ��D����ָ����źţ�����Ҫ����ӳٲۡ�
��ʱ��Ҫ����һ��stall�źŵ����У����˵��ʱ��Ҫ��ͣ����ô����ͣ������գ������ʱ����ͣ��������ӳٲ�
D_rst = rst | ( D_is_new_instr & D_clear_yanchicao & ~stall )

�������Ҫ�޸ġ�дʹ�ܡ��˵�ָ�һ��Ҫͬ���޸�A3����дʹ��Ϊ0ʱҲҪ��A3��0��

grf_we������ô��Ҫ����ΪA3������grf_we������������ 
ע�����������M�����ܲ�����ָ�ǰ����control�и�����û������x����ʱҪ��===������==

��������� is_new_instr �� assign ��ʵ�ֶ�·ѡ��������ôҪ�� is_new_instr �ŵ���ǰ�棬���������Ч����Ϊ�������ź�Ҳ�������Ӧ�Ŀ����źš�
*/

/*
ÿһ���⣬���ǣ�
    1.����ʵ��   
    2.������ͣ��AT   
    3.ת������ʱҪת���¶���������PC4    
    4.����Ǻ�����ܵõ��źţ�Ҫ��===��ֹӰ��ǰ��
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

///////////////////////////////////////////////////////////////////////////  I��

    pc I_PC (
        .clk   (clk), 
        .rst   (rst), 
        .stall (stall), 
        .in_npc(D_npc), 
        .pc_o  (I_pc)
    );
	 

///////////////////////////////////////////////////////////////////////////  D��
    wire [31:0] D_instr,D_pc;
    wire [4:0] D_a1,D_a2,D_a3;
    wire D_is_new_instr;

	 wire no_use;
	 assign no_use=0;
    //regfile,   ��ˮ�Ĵ���
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

    ///control  ������
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
    
    ///EXT   ��չ��
    wire [31:0] D_e32;
    wire [1:0]  D_ext_mod;
    EXT D_EXT (
        .inn    (D_instr[15:0]), 
        .mod    (D_ext_mod), 
        .result (D_e32)
    );

    ///GRF    �Ĵ�����
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
    
    ///CMP     �Ƚ���
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
        .npc_mod (D_npc_mod), //��D������
        .D_pc    (D_pc),
        .I_pc    (I_pc), 
        .imm26   (D_instr[25:0]), 
        .reg32   (D_v1), 
        .npc     (D_npc)
    );

///////////////////////////////////////////////////////////////////////////  E��

    wire E_cmp_is0, E_cmp_e0, E_cmp_g0, E_cmp_l0, E_cmp_new, E_is_new_instr;
    wire [31:0] E_pc8=E_pc+32'd8;

    //reg_file   ��ˮ�Ĵ���
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

    //control   ������
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
                                                                   32'd0 ; //���ã�ֻ��Ϊ�˰Ѻ궼д����

    assign E_alu_in2 = ( mux_E_alu_in2 == `mux_E_alu_in2_v2  ) ? E_v2  :
                       ( mux_E_alu_in2 == `mux_E_alu_in2_ext ) ? E_e32 :
                       ( mux_E_alu_in2 == `mux_E_alu_in2_pc8 ) ? E_pc8 :
                                                                 32'd0 ; //���ã�ֻ��Ϊ�˰Ѻ궼д����
    alu E_ALU (
        .d1(E_alu_in1), 
        .d2(E_alu_in2), 
        .mod(E_alu_mod), 
        .result(E_alu_o)
    );

    //MDU  �˳���
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

///////////////////////////////////////////////////////////////////////////  M��

    wire M_cmp_is0, M_cmp_e0, M_cmp_g0, M_cmp_l0, M_cmp_new, M_is_new_instr;
	wire [1:0] M_Tnew;

    //M_RegFile,   ��ˮ�Ĵ���
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
    
    //M_Control  ������
    wire [4:0] M_a1,M_a2,M_a3; //a1�ò��ϣ�Ϊ�˿���
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

    //M_BEU  д��ʱ���ֽ�ʹ��
    assign M_DM_addr = M_alu_o;  //datapath�˿ڶ���
    BEU M_BEU (
        .addr     (M_DM_addr), 
        .mod      (M_beu_mod), 
        .in_wdata (M_v2),
        
        .byteen   (M_DM_byteen),   //datapath�˿ڶ���
        .wdata    (M_DM_wdata)    //datapath�˿ڶ���
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
    

///////////////////////////////////////////////////////////////////////////  W��

    wire W_cmp_is0, W_cmp_g0, W_cmp_e0, W_cmp_l0, W_cmp_new, W_is_new_instr;
    wire [31:0] W_zhuanfa = W_wd ;
    assign W_wdata = W_wd; //�˿ڶ���
	 wire [31:0] W_HI, W_LO;
    //reg_file,   ��ˮ�Ĵ���
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

    //W_Control  ������
    //wire [4:0]  W_a3;//�˿ڶ���
    wire [2:0]  mux_W_wd;
    //�˿ڶ���wire W_grf_we;
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
     

///////////////////////////////////////////////////////////////////////////  ��ͣControl
    
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
		.reg_name(1'b0), //Ϊ0ʱ��ʾ��ʾ�Ĵ�����ţ�Ϊ1ʱ��ʾ��ʾ�Ĵ�������
		.imm_as_dec(1'b1), //��ʾ�Ƿ���������ʮ������ʾ��Ĭ��HEX����ʮ����ʱ`addi`/`addiu`/`slti`/`sltiu`����з�����չ����������޷�����չ��
		.asm(I_asm)
	 );*/
    DASM D_DASM (
		.pc(D_pc), 
		.instr(D_instr), 
		.reg_name(1'b0), //Ϊ0ʱ��ʾ��ʾ�Ĵ�����ţ�Ϊ1ʱ��ʾ��ʾ�Ĵ�������
		.imm_as_dec(1'b1), //��ʾ�Ƿ���������ʮ������ʾ��Ĭ��HEX����ʮ����ʱ`addi`/`addiu`/`slti`/`sltiu`����з�����չ����������޷�����չ��
		.asm(D_asm)
	 );
	 DASM E_DASM (
		.pc(E_pc), 
		.instr(E_instr), 
		.reg_name(1'b0), //Ϊ0ʱ��ʾ��ʾ�Ĵ�����ţ�Ϊ1ʱ��ʾ��ʾ�Ĵ�������
		.imm_as_dec(1'b1), //��ʾ�Ƿ���������ʮ������ʾ��Ĭ��HEX����ʮ����ʱ`addi`/`addiu`/`slti`/`sltiu`����з�����չ����������޷�����չ��
		.asm(E_asm)
	 );/*
	 DASM M_DASM (
		.pc(M_pc), 
		.instr(M_instr), 
		.reg_name(1'b0), //Ϊ0ʱ��ʾ��ʾ�Ĵ�����ţ�Ϊ1ʱ��ʾ��ʾ�Ĵ�������
		.imm_as_dec(1'b1), //��ʾ�Ƿ���������ʮ������ʾ��Ĭ��HEX����ʮ����ʱ`addi`/`addiu`/`slti`/`sltiu`����з�����չ����������޷�����չ��
		.asm(M_asm)
	 );
	 DASM W_DASM (
		.pc(W_pc), 
		.instr(W_instr), 
		.reg_name(1'b0), //Ϊ0ʱ��ʾ��ʾ�Ĵ�����ţ�Ϊ1ʱ��ʾ��ʾ�Ĵ�������
		.imm_as_dec(1'b1), //��ʾ�Ƿ���������ʮ������ʾ��Ĭ��HEX����ʮ����ʱ`addi`/`addiu`/`slti`/`sltiu`����з�����չ����������޷�����չ��
		.asm(W_asm)
	 );*/
    
endmodule