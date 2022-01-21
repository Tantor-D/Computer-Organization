`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"

module control(
    input wire [31:0] instr,
    input wire cmp_is0,//这个是差是否为0
    input wire cmp_e0,
    input wire cmp_l0,
    input wire cmp_g0,
    input wire cmp_new,
    
    output wire [4:0] grf_a1,
    output wire [4:0] grf_a2,
    output wire [4:0] grf_a3,
    output wire grf_we,
    output wire is_md_instr,

    output wire [1:0] ext_mod,//D
    output wire [2:0] npc_mod,
    
    output wire [3:0] alu_mod,//E
    output wire [31:0] shift_num,
    output wire [2:0] mdu_mod,
    output wire mdu_start,
    output wire [1:0] mux_E_alu_in1,
    output wire [2:0] mux_E_alu_in2,

    output wire [2:0] beu_mod,//M
    output wire [2:0] DM_ext_mod,
    output wire [1:0] mux_M_zhuanfa,

    output wire [2:0] mux_W_wd,//W

    output wire is_new_instr
    );
	
    wire [5:0] op_code = instr [31:26] ;
    wire [5:0] funct = instr [5:0] ;
    wire [4:0] aa1 = instr [25:21] ;
    wire [4:0] aa2 = instr [20:16] ;
    wire [4:0] aa3 = instr [15:11] ;
    wire [4:0] sss = instr [10: 6] ;
    wire op_is0 = !( |op_code );

    //base类
    wire base_class,add,addu,sub,subu,_and,_or,_xor,_nor;
    assign add = ( op_is0 && funct==6'b100000 );
    assign addu= ( op_is0 && funct==6'b100001 );
    assign sub = ( op_is0 && funct==6'b100010 );
    assign subu= ( op_is0 && funct==6'b100011 );
    assign _and= ( op_is0 && funct==6'b100100 ); 
    assign _or = ( op_is0 && funct==6'b100101 );
    assign _xor= ( op_is0 && funct==6'b100110 );
    assign _nor= ( op_is0 && funct==6'b100111 );
    assign base_class= ( add| addu| sub| subu| _and| _or| _xor| _nor );
    
    //load类
    wire load_class,lb,lbu,lh,lhu,lw;
    assign lb  = ( op_code==6'b100000 );
    assign lbu = ( op_code==6'b100100 );
    assign lh  = ( op_code==6'b100001 );
    assign lhu = ( op_code==6'b100101 );
    assign lw  = ( op_code==6'b100011 );
    assign load_class= ( lb| lbu| lh| lhu| lw );

    //store类
    wire store_class,sb,sh,sw;
    assign sb = ( op_code==6'b101000 );
    assign sh = ( op_code==6'b101001 );
    assign sw = ( op_code==6'b101011 );
    assign store_class = ( sb| sh| sw );

    //shift类
    wire shift_class,sll,srl,sra,sllv,srlv,srav;
    assign sll = ( op_is0 && funct==6'b000000 );
    assign srl = ( op_is0 && funct==6'b000010 ); 
    assign sra = ( op_is0 && funct==6'b000011 ); 
    assign sllv= ( op_is0 && funct==6'b000100 ); 
    assign srlv= ( op_is0 && funct==6'b000110 ); 
    assign srav= ( op_is0 && funct==6'b000111 ); 
    assign shift_class= ( sll| srl| sra| sllv| srlv| srav ); 
    //imm类
    wire imm_class,addi,addiu,andi,ori,xori,lui;
    assign addi = ( op_code==6'b001000 );
    assign addiu= ( op_code==6'b001001 );
    assign andi = ( op_code==6'b001100 );
    assign ori  = ( op_code==6'b001101 );
    assign xori = ( op_code==6'b001110 );
    assign lui  = ( op_code==6'b001111 );
    assign imm_class = (addi| addiu| andi| ori| xori| lui);

    //set类
    wire set_class,slt,slti,sltiu,sltu;
    assign slt  = ( op_is0 && funct==6'b101010 );
    assign sltu = ( op_is0 && funct==6'b101011 );
    assign slti = ( op_code==6'b001010 );
    assign sltiu= ( op_code==6'b001011 );
    assign set_class= (slt| slti| sltiu| sltu);

    //md类
    wire md_class,mult,multu,div,divu;
    assign mult = ( op_is0 && funct==6'b011000 );
    assign multu= ( op_is0 && funct==6'b011001 );
    assign div  = ( op_is0 && funct==6'b011010 );
    assign divu = ( op_is0 && funct==6'b011011 );
    assign md_class= (mult| multu| div| divu);

    //hilo类
    wire hilo_class,mfhi,mflo,mthi,mtlo;
    assign mfhi = ( op_is0 && funct==6'b010000 );
    assign mthi = ( op_is0 && funct==6'b010001 );
    assign mflo = ( op_is0 && funct==6'b010010 );
    assign mtlo = ( op_is0 && funct==6'b010011 );
    assign hilo_class= (mfhi| mflo| mthi| mtlo);

    //brch类
    wire brch_class,beq,bne,blez,bgtz,bltz,bgez;
    assign beq = ( op_code==6'b000100 );
    assign bne = ( op_code==6'b000101 );
    assign blez= ( op_code==6'b000110 );
    assign bgtz= ( op_code==6'b000111 );
    assign bltz= ( op_code==6'b000001 && aa2==5'b00000);
    assign bgez= ( op_code==6'b000001 && aa2==5'b00001);
    assign brch_class= (beq| bne| blez| bgtz| bltz| bgez);

    //jump类
    wire jump_class, j, jal, jalr, jr;
    assign j   = ( op_code==6'b000010 );
    assign jal = ( op_code==6'b000011 );
    assign jalr= ( op_is0 && funct==6'b001001 );
    assign jr  = ( op_is0 && funct==6'b001000 );
    assign jump_class= (j| jal| jalr| jr);

    //考虑nop
    wire nop=~(|instr);
    
    wire madd;
    assign madd = ( op_code==6'b011100);
    assign is_new_instr = madd  ;
    

/////////////////////////////////////////////////////////////////信号

    //D+W grf
    assign grf_a1 = ( j || jal || nop ) ? 5'd0 : aa1 ;
    assign grf_a2 = ( base_class || shift_class || (slt||sltu) || md_class || store_class || (beq||bne) || madd) ? aa2 : 5'd0;
    assign grf_a3 = ( base_class || shift_class || (slt||sltu) || (mfhi||mflo) || jalr ) ? aa3 :
                    ( (slti||sltiu) || imm_class || load_class )                ? aa2 :
                    ( jal )                                                     ? 5'd31 : 
                                                                                  5'd0;

    assign grf_we = ( grf_a3!=5'd0 ) ? 1:0;

    //D   ext
    assign ext_mod=( (slti||sltiu) || (addi||addiu) || load_class || store_class ) ? `ext_sign :
                   ( lui )                                                         ? `ext_lui :
                                                                                     `ext_0   ; //new  2'b11

    //D   npc
    wire le0,ge0;
    assign le0 = cmp_e0 || cmp_l0;
    assign ge0 = cmp_e0 || cmp_g0;
    assign npc_mod=( (beq && cmp_is0) || (bne && cmp_is0==1'b0) || (blez && le0) || (bgez && ge0) || (bltz && cmp_l0) || (bgtz && cmp_g0) ) ? `npc_brch :
                   ( jal || j )  ? `npc_j :
                   ( jr || jalr) ? `npc_jr :
                                   `npc_add4 ;  //new  3'b100

    //E   alu
    assign shift_num = { 27'd0, sss };
    assign alu_mod=( sub  || subu ) ? `alu_sub :
                   ( _and || andi ) ? `alu_and :
                   ( _or  || ori  ) ? `alu_or  : 
                   ( _xor || xori ) ? `alu_xor :  
                   ( _nor )         ? `alu_nor :
                   ( sll  || sllv ) ? `alu_sll :
                   ( srl  || srlv ) ? `alu_srl :
                   ( sra  || srav ) ? `alu_sra :
                   ( slt  || slti ) ? `alu_slt_signed :
                   ( sltu || sltiu) ? `alu_slt_unsigned :
                   ( lui  || jal || jalr ) ? `alu_in2 :
                                             `alu_add ;    //new   4'b1100

    //E   is_md_instr
    assign is_md_instr = ( md_class | hilo_class | madd );

    //E   mdu    
    assign mdu_start = md_class | madd;
    assign mdu_mod = ( mult  ) ? `mdu_mul_signed :
                     ( multu ) ? `mdu_mul_unsigned :
                     ( div   ) ? `mdu_div_signed :
                     ( divu  ) ? `mdu_div_unsigned :
                     ( mthi  ) ? `mdu_moveto_HI :
                     ( mtlo  ) ? `mdu_moveto_LO :
                     ( madd  ) ? 3'b110 :  //new    3'b110
                                 3'b111;//需要一个信号表示现在MDU啥也不干，前四条md_class类指令需要start信号启动，start时前4种必中一个，另外两种不用start，因此需要一个特殊信号表示新操作。


    //E   mux_alu_in
    assign mux_E_alu_in1 = ( sll || srl || sra ) ? `mux_E_alu_in1_shift : `mux_E_alu_in1_v1 ;
    assign mux_E_alu_in2 = ( imm_class || (slti||sltiu) || load_class || store_class ) ? `mux_E_alu_in2_ext : 
                           ( jal || jalr )                                             ? `mux_E_alu_in2_pc8 :  
                                                                                         `mux_E_alu_in2_v2;   //grf_v2

    //M   beu                               
    assign beu_mod = ( sw ) ? `beu_w :
                     ( sb ) ? `beu_b :
                     ( sh ) ? `beu_h :
                              `beu_none; //不是store类型指令时需要强制置0

    //M   DM_ext
    assign DM_ext_mod = ( lw ) ? `DM_ext_none :
                        ( lb ) ? `DM_ext_b_signed :
                        ( lbu) ? `DM_ext_b_unsigned :
                        ( lh ) ? `DM_ext_h_signed :
                                 `DM_ext_h_unsigned;  //lhu

    //M   zhuanfa
    assign mux_M_zhuanfa = ( mfhi ) ? `mux_M_zhuanfa_HI :
                           ( mflo ) ? `mux_M_zhuanfa_LO :
                                      `mux_M_zhuanfa_alu_o;
    

    //W   mux_W_wd
    assign mux_W_wd = ( mfhi )      ? `mux_W_wd_HI :   
                      ( mflo )      ? `mux_W_wd_LO :  
                      ( load_class) ? `mux_W_wd_DM_o :
                                      `mux_W_wd_alu_o ;

endmodule