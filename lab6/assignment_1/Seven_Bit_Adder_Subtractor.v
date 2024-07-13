`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:28:56 02/26/2024 
// Design Name: 
// Module Name:    Seven_Bit_Adder_Subtractor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Aditional Comments: 
//
/////////////////////////////////////////////////////////////////////////////////
module Seven_Bit_Adder_Subtractor( clk, ROT_A, ROT_B, sum, overflow ,Y
    );
	 input clk;
	 input [3:0]Y;
	 input ROT_A, ROT_B;
	 output [6:0]sum;
	 wire [6:0]sum;
	 output overflow;
	 wire overflow;
	 wire rotation_event;
	 	
	 Rotary_Shaft_Encoder uut0(clk, ROT_A, ROT_B, rotation_event);
    take_input uut1( Y, rotation_event, clk, sum, overflow);	 
		endmodule
             				
					 
	     


