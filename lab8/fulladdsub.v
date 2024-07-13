`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:43:36 02/26/2024 
// Design Name: 
// Module Name:    fulladdsub 
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
module fulladdsub(a,b,cin,operation,sum,cout);

    input a,b,cin,operation;
    output sum,cout;
    wire sum,cout;
    assign sum=a^(b^operation)^cin;
    assign cout = (a & (b^operation)) | ((b^operation) & cin) | (cin & a);

endmodule