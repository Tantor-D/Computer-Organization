`timescale 1ns / 1ps

module NewBlockChecker_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] in;

	// Outputs
	wire result;

	// Instantiate the Unit Under Test (UUT)
	BlockChecker uut (
		.clk(clk), 
		.reset(reset), 
		.in(in), 
		.result(result)
	);

	always #5 clk=~clk;
	initial begin
		clk = 0;
		reset = 1;
		in = 0;

		#18 reset=1'b0;
		//Hello worldï¼Œbegin comPuTer orGANization Endã�
		//eNDï¼ŒbeGin studyã�
		#10 in="H";
		#10 in="e";
		#10 in="l";
		#10 in="l";
		#10 in="o";
		#10 in="w";
		#10 in=" ";
		#10 in="w";
		#10 in="o";
		#10 in="r";
		#10 in="l";
		#10 in="d";
		#10 in=" ";
		#10 in=" ";
		#10 in="b";
		#10 in="e";
		#10 in="g";
		#10 in="i";
		#10 in="n";
		#10 in="n";
		#10 in=" ";
		#10 in="c";
		#10 in="o";
		#10 in="m";
		#10 in=" ";
		#10 in=" ";
		#10 in="E";
		#10 in="n";
		#10 in="d";
		#10 in="d";
		#10 in=" ";
		
		#10 reset = 1'b1;
		#10 reset = 1'b0;

		#10 in="E";
		#10 in="N";
		#10 in="d";
		#10 in=" ";
		#10 in="b";
		#10 in="e";
		#10 in="g";
		#10 in="i";
		#10 in="n";
		#10 in="s";

		#80 reset = 1'b1;
		// Add stimulus here

	end
      
endmodule

