`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:16:08 03/11/2024 
// Design Name: 
// Module Name:    register_top 
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
module register_top(clk, ROT_A, ROT_B, bits, LCD_RS, LCD_W, LCD_E, b3, b2, b1, b0, reset, mini);
        input [3:0]bits;
        input clk,ROT_A,ROT_B,reset;
        output LCD_RS, LCD_W, LCD_E, b3, b2, b1, b0;
		  output [3:0] mini;
		  wire LCD_RS, LCD_W, LCD_E, b3, b2, b1, b0;
        wire rotation_event;
        wire [127:0]line1;
        wire [127:0]line2;
		  wire [3:0] mini;
        // detector D0(clk,rot_a,rot_b,rot);
        detect_rotation uut0(clk,ROT_A,ROT_B,rotation_event);
		  interface uut1(clk,rotation_event,bits,reset,line1,line2,mini);
        // lcd_driver L0(line1,line2,clk,lcd_rs,lcd_w,lcd_e,databits);
        LCD_driver uut2(line1,line2,clk,LCD_RS,LCD_W,LCD_E,b3,b2,b1,b0);
endmodule