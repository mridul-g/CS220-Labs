`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:25:49 02/26/2024 
// Design Name: 
// Module Name:    Grid_Walk 
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
module Grid_Walk(clk, Y, ROT_A, ROT_B, final_x, final_y);
	input clk, ROT_A, ROT_B;
	input[3:0] Y;
	output[3:0] final_x;
	output[3:0] final_y;
	reg [3:0] final_x;
	reg [3:0] final_y;
	reg [3:0] x;
	reg [3:0] y;
	reg prev_rot_event;
	wire [4:0] out_x;
	wire [4:0] out_y;
	
	reg [1:0] dis_x;
	reg [1:0] dis_y;
	reg dir_x, dir_y;
	reg rotation_event;
	
	initial begin
		prev_rot_event <= 1'b0;
		dir_x <= 1'b0;
		dis_x <= 2'b00;
		dis_y <= 2'b00;
		dir_y <= 1'b0;
		final_x <= 4'b0000;
		final_y <= 4'b0000;
	end
	 
	 always@(posedge clk) begin
		if(ROT_A && ROT_B) begin
				rotation_event <= 1;
		end
		if(!ROT_A && !ROT_B) begin
				rotation_event <= 0;
		end
	 end
	
	always @(posedge clk)
	begin
		// if(prev_rot_event == 0 && rotation_event == 1)
		if(prev_rot_event != rotation_event)
		begin
			// setting direction and step length to x and y vars
			x <= final_x;
			y <= final_y;
			if(Y[3] == 0) begin		// move in x
				dis_x <= Y[1:0];
				dis_y <= 2'b00;
				if(Y[2] == 0) dir_x <= 0;	// +ve x
				if(Y[2] == 1) dir_x <= 1;
				
				if(out_x[4] == 1 && dir_x == 0)
					final_x <= 4'b1111;
				
				if(out_x[4] == 1 && dir_x == 1)
					final_x <= 4'b0000;
					
				if(out_x[4] == 0)
					final_x <= out_x[3:0];
			end
			
			if(Y[3] == 1) begin		// move in y
				dis_y <= Y[1:0];
				dis_x <= 2'b00;
				if(Y[2] == 0) dir_y <= 0;	// +ve y
				if(Y[2] == 1) dir_y <= 1;
				
				if(out_y[4] == 1 && dir_y == 0)
					final_y <= 4'b1111;
				
				if(out_y[4] == 1 && dir_y == 1)
					final_y <= 4'b0000;
					
				if(out_y[4] == 0)
					final_y <= out_y[3:0];
			end
			
			
		end
		
		prev_rot_event <= rotation_event;
	end
	
	five_bit_add_subtract uut0(x, dis_x, out_x, carry_x, dir_x);
	five_bit_add_subtract uut1(y, dis_y, out_y, carry_y, dir_y);

endmodule
