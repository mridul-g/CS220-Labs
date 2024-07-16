`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:38:20 02/05/2024 
// Design Name: 
// Module Name:    LCD_driver_top 
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
module LCD_driver_top(clk, LCD_RS, LCD_W, LCD_E, data);
	input clk;
	output LCD_RS, LCD_W, LCD_E;
	wire LCD_RS, LCD_W, LCD_E;
	output [3:0] data;
	wire [3:0] data;

	LCD_driver lcd("WELCOME TO CSE, ","IIT KANPUR      ", clk, LCD_E, LCD_RS, LCD_W, data);

endmodule
