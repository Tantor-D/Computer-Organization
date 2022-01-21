`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"

module grf(
    input wire clk,
    input wire rst,
	 input wire we,
    input wire [4:0] a1,
    input wire [4:0] a2,
    input wire [4:0] a3,
    input wire [31:0] wd,
    input wire [31:0] pc,
    output wire [31:0] r1,
    output wire [31:0] r2
    );

    reg [31:0] mem [31:0];
	 
    assign r1= ( a1==a3 && a3!=5'd0 && we==1'b1) ? wd : mem[a1];
    assign r2= ( a2==a3 && a3!=5'd0 && we==1'b1) ? wd : mem[a2];

    
    always@(posedge clk) begin
        if( rst == 1'b1 ) begin:doResetInGrf
            integer i;
            for( i=0 ; i<=31; i=i+1)
                mem[i] <= 32'd0;    
        end
        else if(we==1'b1 && a3!=5'd0) begin
				//$display("%d@%h: $%d <= %h", $time, pc, a3, wd);    //submit
                //$display("@%h: $%d <= %h", pc, a3, wd);             
                mem[a3] <= wd;
        end
    end

endmodule
