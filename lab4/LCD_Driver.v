`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    13:33:51 02/12/2024
// Design Name:
// Module Name:    LCD_driver_top
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
///////////////////////`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    14:27:07 02/05/2024
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
module LCD_driver(line_1, line_2, clk, LCD_E, LCD_RS, LCD_W, data);

    input clk;
    input [127:0]line_1;
    input [127:0]line_2;
    output LCD_E, LCD_RS, LCD_W;
    output[3:0] data;

    reg[7:0] DB;
    reg LCD_E, LCD_RS, LCD_W;
    reg [3:0]data;
    reg[20:0] counter = 21'b0;

    reg[3:0] state = 0;
    reg [7:0] pos = 127;

/*    initial begin
        LCD_E = 0;
        #20
        LCD_RS=0; LCD_W=0; data=0x3;
        #20
        LCD_E=1;
        #20

        LCD_E = 0;
        #20
        LCD_RS=0; LCD_W=0; data=0x3;
        #20
        LCD_E=1;
        #20

        LCD_E = 0;
        #20
        LCD_RS=0; LCD_W=0; data=0x3;
        #20
        LCD_E=1;
        #20

        LCD_E = 0;
        #20
        LCD_RS=0; LCD_W=0; data=0x2;
        #20
        LCD_E=1;
        #20

        // Function Set
        LCD_E = 0;
        #20
        LCD_RS=0; LCD_W=0; data=0x2;
        #20
        LCD_E=1;
        #20
        LCD_E = 0;
        #20
        LCD_RS=0; LCD_W=0; data=0x8;
        #20
        LCD_E=1;
        #20
        // Entry Mode Set
        LCD_E = 0;
        #20
        LCD_RS=0; LCD_W=0; data=0x0;
        #20
        LCD_E=1;
        #20
        LCD_E = 0;
        #20
        LCD_RS=0; LCD_W=0; data=0x6;
        #20
        LCD_E=1;
        #20
        // second step
        // third command
        LCD_E = 0;
        #20
        LCD_RS=0; LCD_W=0; data=0x0;
        #20
        LCD_E=1;
        #20

        LCD_E = 0;
        #20
        LCD_RS=0; LCD_W=0; data=0xC;
        #20
        LCD_E=1;
        #20

        // Clear Display
        LCD_E = 0;
        #20
        LCD_RS=0; LCD_W=0; data=0x0;
        #20
        LCD_E=1;
        #20
        LCD_E = 0;
        #20
        LCD_RS=0; LCD_W=0; data=0x1;
        #20
        LCD_E=1;
        #20
    end
    */

    always @(posedge clk)
        begin
            if(counter == 1000000) begin
                if(state == 0)    begin    // initialise
                    LCD_E = 0;
                    #20
                    LCD_RS=0; LCD_W=0; data=4'h3;
                    #20
                    LCD_E=1;
                    #20

                    LCD_E = 0;
                    #20
                    LCD_RS=0; LCD_W=0; data=4'h3;
                    #20
                    LCD_E=1;
                    #20

                    LCD_E = 0;
                    #20
                    LCD_RS=0; LCD_W=0; data=4'h3;
                    #20
                    LCD_E=1;
                    #20

                    LCD_E = 0;
                    #20
                    LCD_RS=0; LCD_W=0; data=4'h2;
                    #20
                    LCD_E=1;
                    #20

                          state = state + 1;
                    end
                    else if(state == 1) begin
                    // Function Set
                    LCD_E = 0;
                    #20
                    LCD_RS=0; LCD_W=0; data=4'h2;
                    #20
                    LCD_E=1;
                    #20
                    LCD_E = 0;
                    #20
                    LCD_RS=0; LCD_W=0; data=4'h8;
                    #20
                    LCD_E=1;
                    #20
                          state = state + 1;
                    end
                    else if(state == 2) begin
                    // Entry Mode Set
                    LCD_E = 0;
                    #20
                    LCD_RS=0; LCD_W=0; data=4'h0;
                    #20
                    LCD_E=1;
                    #20
                    LCD_E = 0;
                    #20
                    LCD_RS=0; LCD_W=0; data=4'h6;
                    #20
                    LCD_E=1;
                    #20
                    // second step
                          state = state + 1;
                    end
                    else if(state == 3) begin
                    // third command    Display On/Off
                    LCD_E = 0;
                    #20
                    LCD_RS=0; LCD_W=0; data=4'h0;
                    #20
                    LCD_E=1;
                    #20

                    LCD_E = 0;
                    #20
                    LCD_RS=0; LCD_W=0; data=4'hC;
                    #20
                    LCD_E=1;
                    #20
                    state = state + 1;
                    end
                    else if(state == 4) begin
                    // Clear Display
                    LCD_E = 0;
                    #20
                    LCD_RS=0; LCD_W=0; data=4'h00;
                    #20
                    LCD_E=1;
                    #20
                    LCD_E = 0;
                    #20
                    LCD_RS=0; LCD_W=0; data=4'h01;
                    #20
                    LCD_E=1;
                    #20
                    state = state + 1;
                    end
                    else if(state == 5) begin

                          // entering into begin mode
                          LCD_E = 0;
                    #20
                    LCD_RS=0; LCD_W=0; data=4'h08;
                    #20
                    LCD_E=1;
                    #20
                    LCD_E = 0;
                    #20
                    LCD_RS=0; LCD_W=0; data=4'h0;
                    #20
                    LCD_E=1;
                    #20
                    state = state +1 ;

                end

                else if(state == 6) begin

                   if(pos > 3) begin
                            DB = line_1[pos -: 4];
                     LCD_E = 0;
                     #20
                     LCD_RS=1; LCD_W=0; data=DB[7:4];
                     #20
                     LCD_E=1;
                     #20

                     LCD_E = 0;
                     #20
                     LCD_RS=1; LCD_W=0; data=DB[3:0];
                     #20
                     LCD_E=1;
                     #20
                            pos = pos - 4;
                        end

                        else    begin
                            DB = line_1[3: 0];
                     LCD_E = 0;
                     #20
                     LCD_RS=1; LCD_W=0; data=DB[7:4];
                     #20
                     LCD_E=1;
                     #20
                     LCD_E = 0;
                     #20
                     LCD_RS=1; LCD_W=0; data=DB[3:0];
                     #20
                     LCD_E=1;
                     #20
                            pos = 127;
                            state = state +1;
                         end

                end

                else if(state == 7) begin        // line change
                    LCD_E = 0;
                    #20
                    LCD_RS=0; LCD_W=0; data=4'hC;
                    #20
                    LCD_E=1;
                    #20
                    LCD_E = 0;
                    #20
                    LCD_RS=0; LCD_W=0; data=4'h0;
                    #20
                    LCD_E=1;
                    #20
                    state = state +1;
                end
                else if(state == 8) begin
                   if(pos > 3) begin
                            DB = line_2[pos -: 4];
                     LCD_E = 0;
                     #20
                     LCD_RS=1; LCD_W=0; data=DB[7:4];
                     #20
                     LCD_E=1;
                     #20
                     LCD_E = 0;
                     #20
                     LCD_RS=1; LCD_W=0; data=DB[3:0];
                     #20
                     LCD_E=1;
                     #20
                            pos = pos - 4;
                        end
                        else    begin
                            DB = line_2[3: 0];
                     LCD_E = 0;
                     #20
                     LCD_RS=1; LCD_W=0; data=DB[7:4];
                     #20
                     LCD_E=1;
                     #20
                     LCD_E = 0;
                     #20
                     LCD_RS=1; LCD_W=0; data=DB[3:0];
                     #20
                     LCD_E=1;
                     #20
                            pos = 127;
                            state = state + 1;
                        end
               end
                end
            else begin
                counter = counter + 1;
            end
        end

endmodule