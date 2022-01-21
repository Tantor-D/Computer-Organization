`timescale 1ns / 1ps
module alu_tb;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [2:0] ALUOp;

	// Outputs
	wire [31:0] C;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.A(A), 
		.B(B), 
		.ALUOp(ALUOp), 
		.C(C)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		ALUOp = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
		
		#10;
		A=32'hffff0000;
		B=32'h00000003;
		ALUOp=3'b101;
		
/*		#10;
		A=
		B=
		ALUOp=2'b000;
		
		#10;
		A=
		B=
		ALUOp=2'b000;
		
		#10;
		A=
		B=
		ALUOp=2'b000;
		
		#10;
		A=
		B=
		ALUOp=2'b000;
		
		#10;
		A=
		B=
		ALUOp=2'b000;
*/
	end
      
endmodule

