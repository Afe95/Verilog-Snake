`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2016 03:44:16
// Design Name: 
// Module Name: Master_Game
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Master_Game(
        input CLK,
        input RESET,
        input BTNU,
        input BTND,
        input BTNL,
        input BTNR,
        input BTNC,
        output [11:0] COLOUR_OUT,
        output HS,
        output VS,
        output [3:0] SEG_SELECT,
        output [7:0] HEX_OUT
    );
endmodule
