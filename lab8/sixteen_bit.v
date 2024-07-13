`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:13:40 03/11/2024 
// Design Name: 
// Module Name:    sixteen_bit 
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
module sixteen_bit_addsum(A,B,operation,R
    );
        input [15:0]A;
        input [15:0]B;
        input operation;
        output R;
        wire [15:0]R;
        wire [15:0]C;
        fulladdsub F00(A[0],B[0],operation,operation,R[0],C[0]);
        fulladdsub F01(A[1],B[1],C[0],operation,R[1],C[1]);
        fulladdsub F02(A[2],B[2],C[1],operation,R[2],C[2]);
        fulladdsub F03(A[3],B[3],C[2],operation,R[3],C[3]);
        fulladdsub F04(A[4],B[4],C[3],operation,R[4],C[4]);
        fulladdsub F05(A[5],B[5],C[4],operation,R[5],C[5]);
        fulladdsub F06(A[6],B[6],C[5],operation,R[6],C[6]);
        fulladdsub F07(A[7],B[7],C[6],operation,R[7],C[7]);
        fulladdsub F08(A[8],B[8],C[7],operation,R[8],C[8]);
        fulladdsub F09(A[9],B[9],C[8],operation,R[9],C[9]);
        fulladdsub F10(A[10],B[10],C[9],operation,R[10],C[10]);
        fulladdsub F11(A[11],B[11],C[10],operation,R[11],C[11]);
        fulladdsub F12(A[12],B[12],C[11],operation,R[12],C[12]);
        fulladdsub F13(A[13],B[13],C[12],operation,R[13],C[13]);
        fulladdsub F14(A[14],B[14],C[13],operation,R[14],C[14]);
        fulladdsub F15(A[15],B[15],C[14],operation,R[15],C[15]);
endmodule 