`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:37:23 03/30/2024 
// Design Name: 
// Module Name:    decoder 
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
module decoder(
    output wire [7:0] led,
    input clk,
    input PB1
);
reg [7:0] xored;
reg [2:0] memory[0:7];
reg [7:0] decoded[0:7];
reg [3:0] counter;
reg [3:0] index;
reg [7:0] mode;
reg [7:0] parity;
initial begin
    mode = 8'b0;
    memory[0] = 3'b011;
    memory[1] = 3'b100;
    memory[2] = 3'b111;
    memory[3] = 3'b010;
    memory[4] = 3'b011;
    memory[5] = 3'b101;
    memory[6] = 3'b000;
    memory[7] = 3'b010;
	 counter = 4'b0;
	 index = 4'b0;
	 xored=8'b0;
	 parity=8'b0;
end

always @(posedge PB1) begin
	mode[7:0] = ~mode[7:0];
end
always @(posedge clk) begin
    if (counter < 8) begin
        if(memory[counter]==0) begin
		  decoded[counter]<=8'b00000001;
        counter <= counter + 1;
		  end
		  else if(memory[counter]==1) begin
		  decoded[counter]<=8'b00000010;
        counter <= counter + 1;
		  end
		  else if(memory[counter]==2) begin
		  decoded[counter]<=8'b00000100;
        counter <= counter + 1;
		  end
		  else if(memory[counter]==3) begin
		  decoded[counter]<=8'b00001000;
        counter <= counter + 1;
		  end
		  else if(memory[counter]==4) begin
		  decoded[counter]<=8'b00010000;
        counter <= counter + 1;
		  end
		  else if(memory[counter]==5) begin
		  decoded[counter]<=8'b00100000;
        counter <= counter + 1;
		  end
		  else if(memory[counter]==6) begin
		  decoded[counter]<=8'b01000000;
        counter <= counter + 1;
		  end
		  else if(memory[counter]==7) begin
		  decoded[counter]<=8'b10000000;
        counter <= counter + 1;
		  end
    end 
	 else begin
	 if (index < 8) begin
            xored <= xored ^ decoded[index];
            index <= index + 1;
        end 
		  else begin
            index <= 0;
				counter <= 0;
				parity[0] <= xored[0] ^ xored[1] ^ xored[2] ^ xored[3] ^ xored[4] ^ xored[5] ^ xored[6] ^ xored[7];
        end        
    end
end

assign led[7:0] = (xored[7:0] & ~mode[7:0] | parity[7:0] & mode[7:0]);


// Toggle LED based on decoded values

endmodule
