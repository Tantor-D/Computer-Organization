`timescale 1ns / 1ps
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
    parameter s9 = 4'b1001;
    parameter s10= 4'b1010;
    parameter s11= 4'b1011;

    assign result=(num==32'd0 && sta!=s9) ? 1:0;
    assign isb=(in=="b"||in=="B")?1:0;
    assign ise=(in=="e"||in=="E")?1:0;
    assign isg=(in=="g"||in=="G")?1:0;
    assign isi=(in=="i"||in=="I")?1:0;
    assign isn=(in=="n"||in=="N")?1:0;
    assign isd=(in=="d"||in=="D")?1:0;

    //����caseɾ��begin end
    always @(posedge clk,posedge reset) begin
        if(reset==yes) begin
            sta<=s0;//reset�꣬������Ϊ�Ѿ�������һ���ո�
            num<=32'd0;
        end
        else begin
            case (sta)
                s0://�ո�
                    if(isb==yes) sta<=s1;
                    else if(ise==yes) sta<=s6;
                    else if(in==" ")    sta<=s0;//�����������ܿո�
                    else sta<=s5;       
						  
                s1://b
                    if(ise==yes) sta<=s2;
                    else if(in==" ")    sta<=s0;
                    else sta<=s5;
                

                s2://e
                    if(isg==yes) sta<=s3;
                    else if(in==" ")    sta<=s0;
                    else sta<=s5;
                
                    
                s3://g
                    if(isi==yes) sta<=s4;
                    else if(in==" ")    sta<=s0;
                    else sta<=s5;
                

                s4://i
                    if(isn==yes)begin
                        sta<=s10;
                        num<=num+1;//Ϊ�˲��λ����̱仯����num+1
                    end
                    else if(in==" ")    sta<=s0;
                    else sta<=s5;
                
                    
                s5://ĳһ��ƥ�䵽һ�뷢��ʧ���ˣ�ת��s5��һֱ�������˿ո��ת��s0
                    if(in==" ") sta<=s0;
                    else sta<=sta;
                

                s6://e
                    if(isn==yes)    sta<=s7;
                    else if(in==" ")    sta<=s0;
                    else sta<=s5;  
               

                s7://n
                    if(isd==yes)begin
                        sta<=s11;
                        num<=num-1;
                    end
                    else if(in==" ")    sta<=s0;
                    else sta<=s5;
                

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
                        if(num==32'hffffffff)begin
                            sta<=s9;
                        end
                        else sta<=s0;
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