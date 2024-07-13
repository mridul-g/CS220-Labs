`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:28:56 02/26/2024 
// Design Name: 
// Module Name:    input 
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


module take_input( Y, rotation_event, clk, sum, overflow
);
    input [3:0]Y;
	 input rotation_event;
	 input clk;
	 output overflow;
	 wire overflow;
	 output sum;
	 wire [6:0] sum;
    reg prev_event;
    reg [6:0] A;
    reg [6:0] B;
    wire [6:0] carry;
    reg operation;
    reg [2:0] count;

    initial begin
        count <= 3'b0;
        prev_event <= 1'b1;
        A <= 7'b0;
        B <= 7'b0;
    end

    always @(posedge clk) begin
        prev_event <= rotation_event;
        if ((prev_event == 0) && (rotation_event == 1)) begin
            case (count)
                3'b000: A[3:0] <= Y[3:0];
                3'b001: A[6:4] <= Y[2:0];
                3'b010: B[3:0] <= Y[3:0];
                3'b011: B[6:4] <= Y[2:0];
                3'b100: operation <= Y[0];
            endcase
            count <= count + 1;
            if (count == 3'b101) begin
                count <= 3'b0;
					 A<=7'b0;
					 B<=7'b0;
            end
        end
    end

    full_adder FA0(A[0], B[0] ^ operation, operation, sum[0], carry[0]);
    full_adder FA1(A[1], B[1] ^ operation, carry[0], sum[1], carry[1]);
    full_adder FA2(A[2], B[2] ^ operation, carry[1], sum[2], carry[2]);
    full_adder FA3(A[3], B[3] ^ operation, carry[2], sum[3], carry[3]);
    full_adder FA4(A[4], B[4] ^ operation, carry[3], sum[4], carry[4]);
    full_adder FA5(A[5], B[5] ^ operation, carry[4], sum[5], carry[5]);
    full_adder FA6(A[6], B[6] ^ operation, carry[5], sum[6], carry[6]);

    assign overflow = carry[5] ^ carry[6];

endmodule
