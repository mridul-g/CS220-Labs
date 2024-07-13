`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:48:57 02/26/2024
// Design Name:   Grid_Walk
// Module Name:   /media/cse/Crucial X8/CS220Labs/Lab6_2/Grid_Walk/Grid_Walk_top.v
// Project Name:  Grid_Walk
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Grid_Walk
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Grid_Walk_top( clk, Y, ROT_A, ROT_B, final_x, final_y);
	input clk, ROT_A, ROT_B;
	input[3:0] Y;	// 2 bit move length, 2 bit direction msb
	
	output[3:0] final_x,final_y;
	wire[3:0] final_x;
	wire[3:0] final_y;
	wire rotation_event;
	
	// rotation_check uut0(clk, ROT_A, ROT_B, rotation_event);
	Grid_Walk uut1(clk, Y, ROT_A, ROT_B, final_x, final_y);
      
endmodule

