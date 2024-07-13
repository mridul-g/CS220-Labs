`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:12:38 03/11/2024 
// Design Name: 
// Module Name:    detect 
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
module detect_rotation(clk,ROT_A,ROT_B,rotation_event);

    input clk,ROT_A,ROT_B;
    output rotation_event;
    reg rotation_event;
    always@(posedge clk)
    begin
    if(ROT_A==1&&ROT_B==1)
    rotation_event<=1;
    else if(ROT_A==0 & ROT_B==0)
    rotation_event<=0;
    end

endmodule