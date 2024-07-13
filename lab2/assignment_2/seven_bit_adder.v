`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:08 01/27/2024 
// Design Name: 
// Module Name:    seven_bit_adder 
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
module full_adder(a, b, cin, sum, cout);
	input a;
	input b;
	input cin;
	output sum;
	wire sum;
	output cout;
	wire cout;
	assign sum = a^b^cin;
	assign cout = (a & b) | (b & cin) | (cin & a);
endmodule


module seven_bit_adder( in, PB1, PB2, PB3 ,PB4, sum ,carry
    );
	 input [3:0]in;
	 input PB1;
	 input PB2;
	 input PB3;
	 input PB4;
	 output [6:0]sum;
	 output carry;
	 reg [6:0]x;
	 reg [6:0]y;
	 wire [6:0]sum;
    wire carry0;
	 wire carry1;
	 wire carry2;
	 wire carry3;
	 wire carry4;
	 wire carry5;
	 
	 always @(posedge PB1) begin
	 x[3:0]<=in;
	 end
	 
	 always @(posedge PB2) begin
	 x[6:4]<=in[2:0];
	 end
	 
	 always @(posedge PB3) begin
	 y[3:0]<=in;
	 end
	 always @(posedge PB4) begin
	 y[6:4]<=in[2:0];
	 end
	 
	 full_adder FA0(x[0], y[0], 1'b0, sum[0], carry0);
	 full_adder FA1(x[1], y[1], carry0, sum[1], carry1);
	 full_adder FA2(x[2], y[2], carry1, sum[2], carry2);
	 full_adder FA3(x[3], y[3], carry2, sum[3], carry3);
	 full_adder FA4(x[4], y[4], carry3, sum[4], carry4);
	 full_adder FA5(x[5], y[5], carry4, sum[5], carry5);
	 full_adder FA6(x[6], y[6], carry5, sum[6], carry);

endmodule
