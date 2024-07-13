`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:07:18 02/05/2024 
// Design Name: 
// Module Name:    five_four_adder 
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
module five_four_adder(PB1, PB2, PB3, PB4, PB5, Y, sum, carry_out
    );
	 input PB1, PB2, PB3 ,PB4, PB5;
	 input [3:0]Y;
	 output [5:0]sum;
	 wire [5:0]sum;
	 output carry_out;
	 wire carry_out;
    reg [3:0] a1, a2, a3, a4;
	 reg [5:0] a5;
	 wire [4:0] b1, b2;
	 wire [5:0] c;
	 always@(posedge PB1)
	 a1<=Y;
	 always@(posedge PB2)
	 a2<=Y;
	 always@(posedge PB3)
	 a3<=Y;
	 always@(posedge PB4)
	 a4<=Y;
	 always@(posedge PB5) begin
	 a5[3:0]<=Y;
	 a5[4]<=0;
	 a5[5]<=0;
	 end
	 four_bit_adder FA0(a1, a2, b1[3:0], b1[4]);
	 four_bit_adder FA1(a3, a4, b2[3:0], b2[4]);
	 five_bit_adder FA2(b1, b2, c[4:0], c[5]);
	 six_bit_adder FA3(c, a5, sum, carry_out);

	 
	 

endmodule
