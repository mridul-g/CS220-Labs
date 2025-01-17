`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:20:12 02/05/2024
// Design Name:   ripple
// Module Name:   /home/nipun/Desktop/CS220Labs/Lab3/LAB3_2/RIPPLING_LEDs/ripple_top.v
// Project Name:  RIPPLING_LEDs
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ripple
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ripple_top;

	// Inputs
	reg clk;

	// Outputs
	wire led0;
	wire led1;
	wire led2;
	wire led3;
	wire led4;
	wire led5;
	wire led6;
	wire led7;
	reg[27:0] i;

	// Instantiate the Unit Under Test (UUT)
	ripple uut (
		.clk(clk), 
		.led0(led0), 
		.led1(led1), 
		.led2(led2), 
		.led3(led3), 
		.led4(led4), 
		.led5(led5), 
		.led6(led6), 
		.led7(led7)
	);

	always @(led0, led1, led2, led3, led4, led5, led6, led7) begin
		$display("time=%d: clk=%b, led0=%b, led1=%b, led2=%b, led3=%b, led4=%b, led5=%b, led6=%b, led7=%b", $time, clk, led0, led1, led2, led3, led4, led5, led6, led7);
   end

   initial begin
		 i <= 28'b0;
		 #1
		while(i<100000000)
		begin
			#0.01 clk = 0;
			#0.01 clk = 1;
			i=i+1;
		end
		$finish;
	end
      
endmodule

