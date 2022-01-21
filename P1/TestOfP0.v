`timescale 1ns / 1ps
module TestOfP0(
	input [1:0] in,
    input clk,
    output [1:0] out
    );
    reg [2:0] sta;
	 
    parameter s0 = 3'b000;
    parameter s1 = 3'b001;
    parameter s2 = 3'b010;
    parameter s3 = 3'b011;
    parameter s5 = 3'b101;
    
    assign out=(in==2'd1&&sta==s2)?2'b01:
					(in==2'd1&&sta==s3)?2'b10:
											  2'b00;
    initial begin
        sta<=s5;
    end 
    always @(posedge clk) begin
        case (sta)
            s0:begin
                if(in==2'd0)
                    sta<=s1;
                else if(in==2'd2)
                    sta<=s0;
                else sta<=s5;
            end
            s1:begin
                if(in==2'd1)
                    sta<=s2;
                else if(in==2'd2)
                    sta<=s3;
                else sta<=s5;
            end
            s2:begin
                if(in==2'd2)
                    sta<=s0;
                else sta<=s5;
            end
            s3:begin
                if(in==2'd0)    
                    sta<=s1;
                else if(in==2'd2)
                    sta<=s0;
                else sta<=s5;
            end
            s5:begin
                if(in==2'd2)
                    sta<=s0;
                else
                    sta<=sta;    
            end
            default: sta<=s5;
        endcase
    end

endmodule
