`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:55 01/22/2024 
// Design Name: 
// Module Name:    eight_bit_comparator 
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
module eight_bit_comp(PB1, PB2, PB3, PB4, Y, l, g, e);
	 input PB1;
	 input PB2;
	 input PB3;
	 input PB4;
	 input [3:0]Y;
	 output l;
	 output g;
	 output e;
	 wire l0, l1, l2, l3, l4, l5, l6;
	 wire g0, g1, g2, g3, g4, g5, g6;
	 wire e0, e1, e2, e3, e4, e5, e6;
	 
	 reg [7:0]A;
	 reg [7:0]B;
	 wire l;
	 wire g;
	 wire e;
	 
	 // assigning bits to the input
	always @(posedge PB1) begin
		A[3:0] <= #2 Y;
	end
	always @(posedge PB2) begin
		A[7:4] <= #2 Y;
	end
	
	always @(posedge PB3) begin
		B[3:0] <= #2 Y;
	end
	always @(posedge PB4) begin
		B[7:4] <= #2 Y;
	end
	 
	 // imaginary bits are equal 
	 one_bit_comparator C0(A[7], B[7], 1'b0, 1'b0, 1'b1, l0, g0, e0);
	 one_bit_comparator C1(A[6], B[6], l0, g0, e0, l1, g1, e1);
	 one_bit_comparator C2(A[5], B[5], l1, g1, e1, l2, g2, e2);
	 one_bit_comparator C3(A[4], B[4], l2, g2, e2, l3, g3, e3);
	 one_bit_comparator C4(A[3], B[3], l3, g3, e3, l4, g4, e4);
	 one_bit_comparator C5(A[2], B[2], l4, g4, e4, l5, g5, e5);
	 one_bit_comparator C6(A[1], B[1], l5, g5, e5, l6, g6, e6);
	 one_bit_comparator C7(A[0], B[0], l6, g6, e6, l, g, e);

endmodule
