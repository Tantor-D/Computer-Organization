`timescale 1ns / 1ps
`default_nettype none
`include "define_file.v"

module mdu(
    input wire clk,
    input wire rst,

    input wire [31:0] d1,
    input wire [31:0] d2,

    input wire start,
    input wire [2:0] mod,
    
    output reg [31:0] HI,
    output reg [31:0] LO,
    output wire busy
    );
    
    reg [3:0] cnt; //四位，计数器

    assign busy = (cnt!=0) ;

    always @(posedge clk) begin
        if(rst) begin
            HI=32'd0;
            LO=32'd0;
            cnt=4'd0;
        end
        else if(start) begin
            case (mod)
                `mdu_mul_signed:   begin
                    {HI,LO} <= $signed(d1) * $signed(d2);
                    cnt <= 5;
                end 

                `mdu_mul_unsigned: begin
                    {HI,LO} <= d1 * d2;
                    cnt <= 5;
                end 

                `mdu_div_signed:   begin
                    LO <= $signed(d1) / $signed(d2);
                    HI <= $signed(d1) % $signed(d2);
                    cnt <= 10;
                end

                `mdu_div_unsigned: begin
                    LO <= d1 / d2;
                    HI <= d1 % d2;
                    cnt <= 10;
                end

                3'b110 : begin
                    {HI,LO} <= {HI,LO} + $signed( $signed(64'd0) + $signed(d1)*$signed(d2) );
                end 
                //`mdu_moveto_HI:    HI <= d1;

                //`mdu_moveto_LO:    LO <= d1;
                
            endcase
        end
        else if (mod == `mdu_moveto_HI) HI <= d1;
        else if (mod == `mdu_moveto_LO) LO <= d1;
        
        else if(cnt!=0) cnt<=cnt-4'd1;
    end

endmodule
