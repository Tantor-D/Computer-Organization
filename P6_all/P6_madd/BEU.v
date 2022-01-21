`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"
//ÖĞÎÄ GB 2312

module BEU(
    input wire [31:0] addr,
    input wire [2:0] mod,
    input wire [31:0] v2,
    output reg [3:0] byteen,
    output reg [31:0] wdata
    );

    always @(*) begin
        case (mod)
            `beu_w: begin
                byteen = 4'b1111;
                wdata  = v2;
            end
            `beu_h: begin
                if(addr[1]==1'b1) begin
                    byteen = 4'b1100;
                    wdata  = {v2[15:0], 16'd0};
                end 
                else begin
                    byteen = 4'b0011;
                    wdata  = {16'd0, v2[15:0]};
                end 
            end
            `beu_b: begin
                if(addr[1:0]==2'b00) begin
                    byteen = 4'b0001; 
                    wdata  = {24'd0, v2[7:0]};
                end       
                else if(addr[1:0]==2'b01) begin
                    byteen = 4'b0010;
                    wdata  = {16'd0, v2[7:0], 8'd0};
                end 
                else if(addr[1:0]==2'b10) begin
                    byteen = 4'b0100;
                    wdata  = {8'd0, v2[7:0], 16'd0};
                end 
                else if(addr[1:0]==2'b11) begin
                    byteen = 4'b1000;  
                    wdata  = {v2[7:0], 24'd0};
                end   
            end
            
            `beu_none: begin 
                byteen = 4'b0000;
                wdata  = v2;
            end

            

            default: begin 
                byteen = 4'b0000;
                wdata  = v2;
            end
        endcase
    end

endmodule
