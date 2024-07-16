`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:05:31 02/12/2024 
// Design Name: 
// Module Name:    Rotary_Shaft_Encoder_Top 
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
`timescale 1ns / 1ps

module Top_Module(clk, ROT_A, ROT_B, led0, led1, led2, led3, led4, led5, led6, led7);
	
  	input clk;
    input ROT_A;
    input ROT_B;
    output led0;
    output led1;
    output led2;
    output led3;
    output led4;
    output led5;
    output led6;
    output led7;
	 
	 wire led0, led1, led2, led3, led4, led5, led6, led7;
  // Instantiate Rotary_Shaft_Encoder module
  wire rotation_event;
  wire rotation_direction;
  Rotary_Shaft_Encoder encoder_inst(
    .clk(clk),
    .ROT_A(ROT_A),
    .ROT_B(ROT_B),
    .rotation_event(rotation_event),
    .rotation_direction(rotation_direction)
  );
  
  // Instantiate Rotary_Shaft_Encoder_2 module
  Rotary_Shaft_Encoder_2 encoder_2_inst(
    .clk(clk),
    .rotation_event(rotation_event),
    .rotation_direction(rotation_direction),
    .led0(led0),
    .led1(led1),
    .led2(led2),
    .led3(led3),
    .led4(led4),
    .led5(led5),
    .led6(led6),
    .led7(led7)
  );

endmodule

