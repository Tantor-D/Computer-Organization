`timescale 1ns / 1ps

module dataPath(
    input clk,
    input rst
    );

    ///// for control
    wire [2:0]  npc_op, alu_op, mux_grf_wd;
    wire [1:0]  mux_grf_a3,mux_alu_in2,ext_op;
    wire alu_is0;

    ///// for ext
    wire [31:0] ext_out;

    ///// for pc and npc and IM
    wire [31:0] pc,npc,instruction,pc_plus4;
    
    ///// for grf
    wire [31:0] grf_wd,r1,r2;
    wire [4:0]  a1,a2,a3;
    wire grf_we;

    ///// for alu
    wire [31:0] alu_out,alu_in2;

    ///// for DM
    wire DM_we;
    wire [31:0] DM_out,DM_add,DM_in_data;


    /// pc
    PC u_PC (.clk(clk), .rst(rst), .npc(npc), .pc(pc));

    /// IM
    IM u_IM (.pc(pc), .instruction(instruction));

    /// control
    control u_control (.op_code(instruction[31:26]), .funct(instruction[5:0]), 
        .alu_is0(alu_is0), 
        .npc_op(npc_op), 
        .alu_op(alu_op), 
        .ext_op(ext_op), 
        .grf_we(grf_we), 
        .DM_we(DM_we), 
        .mux_grf_a3(mux_grf_a3), 
        .mux_grf_wd(mux_grf_wd), 
        .mux_alu_in2(mux_alu_in2)
        );

    
    /// npc
    npc u_npc (
        .op(npc_op),
        .pc(pc), 
        .imm26(instruction[25:0]),
        .reg32(r1), 
        .npc(npc), 
        .pc_plus4(pc_plus4)
    );

    /// grf
    assign a1=instruction[25:21];
    assign a2=instruction[20:16];
    assign a3= (mux_grf_a3==2'b00) ? instruction[15:11] :
            (mux_grf_a3==2'b01) ? instruction[20:16] :
            (mux_grf_a3==2'b10) ? 5'd31 :
                                 5'd0;
    assign grf_wd=(mux_grf_wd==3'b000) ? alu_out :
                  (mux_grf_wd==3'b001) ? DM_out :
                  (mux_grf_wd==3'b010) ? ext_out :
                  (mux_grf_wd==3'b011) ? pc_plus4 :
                                         32'd0;
    grf u_grf (.clk(clk),  .we(grf_we), .rst(rst), .a1(a1), .a2(a2), .a3(a3), .wd(grf_wd), .pc(pc) , .r1(r1), .r2(r2));


    /// alu
    assign alu_in2=(mux_alu_in2==2'b00) ? r2 :
                   (mux_alu_in2==2'b01) ? ext_out :
                                          32'd0;
    alu u_alu (
        .d1(r1), 
        .d2(alu_in2), 
        .op(alu_op), 
        .is_0(alu_is0), 
        .result(alu_out)
    );

    /// EXT
    EXT u_ext (
        .inn(instruction[15:0]), 
        .op(ext_op), 
        .result(ext_out)
    );

    /// DM
    assign DM_add=alu_out;
    assign DM_in_data=r2;
    DM u_DM (
        .clk(clk), 
        .we(DM_we), 
        .rst(rst), 
        .add(DM_add),
        .data(DM_in_data), 
        .pc(pc), 
        .result(DM_out)
    );

endmodule
