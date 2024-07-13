`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:48:35 01/22/2024
// Design Name:   eight_bit_comp
// Module Name:   /media/cse/Mridul/CS220Labs/Lab2_2/eight_bit_comparator/eight_bit_comparator_top.v
// Project Name:  eight_bit_comparator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: eight_bit_comp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module eight_bit_comparator_top;

	// Inputs
	reg PB1;
	reg PB2;
	reg PB3;
	reg PB4;
	reg [3:0] Y;

	// Outputs
	wire l;
	wire g;
	wire e;

	// Instantiate the Unit Under Test (UUT)
	eight_bit_comp uut (
		.PB1(PB1), 
		.PB2(PB2), 
		.PB3(PB3), 
		.PB4(PB4), 
		.Y(Y), 
		.l(l), 
		.g(g), 
		.e(e)
	);
	
	always@( l or g or e) begin
		$display("time = %d: %b %b %b", $time, l, g, e);
	end
	
	initial begin
		// Initialize Inputs
		Y=4'b0000;
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
		Y = 4'b0001;
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
		Y = 4'b0010;
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
		Y = 4'b0110;
		#1
		PB4 = 1;
		#1
		PB2 = 1;
		#1
		PB1 = 1;
		#1
		PB3 = 1;
		
		#5
		PB1 = 0; PB2 = 0; PB3 = 0; PB4 = 0;
		Y = 4'b1010;
		#1
		PB3 = 1;
		#1
		PB2 = 1;
		#1
		PB4 = 1;
		#1
		PB1 = 1;
	
		#5
		$finish;
	end
      
endmodule

