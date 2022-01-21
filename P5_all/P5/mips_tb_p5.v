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

/*
上机时配置：
	1.改VS code，设置中搜索 Auto Guess Encoding
	2.Mars常用测试代码
	3.ISE记得加default

////////////////////////////////////////////////////////////////////////////

上机时应该是不要用的
写一个mips.tcl文件，用txt写
run 500us;
exit

E:
cd software_data\ISE_data\P5Test1
D:\Program\ISE\14.7\ISE_DS\ISE\bin\nt\fuse -nodebug -prj mips.prj -o mips.exe mips_tb_p5> log.txt
set XILINX=D:\Program\ISE\14.7\ISE_DS\ISE
mips.exe -nolog -tclbatch mips.tcl 1> ans2.txt 2>err.txt

////////////////////////////////////////////////////////////////////////////

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

////////////////////////////////////////////////////////////////////////////

TAG0:
ori $t0,$0,1		#positive number
ori $t1,$0,4
ori $t2,$0,8
ori $t3,$0,200
ori $t4,$0,4000

bltzal $t0,TAG2		#go forward and fail
nop

TAG1:
subu $s0,$0,1		#negagive number
subu $s1,$0,4
subu $s2,$0,8
subu $s3,$0,200
subu $s4,$0,4000

bltzal $s4,TAG2		#go forward and success  ,  should stop
#nop

addu $t5,$t4,$t0		#build a gap
addu $t5,$t4,$t0
TAG2:
ori $t5,$0,1
ori $t5,$0,1		#a boundary

bltzal $0,TAG0		#go back and fail
nop
bltzal $s0,TAG0		#go back and success
nop
TAG3:

////////////////////////////////////////////////////////////////////////////
*/