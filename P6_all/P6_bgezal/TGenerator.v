`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"

module TGenerator(
    input  wire [31:0] instr,
    output wire [1:0] Tnew,
    output wire [1:0] Tuse1,
    output wire [1:0] Tuse2
    );

    
    wire [5:0] op_code = instr [31:26] ;
    wire [5:0] funct = instr [5:0] ;
    wire op_is0 = !( |op_code );
	wire [4:0] aa1 = instr [25:21] ;
    wire [4:0] aa2 = instr [20:16] ;
    wire [4:0] aa3 = instr [15:11] ;

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
    wire shift_v_class = (sllv| srlv| srav);

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

    wire nop=~(|instr);
   
    wire bgezal;
    assign bgezal = ( op_code==6'b000001 && aa2==5'b10001) ;

    //generate Tnew and Tuse
    assign Tnew = ( lui || (jalr||jal) || bgezal )  ? 2'd0 :
                  ( base_class || shift_class || set_class || (imm_class&&lui==1'b0) || (mfhi||mflo) ) ? 2'd1 :
                  ( load_class )         ? 2'd2 :
                                           2'd0 ;
    
    assign Tuse1 = ( brch_class || (jr||jalr) || bgezal )     ? 2'd0 :
                   ( base_class || shift_v_class || set_class || imm_class || md_class || (mthi||mtlo) || load_class || store_class ) ? 2'd1 :
                                                      2'd3 ;
    
    assign Tuse2 = ( (beq||bne) )   ? 2'd0 :
                   ( base_class || shift_class || (slt||sltu) || md_class ) ? 2'd1 :
                   ( store_class )  ? 2'd2 :
                                      2'd3 ;
    
endmodule
