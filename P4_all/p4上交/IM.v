`timescale 1ns / 1ps


module IM(
    input [31:0] pc,
    output [31:0] instruction 
    );

    reg[31:0] memRom [1023:0];
	 
	initial begin
        $readmemh("code.txt",memRom);
    end

    wire [31:0] rightAdd; 
	assign rightAdd= pc - 32'h3000;
    assign instruction = memRom [ rightAdd[11:2] ];
    //дrightAdd[11:2]����ȥ����λ��ȡ10λ����֪������д�в���
endmodule
