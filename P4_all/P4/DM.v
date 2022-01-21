`timescale 1ns / 1ps

module DM(
    input clk,
    input we,
    input rst,
    input [31:0] add,
    input [31:0] data,
    input [31:0] pc,
    output [31:0] result
    );

    reg [31:0] memRam [1023:0]; 

    assign result = memRam[ add[11:2] ];
    always @(posedge clk) begin
        if(rst==1'b1) begin: ram_reset
            integer i;
            for(i=0 ; i<1024 ; i=i+1) 
                memRam[i] <= 32'd0;
        end
        else if(we==1'b1) begin
            $display("@%h: *%h <= %h", pc, add, data);
            memRam[ add[11:2] ] <= data;
        end
    end

endmodule
