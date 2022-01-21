`timescale 1ns / 1ps
module string(
    input clk,
    input clr,
    output out,
    input [7:0] in
    );
    wire isdigit=(in>="0"&&in<="9")?1'b1:1'b0;
    wire ischar =(in=="+"||in=="*")?1'b1:1'b0;
    reg [1:0] sta;
    reg bol;
    parameter s0 = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b11;

    assign out=(sta==s1 && bol==1'b1)?1'b1:1'b0;   

    initial begin
        sta=s2;
        bol=1'b1;
    end
    always @(posedge clk,posedge clr) begin
        if(clr==1'b1) begin
            sta<=2'b11;;
            bol<=1'b1;
        end
        else  case (sta)
            2'b01:begin//digit
                if(ischar==1'b1) begin
                    sta<=s0;
                end
                else begin
                    sta<=s1;
                    bol=1'b0;
                end
            end

            2'b00:begin//char
                if(isdigit==1'b1) begin
                    sta<=s1;
                end
                else begin
                    bol=1'b0;
                    sta<=s0;
                end
            end

            2'b11:begin
                if(ischar==1'b1) begin
                    bol=1'b0;
                    sta<=s0;
                end
                else if(isdigit==1'b1) 
                    sta<=s1;
            end
           // default: sta<=2'b11;
        endcase

    end


endmodule
