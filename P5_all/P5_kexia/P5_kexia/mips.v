`timescale 1ns / 1ps

module mips(
    input wire clk,
    input wire reset
    );

	DataPath P5_DataPath (
        .clk(clk), 
        .rst(reset)
    );

endmodule
