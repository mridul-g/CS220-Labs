`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:26:10 02/05/2024
// Design Name:   blink
// Module Name:   /home/nipun/Desktop/CS220Labs/Lab3/LAB3_1/blinking_LED/blinkled_top.v
// Project Name:  blinking_LED
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: blink
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module blinkled_top;

	// Inputs
	reg clk;
	reg[26:0] i;
	wire led0;
	blink uut(
		.clk(clk),
		.led0(led0)
	);

	always @(led0, clk) begin
		$display("time=%d: clk=%b, led0=%b", $time, clk, led0);
	end

	initial begin
		i = 27'b0;
		while(i<100000000) begin
			#0.01 clk <= 0;
			#0.01 clk <= 1;
			i= i+1;
		end
		#1
		$finish;
	end
      
endmodule