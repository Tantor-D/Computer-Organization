`timescale 1ns / 1ps

module grf(
    input clk,
    input we,
    input rst,
    input [4:0] a1,
    input [4:0] a2,
    input [4:0] a3,
    input [31:0] wd,
    input [31:0] pc,
    output [31:0] r1,
    output [31:0] r2
    );

    
    reg [31:0] mem [31:0];

    assign r1= (a1==5'd0)? 32'd0: mem[a1];
    assign r2= (a2==5'd0)? 32'd0: mem[a2];

    always@(posedge clk) begin
        if( rst == 1'b1 ) begin:doResetInGrf
            integer i;
            for( i=0 ; i<=31; i=i+1)
                mem[i] <= 32'd0;    
        end
        else if(we==1'b1) begin
            $display("@%h: $%d <= %h", pc, a3, wd);
            mem[a3] <= wd;
        end
    end

endmodule
