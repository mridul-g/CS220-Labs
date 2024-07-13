`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:14:51 03/11/2024 
// Design Name: 
// Module Name:    interface 
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
module interface(clk,rotation_event,bits,reset,line1,line2,substate);
    input clk, rotation_event, reset;
    input [3:0] bits;
    output line1, line2;
	 output [3:0] substate;
    reg [127:0] line1, line2;
	 reg[3:0] substate;
    reg [15:0] register[31:0];
    reg[4:0] read_a1, read_a2, write_a;
    reg[15:0] read_d1, read_d2, write_d;
    reg prev_rotation_event;
    reg [10:0] state,flag;
    reg operation;
    reg [3:0] shift;
    wire [15:0]add_res;
    wire [15:0]shift_res;
    initial begin
        prev_rotation_event=1;
        operation=0;
        state=0;
		  substate=0;
        flag=0;
        read_a1=0;
        read_a2=0;
        write_a=0;
        read_d1=0;
        read_d2=0;
        write_d=0;
        shift=0;
        line1=128'h30303030303030303030303030303030;
        line2=128'h30303030303030303030303030303030;
        register[0]=0;  register[1]=0;  register[2]=0;
        register[3]=0;  register[4]=0;  register[5]=0;
        register[6]=0;  register[7]=0;  register[8]=0;
        register[9]=0;  register[10]=0; register[11]=0;
        register[12]=0; register[13]=0; register[14]=0;
        register[15]=0; register[16]=0; register[17]=0;
        register[18]=0; register[19]=0; register[20]=0;
        register[21]=0; register[22]=0; register[23]=0;
        register[24]=0; register[25]=0; register[26]=0;
        register[27]=0; register[28]=0; register[29]=0;
        register[30]=0; register[31]=0;
    end
    
    always@(posedge clk)
    begin
		if(reset==1)	begin
			state<=0;
			flag<=0;
			substate<=0;
		end
		if(substate==1)	begin
			register[write_a]<=write_d;
			line1[127:40]<=88'h3030303030303030303030;
			line1[32]<=write_a[4];
			line1[24]<=write_a[3];
			line1[16]<=write_a[2];
			line1[8]<=write_a[1];
			line1[0]<=write_a[0];
			
			line2[120]<=write_d[15];
			line2[112]<=write_d[14];
			line2[104]<=write_d[13];
			line2[96]<=write_d[12];
			line2[88]<=write_d[11];
			line2[80]<=write_d[10];
			line2[72]<=write_d[9];
			line2[64]<=write_d[8];
			line2[56]<=write_d[7];
			line2[48]<=write_d[6];
			line2[40]<=write_d[5];
			line2[32]<=write_d[4];
			line2[24]<=write_d[3];
			line2[16]<=write_d[2];
			line2[8]<=write_d[1];
			line2[0]<=write_d[0];
			substate<=0;
		end
		else if(substate==2)	begin
			read_d1<=register[read_a1];
			substate<=3;
		end
		else if(substate==3)	begin
			line1[127:40]<=88'h3030303030303030303030;
			line1[32]<=read_a1[4];
			line1[24]<=read_a1[3];
			line1[16]<=read_a1[2];
			line1[8]<=read_a1[1];
			line1[0]<=read_a1[0];
			
			line2[120]<=read_d1[15];
			line2[112]<=read_d1[14];
			line2[104]<=read_d1[13];
			line2[96]<=read_d1[12];
			line2[88]<=read_d1[11];
			line2[80]<=read_d1[10];
			line2[72]<=read_d1[9];
			line2[64]<=read_d1[8];
			line2[56]<=read_d1[7];
			line2[48]<=read_d1[6];
			line2[40]<=read_d1[5];
			line2[32]<=read_d1[4];
			line2[24]<=read_d1[3];
			line2[16]<=read_d1[2];
			line2[8]<=read_d1[1];
			line2[0]<=read_d1[0];
			substate<=0;
		end
		else if(substate==4)	begin
			read_d1<=register[read_a1];
			read_d2<=register[read_a2];
			register[write_a]<=write_d;
			substate<=5;
		end
		else if(substate==5)	begin
			line1[120]<=read_d1[15];
			line1[112]<=read_d1[14];
			line1[104]<=read_d1[13];
			line1[96]<=read_d1[12];
			line1[88]<=read_d1[11];
			line1[80]<=read_d1[10];
			line1[72]<=read_d1[9];
			line1[64]<=read_d1[8];
			line1[56]<=read_d1[7];
			line1[48]<=read_d1[6];
			line1[40]<=read_d1[5];
			line1[32]<=read_d1[4];
			line1[24]<=read_d1[3];
			line1[16]<=read_d1[2];
			line1[8]<=read_d1[1];
			line1[0]<=read_d1[0];
			
			line2[120]<=read_d2[15];
			line2[112]<=read_d2[14];
			line2[104]<=read_d2[13];
			line2[96]<=read_d2[12];
			line2[88]<=read_d2[11];
			line2[80]<=read_d2[10];
			line2[72]<=read_d2[9];
			line2[64]<=read_d2[8];
			line2[56]<=read_d2[7];
			line2[48]<=read_d2[6];
			line2[40]<=read_d2[5];
			line2[32]<=read_d2[4];
			line2[24]<=read_d2[3];
			line2[16]<=read_d2[2];
			line2[8]<=read_d2[1];
			line2[0]<=read_d2[0];
			substate<=0;
		end
		
		else if(substate==6)	begin
			read_d1<=register[read_a1];
			read_d2<=register[read_a2];
			operation<=0;
			substate<=7;
		end
		else if(substate==7)	begin
			register[write_a]<=add_res;
			line1[127:40]<=88'h3030303030303030303030;
			line1[32]<=write_a[4];
			line1[24]<=write_a[3];
			line1[16]<=write_a[2];
			line1[8]<=write_a[1];
			line1[0]<=write_a[0];
			
			line2[120]<=add_res[15];
			line2[112]<=add_res[14];
			line2[104]<=add_res[13];
			line2[96]<=add_res[12];
			line2[88]<=add_res[11];
			line2[80]<=add_res[10];
			line2[72]<=add_res[9];
			line2[64]<=add_res[8];
			line2[56]<=add_res[7];
			line2[48]<=add_res[6];
			line2[40]<=add_res[5];
			line2[32]<=add_res[4];
			line2[24]<=add_res[3];
			line2[16]<=add_res[2];
			line2[8]<=add_res[1];
			line2[0]<=add_res[0];
			substate<=0;
		end
		
		else if(substate==8)	begin
			read_d1<=register[read_a1];
			read_d2<=register[read_a2];
			operation<=1;
			substate<=7;
		end
		else if(substate==9)	begin
			read_d1<=register[read_a1];
			substate<=10;
		end
		else if(substate==10)	begin
			register[write_a]<=shift_res;
			line1[127:40]<=88'h3030303030303030303030;
			line1[32]<=write_a[4];
			line1[24]<=write_a[3];
			line1[16]<=write_a[2];
			line1[8]<=write_a[1];
			line1[0]<=write_a[0];
			
			line2[120]<=shift_res[15];
			line2[112]<=shift_res[14];
			line2[104]<=shift_res[13];
			line2[96]<=shift_res[12];
			line2[88]<=shift_res[11];
			line2[80]<=shift_res[10];
			line2[72]<=shift_res[9];
			line2[64]<=shift_res[8];
			line2[56]<=shift_res[7];
			line2[48]<=shift_res[6];
			line2[40]<=shift_res[5];
			line2[32]<=shift_res[4];
			line2[24]<=shift_res[3];
			line2[16]<=shift_res[2];
			line2[8]<=shift_res[1];
			line2[0]<=shift_res[0];
			substate<=0;
		end
		else if(substate==11)	begin
			read_d1<=register[read_a1];
			register[write_a]<=write_d;
			substate<=3;
		end
      if(prev_rotation_event==0 && rotation_event==1) begin
			if(state==0)	begin
				if(bits[2:0]==3'b000)	begin
					state<=1;
				end
				if(bits[2:0]==3'b001)	begin
					state<=2;
				end
				if(bits[2:0]==3'b010)	begin
					state<=3;
				end
				if(bits[2:0]==3'b011)	begin
					state<=4;
				end
				if(bits[2:0]==3'b100)	begin
					state<=5;
				end
				if(bits[2:0]==3'b101)	begin
					state<=6;
				end
				if(bits[2:0]==3'b110)	begin
					state<=7;
				end
				if(bits[2:0]==3'b111)	begin
					state<=8;
				end
			end
			
			else if(state==1)	begin
				if(flag==0)	begin
					write_a[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==1)	begin
					write_a[4]<=bits[0];
					flag<=flag+1;
				end
				else if(flag==2)	begin
					write_d[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==3)	begin
					write_d[7:4]<=bits;
					flag<=flag+1;
				end
				else if(flag==4)	begin
					write_d[11:8]<=bits;
					flag<=flag+1;
				end
				else if(flag==5)	begin
					write_d[15:12]<=bits;
					flag<=0;
					state<=0;
					substate<=1;
				end
			end
			
			else if(state==2)	begin
				if(flag==0)	begin
					read_a1[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==1)	begin
					read_a1[4]<=bits[0];
					flag<=0;
					state<=0;
					substate<=2;
				end
			end
			
			else if(state==3)	begin
				if(flag==0)	begin
					read_a1[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==1)	begin
					read_a1[4]<=bits[0];
					flag<=flag+1;
				end
				else if(flag==2)	begin
					read_a2[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==3)	begin
					read_a2[4]<=bits[0];
					flag<=0;
					state<=0;
					substate<=4;
				end
			end
			else if(state==4)	begin
				if(flag==0)	begin
					read_a1[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==1)	begin
					read_a1[4]<=bits[0];
					flag<=flag+1;
				end
				else if(flag==2)	begin
					write_a[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==3)	begin
					write_a[4]<=bits[0];
					flag<=flag+1;
				end
				else if(flag==4)	begin
					write_d[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==5)	begin
					write_d[7:4]<=bits;
					flag<=flag+1;
				end
				else if(flag==6)	begin
					write_d[11:8]<=bits;
					flag<=flag+1;
				end
				else if(flag==7)	begin
					write_d[15:12]<=bits;
					flag<=0;
					state<=0;
					substate<=11;
				end
			end
			else if(state==5)	begin
				if(flag==0)	begin
					read_a1[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==1)	begin
					read_a1[4]<=bits[0];
					flag<=flag+1;
				end
				else if(flag==2)	begin
					read_a2[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==3)	begin
					read_a2[4]<=bits[0];
					flag<=flag+1;
				end
				else if(flag==4)	begin
					write_a[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==5)	begin
					write_a[4]<=bits[0];
					flag<=flag+1;
				end
				else if(flag==6)	begin
					write_d[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==7)	begin
					write_d[7:4]<=bits;
					flag<=flag+1;
				end
				else if(flag==8)	begin
					write_d[11:8]<=bits;
					flag<=flag+1;
				end
				else if(flag==9)	begin
					write_d[15:12]<=bits;
					flag<=0;
					state<=0;
					substate<=4;
				end
			end
			else if(state==6)	begin
				if(flag==0)	begin
					read_a1[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==1)	begin
					read_a1[4]<=bits[0];
					flag<=flag+1;
				end
				else if(flag==2)	begin
					read_a2[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==3)	begin
					read_a2[4]<=bits[0];
					flag<=flag+1;
				end
				else if(flag==4)	begin
					write_a[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==5)	begin
					write_a[4]<=bits[0];
					flag<=0;
					state<=0;
					substate<=6;
				end
			end
			else if(state==7)	begin
				if(flag==0)	begin
					read_a1[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==1)	begin
					read_a1[4]<=bits[0];
					flag<=flag+1;
				end
				else if(flag==2)	begin
					read_a2[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==3)	begin
					read_a2[4]<=bits[0];
					flag<=flag+1;
				end
				else if(flag==4)	begin
					write_a[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==5)	begin
					write_a[4]<=bits[0];
					flag<=0;
					state<=0;
					substate<=8;
				end
			end
			else if(state==8)	begin
				if(flag==0)	begin
					read_a1[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==1)	begin
					read_a1[4]<=bits[0];
					flag<=flag+1;
				end
				else if(flag==2)	begin
					write_a[3:0]<=bits;
					flag<=flag+1;
				end
				else if(flag==3)	begin
					write_a[4]<=bits[0];
					flag<=flag+1;
				end
				else if(flag==4)	begin
					shift<=bits;
					flag<=0;
					state<=0;
					substate<=9;
				end
			end
			
        end
        prev_rotation_event<=rotation_event;
    end

    sixteen_bit_addsum uut1(read_d1,read_d2,operation,add_res);
    left_shift uut2(clk,read_d1,shift,shift_res);
endmodule
