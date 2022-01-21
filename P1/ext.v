`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:10 10/24/2021 
// Design Name: 
// Module Name:    ext 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ext(
    input [15:0] imm,
    input [1:0] EOp,
    output [31:0] ext
    );
    assign ext = (EOp==2'b00 && imm[15]==2'b1) ? {{16{1'b1}},imm[15:0]} :
                 (EOp==2'b00 && imm[15]==2'b0) ? {{16{1'b0}},imm[15:0]} :
                 (EOp==2'b01) ? {{16{1'b0}},imm[15:0]} :
                 (EOp==2'b10) ? {imm[15:0],{16{1'b0}}}:
                 (EOp==2'b11 && imm[15]==1'b1) ? {{14{1}},imm[15:0],1'b0,1'b0} :
                 (EOp==2'b11 && imm[15]==1'b0) ? {{14{0}},imm[15:0],1'b0,1'b0} :
                                                                        32'd0;
endmodule
