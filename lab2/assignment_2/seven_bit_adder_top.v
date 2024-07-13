`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:35:39 01/27/2024
// Design Name:   seven_bit_adder
// Module Name:   /media/nipun/Crucial X8/CS220Labs/Lab2_2/seven_bit_adder/seven_bit_adder_top.v
// Project Name:  seven_bit_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven_bit_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seven_bit_adder_top;

	// Inputs
	reg [3:0] in;
	reg PB1;
	reg PB2;
	reg PB3;
	reg PB4;

	// Outputs
	wire [6:0] sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	seven_bit_adder uut (
		.in(in), 
		.PB1(PB1), 
		.PB2(PB2), 
		.PB3(PB3), 
		.PB4(PB4), 
		.sum(sum), 
		.carry(carry)
	);

	always @(sum or carry) begin
		$display("time=%d: %b: PB1 = %b, PB2 = %b, PB3 = %b, PB4 = %b\nsum = %b, carry = %b\n", $time,in, PB1, PB2, PB3, PB4 , sum, carry);
	end
	
	initial begin
		// Initialize Inputs
		in=4'b0000;
		PB1 = 1; PB2 = 1; PB3 = 1; PB4 = 1;
		/*
		#1
		PB1 = 1;
		#1
		PB2 = 1;
		#1
		PB3 = 1;
		#1
		PB4 = 1;
		*/
		#5
		PB1 = 0; PB2 = 0; PB3 = 0; PB4 = 0;
		in = 4'b0001;
		#1
		PB1 = 1;
		#1
		PB2 = 1;
		#1
		PB3 = 1;
		#1
		PB4 = 1;
		
		#5
		PB1 = 0; PB2 = 0; PB3 = 0; PB4 = 0;
		in = 4'b0010;
		#1
		PB1 = 1;
		#1
		PB2 = 1;
		#1
		PB3 = 1;
		#1
		PB4 = 1;
		
		#5
		PB1 = 0; PB2 = 0; PB3 = 0; PB4 = 0;
		in = 4'b0110;
		#1
		PB1 = 1;
		#1
		PB2 = 1;
		#1
		PB3 = 1;
		#1
		PB4 = 1;
	
		#5
		$finish;
	end
      
endmodule

