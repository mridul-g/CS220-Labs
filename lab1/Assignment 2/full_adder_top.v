// Verilog test fixture created from schematic /media/cse/Crucial X8/CS220Labs/Lab1_2/full_adder_schematic/full_adder_sch.sch - Mon Jan 15 16:37:26 2024

`timescale 1ns / 1ps

module full_adder_sch_full_adder_sch_sch_tb();

// Inputs
   reg cin;
   reg a;
   reg b;

// Output
   wire cout;
   wire sum;

// Bidirs

// Instantiate the UUT
   full_adder_sch UUT (
		.cin(cin), 
		.a(a), 
		.b(b), 
		.cout(cout), 
		.sum(sum)
   );
// Initialize Inputs
    always @(sum or cout) begin
			$display("time=%d: %b + %b + %b = %b, cout = %b\n", $time, a, b, cin,
			sum, cout);
		end
		initial begin
			a = 0; b = 0; cin = 0;
			#5
			a = 0; b = 1; cin = 0;
			#5
			a = 1; b = 0; cin = 1;
			#5
			a = 1; b = 1; cin = 1;
			#5
			$finish;
		end
endmodule
