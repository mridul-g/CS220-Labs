`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:57:37 03/04/2024
// Design Name: 
// Module Name:    LCD_driver 
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
module LCD_driver(line1,line2,clk,LCD_RS,LCD_W,LCD_E,b3,b2,b1,b0
    );
	 `define TIMER 1000000
	 input [127:0]line1;
	 input [127:0]line2;
	 input clk;
	 output LCD_RS, LCD_W, LCD_E, b3, b2, b1, b0;
	 reg LCD_RS, LCD_W, LCD_E, b3, b2, b1, b0;
	 reg [32:0] counter;
	 reg [30:0] state;
	 reg [10:0] ind1;
	 reg [10:0] ind2;
	 reg [10:0] ind3;
	 reg [10:0] ind4;
	 reg state2;
	 initial begin
		counter=0;
		state=0;
		state2=0;
		ind1=127;
		ind2=126;
		ind3=125;
		ind4=124;
		LCD_RS=0;
		LCD_W=0;
		LCD_E=0;
		b3=0;
		b2=0;
		b1=0;
		b0=0;
	end
	
	 always@(posedge clk)
	 begin
	 if((counter==`TIMER))
	 begin
		 if((state==0 || state==3 || state==6))	begin
				LCD_E<=0;
				state<=state+1;
		 end
		 else if((state==1 || state==4 || state==7))	begin
				LCD_RS<=0;
				LCD_W<=0;
				b3<=0;
				b2<=0;
				b1<=1;
				b0<=1;
				state<=state+1;
		 end
		 else if((state==137 || state==134 || state==131 || state==128 || state==125 || state==122 || state==119 || state==116 || state==113 || state==110 || state==107 || state==104 || state==101 || state==98 || state==95 || state==92 || state==89 || state==86 || state==83 || state==80 || state==77 || state==74 || state==71 || state==68 || state==65 || state==62 || state==59 || state==56 || state==53 || state==50 || state==47 || state==44 || state==41 || state==38 || state==35 || state==32 || state==29 || state==26 || state==23 || state==20 || state==17 || state==14 || state==2 || state==5 || state==8 || state==11))	begin
				LCD_E<=1;
				state<=state+1;
		 end
		 else if((state==135 || state==132 || state==129 || state==126 || state==123 || state==120 || state==117 || state==114 || state==111 || state==108 || state==105 || state==102 || state==99 || state==96 || state==93 || state==90 || state==87 || state==84 || state==81 || state==78 || state==75 || state==72 || state==69 || state==66 || state==63 || state==60 || state==57 || state==54 || state==51 || state==48 || state==45 || state==42 || state==39 || state==36 || state==33 || state==30 || state==27 || state==24 || state==21 || state==18 || state==15 || state==9 || state==12))	begin
				LCD_E<=0;
				state<=state+1;
		 end
		 else if((state==136 || state==133 || state==130 || state==127 || state==124 || state==121 || state==118 || state==115 || state==112 || state==109 || state==106 || state==103 || state==100 || state==97 || state==94 || state==91 || state==88 || state==85 || state==82 || state==79 || state==76 || state==73 || state==70 || state==67 || state==64 || state==61 || state==58 || state==55 || state==52 || state==49 || state==46 || state==43))	begin
				LCD_RS<=1;
				LCD_W<=0;
				if(state2==0)
				begin
				b3<=line1[ind1];
				b2<=line1[ind2];
				b1<=line1[ind3];
				b0<=line1[ind4];
				end
				if(state2==1)
				begin
				b3<=line2[ind1];
				b2<=line2[ind2];
				b1<=line2[ind3];
				b0<=line2[ind4];
				end
				ind1<=ind1-4;
				ind2<=ind2-4;
				ind3<=ind3-4;
				ind4<=ind4-4;
				state<=state+1;
		 end
		 else if((state==10 || state==13))	begin
				LCD_RS<=0;
				LCD_W<=0;
				b3<=0;
				b2<=0;
				b1<=1;
				b0<=0;
				state<=state+1;
		 end
		 else if((state==16 || state==37))	begin
				LCD_RS<=0;
				LCD_W<=0;
				b3<=1;
				b2<=0;
				b1<=0;
				b0<=0;
				state<=state+1;
		 end
		 else if((state==142 || state==40 || state==31 || state==19 || state==25))	begin
				LCD_RS<=0;
				LCD_W<=0;
				b3<=0;
				b2<=0;
				b1<=0;
				b0<=0;
				state<=state+1;
		 end
		 else if((state==22))	begin
				LCD_RS<=0;
				LCD_W<=0;
				b3<=0;
				b2<=1;
				b1<=1;
				b0<=0;
				state<=state+1;
		 end
		 else if((state==139 || state==28))	begin
				LCD_RS<=0;
				LCD_W<=0;
				b3<=1;
				b2<=1;
				b1<=0;
				b0<=0;
				state<=state+1;
		 end
		 else if((state==34))	begin
				LCD_RS<=0;
				LCD_W<=0;
				b3<=0;
				b2<=0;
				b1<=0;
				b0<=1;
				state<=state+1;
		 end
		 else if((state==143))	begin
			LCD_E<=1;
			
			state2<=1;
			
			ind1<=127;
			ind2<=126;
			ind3<=125;
			ind4<=124;
			state<=42;
		 end
		 else if((state==138 || state==141))	begin
				LCD_E<=0;
				if(state2==1)	begin
				counter<=0;
		state<=0;
		state2<=0;
		ind1<=127;
		ind2<=126;
		ind3<=125;
		ind4<=124;
		LCD_RS<=0;
		LCD_W<=0;
		LCD_E<=0;
		b3<=0;
		b2<=0;
		b1<=0;
		b0<=0;
				end
				else	begin
				state<=state+1;
				end
		 end
		 else if((state==140))	begin
				LCD_E<=1;
				state<=state+1;
		 end
		 
			counter<=0;
	 end
	 else 
			counter<=counter+1;
	 end
	 
endmodule