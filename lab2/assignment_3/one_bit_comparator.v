`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:31:58 01/22/2024 
// Design Name: 
// Module Name:    one_bit_comparator 
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
module one_bit_comparator( a, b, li, gi, ei, l, g, e
);
	input a;
	input b;
	input li;
	input gi;
	input ei;

	output l;
	wire l;
	output e;
	wire e;
	output g;
	wire g;
	assign l = li |(~a & b & ei);
	assign e = (a&b |~a&~b)& ei;
	assign g = gi |(a & ~b & ei);

endmodule
