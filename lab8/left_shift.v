`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:24 03/11/2024 
// Design Name: 
// Module Name:    left_shift 
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
module left_shift(clk,A,shift,B
    );
        input clk; 
        input [15:0]A;
        input [3:0]shift;
        output [15:0]B;
        reg [15:0]B;
        initial begin
            B<=0;
        end
        always@(posedge clk) begin
                if(shift==0) begin
                        B<=A;
                end
                else if(shift==1) begin
                        B[15:1]<=A[14:0];
                        B[0]<=0;
                end
                else if(shift==2) begin
                        B[15:2]<=A[13:0];
                        B[1:0]<=0;
                end
                else if(shift==3) begin
                        B[15:3]<=A[12:0];
                        B[2:0]<=0;
                end
                else if(shift==4) begin
                        B[15:4]<=A[11:0];
                        B[3:0]<=0;
                end
                else if(shift==5) begin
                        B[15:5]<=A[10:0];
                        B[4:0]<=0;
                end
                else if(shift==6) begin
                        B[15:6]<=A[9:0];
                        B[5:0]<=0;
                end
                else if(shift==7) begin
                        B[15:7]<=A[8:0];
                        B[6:0]<=0;
                end
                else if(shift==8) begin
                        B[15:8]<=A[7:0];
                        B[7:0]<=0;
                end
                else if(shift==9) begin
                        B[15:9]<=A[6:0];
                        B[8:0]<=0;
                end
                else if(shift==10) begin
                        B[15:10]<=A[5:0];
                        B[9:0]<=0;
                end
                else if(shift==11) begin
                        B[15:11]<=A[4:0];
                        B[10:0]<=0;
                end
                else if(shift==12) begin
                        B[15:12]<=A[3:0];
                        B[11:0]<=0;
                end
                else if(shift==13) begin
                        B[15:13]<=A[2:0];
                        B[12:0]<=0;
                end
                else if(shift==14) begin
                        B[15:14]<=A[1:0];
                        B[13:0]<=0;
                end
                else if(shift==15) begin
                        B[15]<=A[0];
                        B[14:0]<=0;
                end
        end
endmodule