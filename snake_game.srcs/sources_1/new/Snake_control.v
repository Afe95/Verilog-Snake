`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2016 03:30:56
// Design Name: 
// Module Name: Snake_control
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


module Snake_control(
    input CLK,
    input RESET,
    input [2:0] state_master,
    input [2:0] state_navigation,
    input [14:0] target_address,
    input [18:0] pixel_address,
    output [11:0] colour,
    output reached_target
    );
    
    Target_Generator tg (
                            .CLK(CLK),
                            .RESET(RESET),
                            .reached_target(reached_target),
                            .rand_target_address(target_address)
                        );
    
endmodule
