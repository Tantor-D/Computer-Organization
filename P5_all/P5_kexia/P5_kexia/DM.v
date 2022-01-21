`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"
//中文 GB 2312

module DM(
    input wire clk,
    input wire we,
    input wire rst,
    input wire [31:0] add,
    input wire [31:0] data,
    input wire [31:0] pc,
    output wire [31:0] result
    );

    reg [31:0] memRam [4095:0]; //开大了一些

    assign result = memRam[ add[13:2] ];

    always @(posedge clk) begin
        if(rst==1'b1) begin: ram_reset
            integer i;
            for(i=0 ; i<4096 ; i=i+1) 
                memRam[i] <= 32'd0;
        end
        else if(we==1'b1) begin
            $display("%d@%h: *%h <= %h", $time, pc, add, data);     //submit
			//$display("@%h: *%h <= %h", pc, add, data);
            memRam[ add[13:2] ] <= data;
        end
    end

endmodule
