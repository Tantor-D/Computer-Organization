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

    output wire do_stall
    );

    wire e1,e2,m1,m2;

    assign e1 = (D_a1==E_a3) && (E_a3!=5'd0) && (Tuse1<E_Tnew);
    assign e2 = (D_a2==E_a3) && (E_a3!=5'd0) && (Tuse2<E_Tnew);

    assign m1 = (D_a1==M_a3) && (M_a3!=5'd0) && (Tuse1<M_Tnew);
    assign m2 = (D_a2==M_a3) && (M_a3!=5'd0) && (Tuse2<M_Tnew);

    assign do_stall= (e1||e2||m1||m2) ? 1'b1 : 1'b0;

endmodule
