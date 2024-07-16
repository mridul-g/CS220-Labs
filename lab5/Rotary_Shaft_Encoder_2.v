`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:32:14 02/12/2024 
// Design Name: 
// Module Name:    Rotary_Shaft_Encoder_2 
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
module Rotary_Shaft_Encoder_2(clk,rotation_event,rotation_direction,led0,led1,led2,led3,led4,led5,led6,led7
    );
	 input rotation_event,rotation_direction;
	 input clk;
	 reg prev_rotation_event;
	 
	 output reg led0,led1,led2,led3,led4,led5,led6,led7;
	 initial begin
		prev_rotation_event<=1;
		led0<=1;
		 led1<=0;
		 led2<=0;
		 led3<=0;
		 led5<=0;
		 led6<=0;
		 led7<=0;
	 end
	 
	 always @(posedge clk) begin
		prev_rotation_event<=rotation_event;
		if(!prev_rotation_event && rotation_event) begin
			if(!rotation_direction) begin
				led0<=led1;
				led1<=led2;
				led2<=led3;
				led3<=led4;
				led4<=led5;
				led5<=led6;
				led6<=led7;
				led7<=led0;
			end
			if (rotation_direction) begin
				led1<=led0;
				led2<=led1;
				led3<=led2;
				led4<=led3;
				led5<=led4;
				led6<=led5;
				led7<=led6;
				led0<=led7;
			end
		end
	end
		
		
	 


endmodule
