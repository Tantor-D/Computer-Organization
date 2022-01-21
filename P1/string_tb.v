`timescale 1ns / 1ps

module string_tb;

	// Inputs
	reg clk;
	reg clr;
	reg [7:0] in;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	string uut (
		.clk(clk), 
		.clr(clr), 
		.out(out), 
		.in(in)
	);

	always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		clr = 0;
		in = 0;
		clr=1'b1;
		// Wait 100 ns for global reset to finish
		#3 clr=1'b0;
      #10 in="1";
		#10 in="+";
		#10 in="2";
		#10 in="+";
		#10 in="1";
		#10 in="+";
		#10 in="1";
		#2 clr=1'b1;
		#10 in="*";
		#20 clr=1'b0;
		#10 in="1";
		#10 in="*";
		#10 in="1";
		
		// Add stimulus here

	end
      
endmodule

