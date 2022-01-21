`timescale 1ns / 1ps


module mips_tb_p5;

	// Inputs
	reg clk;
	reg reset;
	
	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.clk(clk), 
		.reset(reset)
	);
	

	always #5 clk=~clk;
	
	initial begin
		// Initialize Inputs

		clk = 0;
		reset = 1;
		// Wait 100 ns for global reset to finish
		#12;
		reset = 0;
	
		// Add stimulus here
	end
      
endmodule

/*上机时配置：
	1.改VS code，设置中搜索 Auto Guess Encoding
	2.Mars常用测试代码
*/

/*
ori $t0,$0,1		#positive number
ori $t1,$0,4
ori $t2,$0,8
ori $t3,$0,200
ori $t4,$0,4000

subu $s0,$0,1		#negagive number
subu $s1,$0,4
subu $s2,$0,8
subu $s3,$0,200
subu $s4,$0,4000

ori $t5,$0,1
ori $t5,$0,1		#a boundary
*/

/*已完成：
	流水cmp的信号，加到datapath和control中
	增加is_new_instr 并加到datapath中
*/