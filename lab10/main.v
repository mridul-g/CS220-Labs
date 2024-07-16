`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:13:46 04/15/2024 
// Design Name: 
// Module Name:    main 
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
`define MAX_PC 14
`define OUTPUT_REG 2

module main(clk, out);
    
    input clk;
    reg [2:0] state = 0;

    reg [31:0] current_instruction;
    reg [5:0] current_opcode;
    reg [4:0] current_rd;
    reg [4:0] current_rs;
    reg [4:0] current_rt;
    reg [4:0] current_shft;
    reg signed [15:0] current_imd;
    reg [5:0] current_func;
    reg [26:0] current_jt;

    reg [7:0] read_Value1;
    reg [7:0] read_Value2;
    reg [7:0] read_Row;

    reg invalid = 0; // invalid = 0 means it is valid.

    reg [7:0] temp_sum;
    reg [7:0] temp_links;
    reg [7:0] temp_slt;
    reg [7:0] temp_address;
   
    output reg [7:0] out;

    reg signed [7:0] data_memory[0:10];
    reg signed [7:0] registers[0:31];
    reg [7:0] pc= 8'b00001100;
    reg [3:0]index = 0;
	 reg [7:0]tempsum = 0;
	 reg [7:0]tempsum2 = 0;

    reg [31:0] instruction_memory[0:13];

    initial begin
      data_memory[0] = 8'b00000001;
      data_memory[1] = 8'b00000001;
      data_memory[2] = 8'b00000001;
      data_memory[3] = 8'b00000001;
      data_memory[4] = 8'b00000001;
      data_memory[5] = 8'b00000001;
      data_memory[6] = 8'b00000001;
      data_memory[7] = 8'b00000001;
      data_memory[8] = 8'b00000100;
      data_memory[9] = 8'b00000001;
      data_memory[10] = 8'b00101010;
    end

    initial begin
        instruction_memory[0]=32'b00100100000000100000000000000000;
        instruction_memory[1]=32'b00100100000000110000000000000000;
        instruction_memory[2]=32'b00000000011000010010000000101010;
        instruction_memory[3]=32'b00010000000001000000000000001000;
        instruction_memory[4]=32'b00100100000001010000000000001010;
        instruction_memory[5]=32'b00010000101000110000000000000110;
        instruction_memory[6]=32'b10001100011001100000000000000000;
        instruction_memory[7]=32'b00000000010001100001000000100001;
        instruction_memory[8]=32'b00100100011000110000000000000001;
        instruction_memory[9]=32'b00000000011000010010000000101010;
        instruction_memory[10]=32'b00010100000001001111111111111011;
        instruction_memory[11]=32'b00000011111000000000000000001000;
        instruction_memory[12]=32'b10001100000000010000000000001010;
        instruction_memory[13]=32'b00001100000000000000000000000000;
    end

    initial begin
        registers[0]=8'b0;
        registers[1]=8'b0;
        registers[2]=8'b0;
        registers[3]=8'b0;
        registers[4]=8'b0;
        registers[5]=8'b0;
        registers[6]=8'b0;
        registers[7]=8'b0;
        registers[8]=8'b0;
        registers[9]=8'b0;
        registers[10]=8'b0;
        registers[11]=8'b0;
        registers[12]=8'b0;
        registers[13]=8'b0;
        registers[14]=8'b0;
        registers[15]=8'b0;
        registers[16]=8'b0;
        registers[17]=8'b0;
        registers[18]=8'b0;
        registers[19]=8'b0;
        registers[20]=8'b0;
        registers[21]=8'b0;
        registers[22]=8'b0;
        registers[23]=8'b0;
        registers[24]=8'b0;
        registers[25]=8'b0;
        registers[26]=8'b0;
        registers[27]=8'b0;
        registers[28]=8'b0;
        registers[29]=8'b0;
        registers[30]=8'b0;
        registers[31]=8'b0;
    end

    always @(posedge clk) begin

        if (state == 0) begin
            current_instruction <= instruction_memory[pc];
            state <= 1;
        end

        else if (state == 1) begin
            current_opcode <= current_instruction[31:26];
            #1
            if (current_opcode == 0) begin
              current_rs <= current_instruction[25:21];
              current_rt <= current_instruction[20:16];
              current_rd <= current_instruction[15:11];
              current_shft <= current_instruction[10:6];
              current_func <= current_instruction[5:0];
            end
            else if (current_opcode != 2 & current_opcode != 3) begin
              current_rs <= current_instruction[25:21];
              current_rt <= current_instruction[20:16];
              current_imd <= current_instruction[15:0];
            end
            else begin
              current_jt <= current_instruction[25:0];
            end
            state <= 2;
        end

        else if (state == 2) begin
            if (current_opcode == 0) begin
              read_Value1 <= registers[current_rs];
              read_Value2 <= registers[current_rt];
            end
            else if (current_opcode != 2 & current_opcode != 3) begin
              read_Value1 <= registers[current_rs];

              if (current_opcode == 4 | current_opcode == 5) begin
                read_Value2 <= registers[current_rt];
              end
            end
            state <= 3;
        end

        else if (state == 3) begin
            if(current_opcode == 9) begin
              temp_sum <= read_Value1 + current_imd[7:0];
              pc <= pc + 1;
            end
            else if (current_opcode == 0 && current_func == 33) begin
              temp_sum <= read_Value1 + read_Value2;
              pc <= pc + 1;
            end
            else if (current_opcode == 0 && current_func == 42) begin
              if ($signed (read_Value1) < $signed(read_Value2)) begin
                temp_slt <= 1;
              end
              else begin
                temp_slt <= 0;
              end
              pc <= pc + 1;
            end
            else if (current_opcode == 4 || current_opcode == 5) begin
              if (current_opcode == 4) begin
                if (read_Value1 == read_Value2) begin
                  pc <= pc + current_imd[7:0];
                end
                else begin
                  pc <= pc + 1;
                end
              end
              if (current_opcode == 5) begin
                if (read_Value1 != read_Value2) begin
                  pc <= pc + current_imd[7:0];
                end
                else begin
                  pc <= pc + 1;
                end
              end
            end 
            else if (current_opcode == 3) begin
              temp_links <= pc + 1;
				  tempsum <= 1;
              pc <= current_jt[7:0];
            end
            else if (current_opcode == 0 && current_func == 8) begin
              pc <= read_Value1;
            end
            else if (current_opcode == 35) begin
              temp_address <= read_Value1 + current_imd[7:0];
              pc <= pc + 1;
            end
            else begin
                invalid <= 1;
            end
				 if(index < 10 && index < data_memory[10]) begin
					tempsum2<=tempsum2+data_memory[index];
					index<=index+1;
				 end
				 registers[`OUTPUT_REG] <= tempsum2;
				 if(index == data_memory[10] || index == 10)
				 begin
					state <= state + 1;
				 end
	        end
        else if (state == 4) begin
          if (current_opcode == 35) begin
            read_Row <= data_memory[temp_address];
          end
          state <= 5;
        end
        else if (state == 5) begin
            if(invalid == 0) begin
                if (current_opcode == 0 & current_rd != 0) begin
                  if (current_func == 33) begin
                    registers[current_rd] <= temp_sum;
                  end
                  else if (current_func == 42) begin
                    registers[current_rd] <= temp_slt;
                  end
						else begin
							index <= 9;
						end
                end
                else if (current_opcode == 9 & current_rt != 0) begin
                  registers[current_rt] <= temp_sum;
                end
                else if (current_opcode == 35 & current_rt != 0) begin
                    registers[current_rt] <= read_Row;
                end
                else if (current_opcode == 3) begin
                  registers[31] <= temp_links;
						tempsum <= tempsum + 1;
                end
            end
            if(pc < `MAX_PC) begin
                state <= 0;
            end
            else begin
                state <= 6;
            end
        end
        else if (state == 6) begin
            out <= registers[`OUTPUT_REG];
        end
    end

endmodule