`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:32:47 10/25/2021 
// Design Name: 
// Module Name:    BlockChecker 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module BlockChecker(
    input clk,
    input reset,
    input [7:0] in,
    output result
    );

    reg [3:0] sta;
    reg [31:0] num;

    parameter yes = 1'b1;
    parameter no  = 1'b0 ;
    parameter s0 = 4'b0000;
    parameter s1 = 4'b0001;
    parameter s2 = 4'b0010;
    parameter s3 = 4'b0011;
    parameter s4 = 4'b0100;
    parameter s5 = 4'b0101;
    parameter s6 = 4'b0110;
    parameter s7 = 4'b0111;
    parameter s8 = 4'b1000;
    parameter s9 = 4'b1111;
    parameter s10= 4'b1001;
    parameter s11= 4'b1010;

    assign result=(num==0 && sta!=s9) ? 1:0;
    assign isb=(in=="b"||in=="B")?1:0;
    assign ise=(in=="e"||in=="E")?1:0;
    assign isg=(in=="g"||in=="G")?1:0;
    assign isi=(in=="i"||in=="I")?1:0;
    assign isn=(in=="n"||in=="N")?1:0;
    assign isd=(in=="d"||in=="D")?1:0;

    //试试case删掉begin end
    always @(posedge clk,posedge reset) begin
        if(reset==yes) begin
            sta<=s0;
            num<=32'd0;
        end
        else begin
            case (sta)
                s0:begin//空格
                    if(isb==yes) sta<=s1;
                    else if(ise==yes) sta<=s6;
                    else if(in==" ")    sta<=s0;
                    else sta<=s5;
                end

                s1:begin//b
                    if(ise==yes) sta<=s2;
                    else if(in==" ")    sta<=s0;
                    else sta<=s5;
                end

                s2:begin//e
                    if(isg==yes) sta<=s3;
                    else if(in==" ")    sta<=s0;
                    else sta<=s5;
                end
                    
                s3:begin//g
                    if(isi==yes) sta<=s4;
                    else if(in==" ")    sta<=s0;
                    else sta<=s5;
                end

                s4:begin//i
                    if(isn==yes)begin
                        sta<=s10;
                        num<=num+1;
                    end
                    else if(in==" ")    sta<=s0;
                    else sta<=s5;
                end
                    
                s5:begin//某一次匹配到一半发现失败了，转到s5，可从此处转到s0
                    if(in==" ") sta<=s0;
                    else sta<=sta;
                end

                s6:begin//e
                    if(isn==yes)    sta<=s7;
                    else if(in==" ")    sta<=s0;
                    else sta<=s5;    
                end

                s7:begin//n
                    if(isd==yes)begin
                        if(num==32'd0) sta<=s9;
                        else begin
                            sta<=s11;
                            num<=num-1;
                        end
                    end
                    else if(in==" ")    sta<=s0;
                    else sta<=s5;
                end

                //s8:
                s9: sta<=s9;

                s10:begin
                    if(in==" ")begin
                        sta<=s0;
                    end
                    else begin
                        num=num-1;
                        sta<=s5;
                    end     
                end

                s11:begin
                    if(in==" ")begin
                        sta<=s0;
                    end    
                    else begin
                        num=num+1;
                        sta<=s5; 
                    end
                end 
                default: sta<=s5;
            endcase
        end

    end

endmodule
//NewBlockChecker