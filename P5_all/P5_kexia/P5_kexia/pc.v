`timescale 1ns / 1ps

module pc(
    input  wire clk,
    input  wire rst,
    input  wire stall,
    input  wire [31:0] in_npc,
	output reg  [31:0] pc_o
    );

    always @(posedge clk) begin
        if(rst) begin
            pc_o <= 32'h3000;
        end
        else begin
            if(stall) begin  //stall时pc的值不变
                pc_o <= pc_o;
            end
            else begin
                pc_o <= in_npc;
            end
            
        end
    end

endmodule
