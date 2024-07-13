`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:54 02/26/2024 
// Design Name: 
// Module Name:    rotation_check 
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
module rotation_check( clk, ROT_A, ROT_B, rotation_event);
	 
	 input clk, ROT_A, ROT_B;
	 
	 output rotation_event;
	 reg rotation_event;
	 
	 always@(posedge clk) begin
		if(ROT_A && ROT_B) begin
				rotation_event <= 1;
		end
		if(!ROT_A && !ROT_B) begin
				rotation_event <= 0;
		end
	 end
endmodule
