`timescale 1ns / 1ps

module mips(
    input wire clk,
    input wire reset,
    input wire [31:0] i_inst_rdata,
    input wire [31:0] m_data_rdata,
	 
    output wire [31:0] i_inst_addr,
    output wire [31:0] m_data_addr,
    output wire [31:0] m_data_wdata,
    output wire [3 :0] m_data_byteen,
    output wire [31:0] m_inst_addr,
    output wire w_grf_we,
    output wire [4:0] w_grf_addr,
    output wire [31:0] w_grf_wdata,
    output wire [31:0] w_inst_addr
);
    Datapath Data_Paht_P6 (
        .clk    (clk), 
        .rst    (reset), 
        .I_instr            (i_inst_rdata), 
        .M_DM_o_weichuli    (m_data_rdata), 

        .I_pc           (i_inst_addr), 
        .M_DM_addr      (m_data_addr), 
        .M_DM_wdata     (m_data_wdata), 
        .M_DM_byteen    (m_data_byteen), 
        .M_pc           (m_inst_addr), 
        .W_grf_we       (w_grf_we), 
        .W_a3           (w_grf_addr), 
        .W_wdata        (w_grf_wdata), 
        .W_pc           (w_inst_addr)
    );

endmodule
