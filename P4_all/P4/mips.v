`timescale 1ns / 1ps

module mips(
    input clk,
    input reset
    );
    
    dataPath u_dataPath (
        .clk(clk), 
        .rst(reset)
    );

endmodule
