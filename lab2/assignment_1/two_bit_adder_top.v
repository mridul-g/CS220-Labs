`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:36:44 01/22/2024
// Design Name:   two_bit_adder
// Module Name:   /media/apoorv/Mridul/CS220Labs/Lab2_1/two_bit_adder/two_bit_adder_top.v
// Project Name:  two_bit_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: two_bit_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module two_bit_adder_top;

	// Inputs
	reg [1:0] x;
	reg [1:0] y;

	// Outputs
	wire [1:0] z;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	two_bit_adder uut (
		.x(x), 
		.y(y), 
		.z(z), 
		.carry(carry)
	);


		always @(z or carry) begin
			$display("time=%d: %b + %b = %b, carry = %b\n", $time, x,y,z, carry);
		end
		
		initial begin
			x = 2'b00; y = 2'b00;
			#5
			x = 2'b00; y = 2'b01;
			#5
			x = 2'b01; y = 2'b00;
			#5
			x = 2'b01; y = 2'b01;
			#5
			x = 2'b10; y = 2'b00;
			#5
			x = 2'b10; y = 2'b01;
			#5
			x = 2'b11; y = 2'b00;
			#5
			x = 2'b11; y = 2'b01;
			#5
			$finish;
		end

      
endmodule

