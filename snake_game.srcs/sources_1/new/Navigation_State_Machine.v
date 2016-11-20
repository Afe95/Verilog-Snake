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


module Navigation_State_Machine(
        input CLK,
        input RESET,
        input BTNU,
        input BTND,
        input BTNL,
        input BTNR,
        input BTNC,
        output [1:0] STATE
    );
    
    reg [1:0] state_snake;
    
    assign STATE = state_snake;
    
    wire [1:0] next_state;
    
    if (BTNU)
        assign next_state = 2'd0;
    else if (BTNL)
        assign next_state = 2'd1;
    else if (BTNR)
        assign next_state = 2'd2;
    else if (BTND)
        assign next_state = 2'd3;
    else
        assign next_state = state_snake;
        
    always@(CLK) begin
        if (state_snake != ~next_state)
            state_snake <= next_state;
        else
            state_snake <= state_snake;
    end
    
endmodule
