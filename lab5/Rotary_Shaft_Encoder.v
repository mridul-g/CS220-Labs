`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:17 02/12/2024 
// Design Name: 
// Module Name:    Rotary_Shaft_Encoder 
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
module Rotary_Shaft_Encoder(clk,ROT_A,ROT_B,rotation_event,rotation_direction
    );
	 input ROT_A, ROT_B, clk;
	 output reg rotation_event,rotation_direction;
	 always @(posedge clk) begin
			 if (ROT_A && ROT_B) begin
				  rotation_event <= 1;
			 end 
			 if (!ROT_A && !ROT_B) begin
				  rotation_event <= 0;
			 end
			 
			 if (!ROT_A && ROT_B) begin
				  rotation_direction <= 1;
			 end
			 if (ROT_A && !ROT_B) begin
				  rotation_direction <= 0;
			 end
	end

		


endmodule
