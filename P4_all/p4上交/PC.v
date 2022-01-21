`timescale 1ns / 1ps


module PC(
    input clk,
    input rst,
    input [31:0] npc,
    output reg [31:0] pc
    );

    
    always @(posedge clk) begin
        if(rst==1'b1) begin
            pc <= 32'h3000;
        end
        else begin
            pc <= npc;
        end
    end

endmodule
