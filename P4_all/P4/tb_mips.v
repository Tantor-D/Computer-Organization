`timescale 1ns / 1ps

module tb_mips;

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
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		#3 reset=1'b1;
		#10 reset=1'b0;
		
	end
	
endmodule

