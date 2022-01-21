`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"

module ClashControl(
    input wire [4:0] D_a1,
    input wire [4:0] D_a2,
    input wire [1:0] Tuse1,
    input wire [1:0] Tuse2,

    input wire [4:0] E_a3,
    input wire [1:0] E_Tnew,

    input wire [4:0] M_a3,
    input wire [1:0] M_Tnew,

    input wire mdu_busy,
    input wire mdu_start,
    input wire D_is_md_instr,
    
    input wire D_is_new_instr,
    input wire E_is_new_instr,//暴力暂停的话是E，M级是新指令就停，W级一定出结果，不停
    input wire M_is_new_instr,
    
    output wire do_stall
    );
    
    wire e1,e2,m1,m2,md;

    assign e1 = (D_a1==E_a3) & (E_a3!=5'd0) & (Tuse1<E_Tnew);
    assign e2 = (D_a2==E_a3) & (E_a3!=5'd0) & (Tuse2<E_Tnew);
    assign m1 = (D_a1==M_a3) & (M_a3!=5'd0) & (Tuse1<M_Tnew);
    assign m2 = (D_a2==M_a3) & (M_a3!=5'd0) & (Tuse2<M_Tnew);

    assign md = D_is_md_instr & ( mdu_busy | mdu_start ) ;

/*
    assign e1_add = E_is_new_instr & (Tuse1<E_Tnew) & (D_a1== ttttt ) & ( ttttt !=5'd0) ;
    assign e2_add = E_is_new_instr & (Tuse2<E_Tnew) & (D_a2== ttttt ) & ( ttttt !=5'd0) ;
    assign m1_add = M_is_new_instr & (Tuse1<M_Tnew) & (D_a1== ttttt ) & ( ttttt !=5'd0) ;
    assign m2_add = M_is_new_instr & (Tuse2<M_Tnew) & (D_a2== ttttt ) & ( ttttt !=5'd0) ;
  //assign e1_add = E_is_new_instr & (Tuse1<E_Tnew) & (D_a1==E_a3_add) & (E_a3_add!=5’d0) ; //这个需要新加接口，E_a3_add
*/
    assign do_stall= (e1 || e2 || m1 || m2 || md) ? 1'b1 : 1'b0;

endmodule
