`timescale 1ns / 1ps

module IM(
    input  wire [31:0] pc,
    output wire [31:0] instruction 
    );

    reg [31:0] memRom [4095:0];
	 
	initial begin
        $readmemh("code.txt",memRom);
    end

    wire [31:0] rightAdd; 
	assign rightAdd= pc - 32'h3000;
    assign instruction = memRom [ rightAdd[13:2] ];
    //дrightAdd[13:2]����ȥ����λ��ȡ12λ����֪������д�в���
endmodule
