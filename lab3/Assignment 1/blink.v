`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:44:11 02/04/2024 
// Design Name: 
// Module Name:    blink 
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
module blink(clk, led0
    );
	 
	 input clk;
	 output led0;
	 reg led0;
	 `define OFF_TIME 2500
    `define ON_TIME (`OFF_TIME*2)
	 reg[27:0] counter;
	 initial begin
	    counter <= 0;
	    led0 <= 0;
	 end
	 
	 always @(posedge clk) begin   
	       counter<=counter + 1;
			 if(counter== `OFF_TIME) 
			 led0 <= 0;
			 else if(counter== `ON_TIME) begin
			 led0 <=1;
			 counter<=0;
			 end
			end
			
endmodule		
			 
			 
			 
			 
	 
