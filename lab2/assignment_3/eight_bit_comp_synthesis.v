////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: eight_bit_comp_synthesis.v
// /___/   /\     Timestamp: Mon Jan 29 14:33:06 2024
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim eight_bit_comp.ngc eight_bit_comp_synthesis.v 
// Device	: xc3s500e-4-fg320
// Input file	: eight_bit_comp.ngc
// Output file	: /media/cse/Mridul/CS220Labs/Lab2_2/eight_bit_comparator/netgen/synthesis/eight_bit_comp_synthesis.v
// # of Modules	: 1
// Design Name	: eight_bit_comp
// Xilinx        : /opt/Xilinx/14.7/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module eight_bit_comp (
  PB1, PB2, PB3, PB4, e, g, l, Y
);
  input PB1;
  input PB2;
  input PB3;
  input PB4;
  output e;
  output g;
  output l;
  input [3 : 0] Y;
  wire \C7/g138_16 ;
  wire \C7/g40_17 ;
  wire \C7/g75_18 ;
  wire \C7/l138_19 ;
  wire \C7/l40_20 ;
  wire \C7/l75_21 ;
  wire N11;
  wire N13;
  wire N15;
  wire N17;
  wire N19;
  wire N21;
  wire N23;
  wire N25;
  wire N7;
  wire PB1_BUFGP_32;
  wire PB2_BUFGP_34;
  wire PB3_BUFGP_36;
  wire PB4_BUFGP_38;
  wire Y_0_IBUF_43;
  wire Y_1_IBUF_44;
  wire Y_2_IBUF_45;
  wire Y_3_IBUF_46;
  wire e4;
  wire e_OBUF_49;
  wire g_OBUF_51;
  wire l_OBUF_53;
  wire [7 : 0] A;
  wire [7 : 0] B;
  FD   A_3 (
    .C(PB1_BUFGP_32),
    .D(Y_3_IBUF_46),
    .Q(A[3])
  );
  FD   A_0 (
    .C(PB1_BUFGP_32),
    .D(Y_0_IBUF_43),
    .Q(A[0])
  );
  FD   A_2 (
    .C(PB1_BUFGP_32),
    .D(Y_2_IBUF_45),
    .Q(A[2])
  );
  FD   A_1 (
    .C(PB1_BUFGP_32),
    .D(Y_1_IBUF_44),
    .Q(A[1])
  );
  FD   A_5 (
    .C(PB2_BUFGP_34),
    .D(Y_1_IBUF_44),
    .Q(A[5])
  );
  FD   A_7 (
    .C(PB2_BUFGP_34),
    .D(Y_3_IBUF_46),
    .Q(A[7])
  );
  FD   A_6 (
    .C(PB2_BUFGP_34),
    .D(Y_2_IBUF_45),
    .Q(A[6])
  );
  FD   B_2 (
    .C(PB3_BUFGP_36),
    .D(Y_2_IBUF_45),
    .Q(B[2])
  );
  FD   A_4 (
    .C(PB2_BUFGP_34),
    .D(Y_0_IBUF_43),
    .Q(A[4])
  );
  FD   B_3 (
    .C(PB3_BUFGP_36),
    .D(Y_3_IBUF_46),
    .Q(B[3])
  );
  FD   B_7 (
    .C(PB4_BUFGP_38),
    .D(Y_3_IBUF_46),
    .Q(B[7])
  );
  FD   B_1 (
    .C(PB3_BUFGP_36),
    .D(Y_1_IBUF_44),
    .Q(B[1])
  );
  FD   B_0 (
    .C(PB3_BUFGP_36),
    .D(Y_0_IBUF_43),
    .Q(B[0])
  );
  FD   B_4 (
    .C(PB4_BUFGP_38),
    .D(Y_0_IBUF_43),
    .Q(B[4])
  );
  FD   B_6 (
    .C(PB4_BUFGP_38),
    .D(Y_2_IBUF_45),
    .Q(B[6])
  );
  FD   B_5 (
    .C(PB4_BUFGP_38),
    .D(Y_1_IBUF_44),
    .Q(B[5])
  );
  LUT4 #(
    .INIT ( 16'h6FF6 ))
  \C7/e_SW0  (
    .I0(B[0]),
    .I1(A[0]),
    .I2(B[2]),
    .I3(A[2]),
    .O(N7)
  );
  LUT4 #(
    .INIT ( 16'h0082 ))
  \C7/e  (
    .I0(e4),
    .I1(B[1]),
    .I2(A[1]),
    .I3(N7),
    .O(e_OBUF_49)
  );
  LUT4 #(
    .INIT ( 16'h6FF6 ))
  \C2/e_SW0  (
    .I0(B[5]),
    .I1(A[5]),
    .I2(B[7]),
    .I3(A[7]),
    .O(N11)
  );
  LUT4 #(
    .INIT ( 16'hFEEE ))
  \C7/l168  (
    .I0(\C7/l40_20 ),
    .I1(\C7/l75_21 ),
    .I2(e4),
    .I3(\C7/l138_19 ),
    .O(l_OBUF_53)
  );
  LUT4 #(
    .INIT ( 16'hFEEE ))
  \C7/g168  (
    .I0(\C7/g40_17 ),
    .I1(\C7/g75_18 ),
    .I2(e4),
    .I3(\C7/g138_16 ),
    .O(g_OBUF_51)
  );
  IBUF   Y_3_IBUF (
    .I(Y[3]),
    .O(Y_3_IBUF_46)
  );
  IBUF   Y_2_IBUF (
    .I(Y[2]),
    .O(Y_2_IBUF_45)
  );
  IBUF   Y_1_IBUF (
    .I(Y[1]),
    .O(Y_1_IBUF_44)
  );
  IBUF   Y_0_IBUF (
    .I(Y[0]),
    .O(Y_0_IBUF_43)
  );
  OBUF   e_OBUF (
    .I(e_OBUF_49),
    .O(e)
  );
  OBUF   g_OBUF (
    .I(g_OBUF_51),
    .O(g)
  );
  OBUF   l_OBUF (
    .I(l_OBUF_53),
    .O(l)
  );
  LUT4 #(
    .INIT ( 16'h20BA ))
  \C7/l40_SW0  (
    .I0(B[6]),
    .I1(A[5]),
    .I2(B[5]),
    .I3(A[6]),
    .O(N13)
  );
  LUT3 #(
    .INIT ( 8'h8E ))
  \C7/l40  (
    .I0(N13),
    .I1(B[7]),
    .I2(A[7]),
    .O(\C7/l40_20 )
  );
  LUT4 #(
    .INIT ( 16'h20BA ))
  \C7/l138_SW0  (
    .I0(B[1]),
    .I1(A[0]),
    .I2(B[0]),
    .I3(A[1]),
    .O(N15)
  );
  LUT3 #(
    .INIT ( 8'h8E ))
  \C7/l138  (
    .I0(N15),
    .I1(B[2]),
    .I2(A[2]),
    .O(\C7/l138_19 )
  );
  LUT4 #(
    .INIT ( 16'hD4F5 ))
  \C7/g40_SW0  (
    .I0(A[6]),
    .I1(B[5]),
    .I2(B[6]),
    .I3(A[5]),
    .O(N17)
  );
  LUT3 #(
    .INIT ( 8'h2B ))
  \C7/g40  (
    .I0(A[7]),
    .I1(B[7]),
    .I2(N17),
    .O(\C7/g40_17 )
  );
  LUT4 #(
    .INIT ( 16'hD4F5 ))
  \C7/g138_SW0  (
    .I0(A[1]),
    .I1(B[0]),
    .I2(B[1]),
    .I3(A[0]),
    .O(N19)
  );
  LUT3 #(
    .INIT ( 8'h2B ))
  \C7/g138  (
    .I0(A[2]),
    .I1(B[2]),
    .I2(N19),
    .O(\C7/g138_16 )
  );
  LUT4 #(
    .INIT ( 16'h6FF6 ))
  \C4/e_SW1  (
    .I0(A[6]),
    .I1(B[6]),
    .I2(A[4]),
    .I3(B[4]),
    .O(N21)
  );
  LUT4 #(
    .INIT ( 16'h0009 ))
  \C4/e  (
    .I0(A[3]),
    .I1(B[3]),
    .I2(N11),
    .I3(N21),
    .O(e4)
  );
  LUT4 #(
    .INIT ( 16'hD4F5 ))
  \C7/l75_SW0  (
    .I0(B[4]),
    .I1(A[3]),
    .I2(A[4]),
    .I3(B[3]),
    .O(N23)
  );
  LUT4 #(
    .INIT ( 16'h0009 ))
  \C7/l75  (
    .I0(A[6]),
    .I1(B[6]),
    .I2(N11),
    .I3(N23),
    .O(\C7/l75_21 )
  );
  LUT4 #(
    .INIT ( 16'hD4F5 ))
  \C7/g75_SW0  (
    .I0(A[4]),
    .I1(B[3]),
    .I2(B[4]),
    .I3(A[3]),
    .O(N25)
  );
  LUT4 #(
    .INIT ( 16'h0009 ))
  \C7/g75  (
    .I0(A[6]),
    .I1(B[6]),
    .I2(N11),
    .I3(N25),
    .O(\C7/g75_18 )
  );
  BUFGP   PB1_BUFGP (
    .I(PB1),
    .O(PB1_BUFGP_32)
  );
  BUFGP   PB2_BUFGP (
    .I(PB2),
    .O(PB2_BUFGP_34)
  );
  BUFGP   PB3_BUFGP (
    .I(PB3),
    .O(PB3_BUFGP_36)
  );
  BUFGP   PB4_BUFGP (
    .I(PB4),
    .O(PB4_BUFGP_38)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

