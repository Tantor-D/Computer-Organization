`timescale 1ns / 1ps

module TestOfP0_tb;

	// Inputs
	reg [1:0] in;
	reg clk;

	// Outputs
	wire [1:0] out;

	// Instantiate the Unit Under Test (UUT)
	TestOfP0 uut (
		.in(in), 
		.clk(clk), 
		.out(out)
	);

	always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		in = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#10;
		#2 in=2'd0;
		#10 in=2'd2;
		#10 in=2'd2;
		#10 in=2'd0;
		#10 in=2'd2;
		#10 in=2'd1;
		#10 in=2'd0;
		#10 in=2'd2;
		#10 in=2'd0;
		#10 in=2'd1;
		#10 in=2'd1;
		#10 in=2'd1;
		
		#10 in=2'd3;//input 3 to reset
		
		#10 in=2'd2;
		#10 in=2'd0;
		#10 in=2'd1;
		#10 in=2'd1;
		#10 in=2'd2;
		#10 in=2'd0;
		#10 in=2'd2;
		#10 in=2'd0;
		#10 in=2'd2;
		#10 in=2'd1;
        
		// Add stimulus here

	end
      
endmodule

