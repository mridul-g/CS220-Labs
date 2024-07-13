`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:31:41 02/26/2024 
// Design Name: 
// Module Name:    five_bit_add_subtract 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module five_bit_add_subtract(A, B, sum, carry, k);
	input [3:0]A;
	input [1:0]B;
	input k;
	output [4:0]sum;
	wire [4:0]sum;
	output carry;
	wire carry0;
   wire carry1;
   wire carry2;
   wire carry3;
   wire carry;
	
	full_adder FA0(A[0], B[0], k, sum[0], carry0, k );
	full_adder FA1(A[1], B[1], carry0, sum[1], carry1, k);
   full_adder FA2(A[2], 0, carry1, sum[2], carry2, k);
	full_adder FA3(A[3], 0, carry2, sum[3], carry3, k);
	full_adder FA4(0, 0, carry3, sum[4], carry, k);

endmodule
