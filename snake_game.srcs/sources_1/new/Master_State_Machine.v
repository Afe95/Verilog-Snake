`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2016 03:47:24
// Design Name: 
// Module Name: Master_State_Machine
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


module Master_State_Machine(
        input CLK,
        input RESET,
        input BTNU,
        input BTND,
        input BTNL,
        input BTNR,
        input BTNC,
        input [7:0] SCORE,
        output [1:0] STATE
    );
    
    reg [1:0] state_game;

    assign STATE = state_game;
    
    always@(posedge CLK) begin
        if (state_game == 2'd0 && (BTNU || BTND || BTNL || BTNR))
            state_game <= 2'd1;
        else if (state_game == 2'd2 && RESET)
            state_game <= 2'd0;
        else if (state_game == 2'd1 && SCORE == 8'd10)
            state_game <= 2'd2;
        else
            state_game <= state_game;
    end
    
endmodule
