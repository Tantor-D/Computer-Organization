`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"
//�����������û��

module DataPath(
    input wire clk,
    input wire rst
    );

////////////////////////////////////////////////////////  I��
    wire [31:0] I_instr,I_pc;

    pc I_PC (
        .clk(clk), 
        .rst(rst), 
        .stall(stall), 
        .in_npc(D_npc), 
        .pc_o(I_pc)   
    );

    IM I_IM (
        .pc(I_pc), 
        .instruction(I_instr)
    );

////////////////////////////////////////////////////////  D��
    wire [31:0] D_instr,D_pc;
    wire [4:0] D_a1,D_a2,D_a3;
    wire D_is_new_instr;

    //regfile,   ��ˮ�Ĵ���
    reg_file D_Reg (
        .stall  (stall), 
        .rst    (rst), 
        .clk    (clk), 

        .in_instr (I_instr), 
        .in_pc    (I_pc), 

        .instr  (D_instr), 
        .pc     (D_pc)

    );

    
    ///control  ������
    control D_Contrl (
        .instr    (D_instr), 
        .cmp_is0  (D_cmp_is0),
        .cmp_g0   (D_cmp_g0), 
        .grf_a1   (D_a1), 
        .grf_a2   (D_a2), 
        .grf_a3   (D_a3), 
        .grf_we   (D_grf_we), 
        .ext_mod  (D_ext_mod), 
        .npc_mod  (D_npc_mod),
        .is_new_instr (D_is_new_instr)
    );

    
    wire [31:0] D_e32;
    wire [1:0]  D_ext_mod;
    ///EXT
    EXT D_EXT (
        .inn    (D_instr[15:0]), 
        .mod    (D_ext_mod), 
        .result (D_e32)
    );

    
    wire [31:0] D_v1_WuZhuanFa,D_v2_WuZhuanFa;
    wire [31:0] D_v1,D_v2;
    wire D_grf_we;
    ///GRF��   �Ĵ�����
    grf GRF (
        .clk  (clk), 
        .we   (W_grf_we), 
        .rst  (rst), 
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
    
    ///CMP
    wire D_cmp_is0,D_cmp_g0;                                                    
    CMP D_CMP (
        .v1      (D_v1), 
        .v2      (D_v2), 
        .cmp_is0 (D_cmp_is0), 
        .cmp_g0  (D_cmp_g0)
    );

    ///npc
    wire [2:0] D_npc_mod;
	wire [31:0] D_npc;
    npc D_NPC (
        .npc_mod(D_npc_mod), //��D������
        .D_pc   (D_pc),
        .I_pc   (I_pc), 
        .imm26  (D_instr[25:0]), 
        .reg32  (D_v1), 
        .npc    (D_npc)
    );

    //Tgenerator
    wire [1:0] D_Tnew,D_Tuse1,D_Tuse2;
    TGenerator D_Tgenerator (
        .instr(D_instr), 
        .Tnew(D_Tnew), 
        .Tuse1(D_Tuse1), 
        .Tuse2(D_Tuse2)
    );

////////////////////////////////////////////////////////  E��
    wire E_cmp_is0,E_cmp_g0,E_is_new_instr;
    wire E_reg_rst=rst|stall;

    //reg_file,   ��ˮ�Ĵ���
    wire [31:0] E_instr,E_pc,E_v1_wzf,E_v2_wzf,E_e32;
    wire [1:0]  E_Tnew;
    wire [31:0] E_pc8=E_pc+32'd8;
    reg_file E_Reg (
        .rst   (E_reg_rst), 
        .clk   (clk), 
        ///
        .in_Tnew  (D_Tnew), 
        .in_instr (D_instr), 
        .in_pc    (D_pc), 
        .in_v1    (D_v1), 
        .in_v2    (D_v2), 
        .in_e32   (D_e32), 
        .in_cmp_is0(D_cmp_is0),
        .in_cmp_g0 (D_cmp_g0),
        ///
        .Tnew  (E_Tnew), 
        .instr (E_instr), 
        .pc    (E_pc),
        .v1    (E_v1_wzf), 
        .v2    (E_v2_wzf), 
        .e32   (E_e32),
        .cmp_is0 (E_cmp_is0),
        .cmp_g0  (E_cmp_g0)
    );

    //control ������
    wire [4:0] E_a1, E_a2, E_a3;
    wire [2:0] E_alu_mod, mux_E_alu_in2;
    control E_control (
        .instr      (E_instr), 
        .cmp_is0    (E_cmp_is0),
        .cmp_g0     (E_cmp_g0), 
        .grf_a1     (E_a1), 
        .grf_a2     (E_a2), 
        .grf_a3     (E_a3), 
        .alu_mod    (E_alu_mod), 
        .mux_E_alu_in2 (mux_E_alu_in2),
        .is_new_instr (E_is_new_instr)
    );

    //alu
    wire [31:0] E_alu_o;
    wire [31:0] E_v1 = ( E_a1==M_a3 && E_a1!=5'd0 && M_Tnew==2'd0 ) ? M_zhuanfa :
                       ( E_a1==W_a3 && E_a1!=5'd0 )                 ? W_zhuanfa :
                                                                      E_v1_wzf  ;
    wire [31:0] E_v2 = ( E_a2==M_a3 && E_a2!=5'd0 && M_Tnew==2'd0 ) ? M_zhuanfa :
                       ( E_a2==W_a3 && E_a2!=5'd0 )                 ? W_zhuanfa :
                                                                      E_v2_wzf  ;  
    wire [31:0] E_alu_in1 = E_v1;
    wire [31:0] E_alu_in2 = ( mux_E_alu_in2 == 3'b000 ) ? E_v2  :
                            ( mux_E_alu_in2 == 3'b001 ) ? E_e32 :
                            ( mux_E_alu_in2 == 3'b010 ) ? E_pc8 :
                                                          32'd0 ;
    alu E_ALU (
        .d1(E_alu_in1), 
        .d2(E_alu_in2), 
        .mod(E_alu_mod), 
        .result(E_alu_o)
    );

    //E_zhuanfa
    wire [31:0] E_zhuanfa = E_alu_in2; 


////////////////////////////////////////////////////////  M��
    wire M_cmp_is0,M_cmp_g0,M_is_new_instr;
	wire [1:0] M_Tnew;

    //M_RegFile,   ��ˮ�Ĵ���
    wire [1:0]  M_in_Tnew = (E_Tnew>2'd0) ? E_Tnew-1 : 2'd0;
    wire [31:0] M_alu_o, M_pc, M_instr, M_v2_wzf;
    wire M_DM_we;
    reg_file M_RegFile (
        .rst    (rst), 
        .clk    (clk), 

        .in_Tnew   (M_in_Tnew), 
        .in_instr  (E_instr), 
        .in_pc     (E_pc), 
        .in_alu_o  (E_alu_o), 
        .in_v2     (E_v2),
        .in_cmp_is0(E_cmp_is0),
        .in_cmp_g0 (E_cmp_g0),

        .Tnew    (M_Tnew), 
        .instr   (M_instr), 
        .pc      (M_pc), 
        .alu_o   (M_alu_o), 
        .v2      (M_v2_wzf),
        .cmp_is0 (M_cmp_is0),
        .cmp_g0  (M_cmp_g0)
    );
    wire [31:0] M_v2=( M_a2==W_a3 && M_a2!=5'd0 ) ? W_zhuanfa : M_v2_wzf ;

    //M_Control  ������
    wire [4:0] M_a3,M_a2;
    wire M_grf_we;
    control M_Control (
        .instr   (M_instr),
        .cmp_is0 (M_cmp_is0),
        .cmp_g0  (M_cmp_g0),  
        .grf_a2  (M_a2),
        .grf_a3  (M_a3), 
        .grf_we  (M_grf_we), 
        .DM_we   (M_DM_we),
        .is_new_instr (M_is_new_instr)
    );

    //M_DM
    wire [31:0] M_DM_o;
    wire [31:0] M_data_in = M_v2;
    DM M_DM (
        .clk   (clk), 
        .we    (M_DM_we), 
        .rst   (rst), 
        .add   (M_alu_o), 
        .data  (M_data_in), 
        .pc    (M_pc), 
        .result(M_DM_o)
    );

    //M_zhuanfa
    wire [31:0] M_zhuanfa = M_alu_o ;

////////////////////////////////////////////////////////  W��
    wire W_cmp_is0,W_cmp_g0,W_is_new_instr;
    wire [31:0] W_wd = (mux_W_wd==2'b00) ? W_alu_o : W_DM_o;
    wire [31:0] W_zhuanfa = W_wd ;

    //reg_file,   ��ˮ�Ĵ���
    wire [31:0] W_alu_o,W_instr,W_pc,W_DM_o;
    reg_file w_reg_file (
        .rst(rst), 
        .clk(clk), 
        
        .in_instr   (M_instr), 
        .in_alu_o   (M_alu_o), 
        .in_DM_data (M_DM_o), 
        .in_pc      (M_pc), 
        .in_cmp_is0 (M_cmp_is0),
        .in_cmp_g0  (M_cmp_g0),

        .instr      (W_instr), 
        .alu_o      (W_alu_o), 
        .DM_data    (W_DM_o),
        .pc         (W_pc),
        .cmp_is0    (W_cmp_is0),
        .cmp_g0     (W_cmp_g0)
    );

    //W_Control  ������
    wire [4:0]  W_a3;
    wire [1:0]  mux_W_wd;
    wire W_grf_we;
    control W_Control (
        .instr    (W_instr), 
        .cmp_is0  (W_cmp_is0),
        .cmp_g0   (W_cmp_g0), 
        .grf_a3   (W_a3), 
        .grf_we   (W_grf_we), 
        .mux_W_wd (mux_W_wd),
        .is_new_instr (W_is_new_instr)
    );


////////////////////////////////////////////////////////  ��ͣControl
    wire stall;
    ClashControl instance_name (
        .D_a1(D_a1), 
        .D_a2(D_a2), 
        .Tuse1(D_Tuse1), 
        .Tuse2(D_Tuse2), 
        .E_a3(E_a3), 
        .E_Tnew(E_Tnew), 
        .M_a3(M_a3), 
        .M_Tnew(M_Tnew), 
        .do_stall(stall)
    );
	 
	 
	 
////////////////////////////////////////////////////////  DASM
   DASM D_DASM (
		.pc(D_pc), 
		.instr(D_instr), 
		.reg_name(1'b0), //Ϊ0ʱ��ʾ��ʾ�Ĵ�����ţ�Ϊ1ʱ��ʾ��ʾ�Ĵ�������
		.imm_as_dec(1'b1) //��ʾ�Ƿ���������ʮ������ʾ��Ĭ��HEX����ʮ����ʱ`addi`/`addiu`/`slti`/`sltiu`����з�����չ����������޷�����չ��
    );
    DASM I_DASM (
		.pc(I_pc), 
		.instr(I_instr), 
		.reg_name(1'b0), //Ϊ0ʱ��ʾ��ʾ�Ĵ�����ţ�Ϊ1ʱ��ʾ��ʾ�Ĵ�������
		.imm_as_dec(1'b1) //��ʾ�Ƿ���������ʮ������ʾ��Ĭ��HEX����ʮ����ʱ`addi`/`addiu`/`slti`/`sltiu`����з�����չ����������޷�����չ��
    );

endmodule

/*
E:
cd software_data\ISE_data\P5
D:\Program\ISE\14.7\ISE_DS\ISE\bin\nt\fuse -nodebug -prj mips.prj -o mips.exe mips_tb_p5> log.txt
set XILINX=D:\Program\ISE\14.7\ISE_DS\ISE
mips.exe -nolog -tclbatch mips.tcl 1> ans2.txt 2>err.txt

*/
