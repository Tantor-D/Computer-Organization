`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"
//中文 GB 2312

module DM_ext(
    input wire [31:0] addr,
    input wire [2:0]  mod,
    input wire [31:0] in_data,

    output reg [31:0] DM_ext_o
    );

    always @(*) begin
        case (mod)
            `DM_ext_none: begin
                DM_ext_o = in_data;    
            end
            `DM_ext_b_signed: begin
                if(addr[1:0]==2'b00)      DM_ext_o={ {24{in_data[ 7]}}, in_data[ 7:0]};  
                else if(addr[1:0]==2'b01) DM_ext_o={ {24{in_data[15]}}, in_data[15:8]}; 
                else if(addr[1:0]==2'b10) DM_ext_o={ {24{in_data[23]}}, in_data[23:16]}; 
                else if(addr[1:0]==2'b11) DM_ext_o={ {24{in_data[31]}}, in_data[31:24]}; 
            end
            `DM_ext_b_unsigned: begin
                if(addr[1:0]==2'b00)      DM_ext_o={24'd0, in_data[ 7:0]};  
                else if(addr[1:0]==2'b01) DM_ext_o={24'd0, in_data[15:8]}; 
                else if(addr[1:0]==2'b10) DM_ext_o={24'd0, in_data[23:16]}; 
                else if(addr[1:0]==2'b11) DM_ext_o={24'd0, in_data[31:24]};    
            end
            `DM_ext_h_signed: begin
                if(addr[1]==1'b1) DM_ext_o={ {16{in_data[31]}} ,in_data[31:16]};
                else DM_ext_o={ {16{in_data[15]}} ,in_data[15:0]};
            end
            `DM_ext_h_unsigned: begin
                if(addr[1]==1'b1) DM_ext_o={16'd0 ,in_data[31:16]};
                else DM_ext_o={16'd0 ,in_data[15:0]};   
            end
            default: DM_ext_o = in_data; //写此条是为了避免生成锁存器，本身无用，就是不拓展
        endcase
    end


endmodule
