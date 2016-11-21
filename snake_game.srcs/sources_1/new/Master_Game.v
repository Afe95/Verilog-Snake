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
        input CLK, //k
        input BTNU, //k
        input BTND, //k
        input BTNL, //k
        input BTNR, //k
        input BTNC, //k
        output [11:0] COLOUR_OUT, //k
        output HS, //k
        output VS, //k
        output [3:0] SEG_SELECT,
        output [7:0] HEX_OUT //k
    );
    
    wire [3:0] score;
    wire [1:0] state_master;
    wire [1:0] state_navigation;
    wire [14:0] target_address;
    wire [18:0] address;
    wire [11:0] colour;
    wire [1:0] strobe;
    wire fail;
    
    Master_State_Machine msm    (
                                    .CLK(CLK),
                                    .BTNU(BTNU),
                                    .BTND(BTND),
                                    .BTNL(BTNL),
                                    .BTNR(BTNR),
                                    .BTNC(BTNC),
                                    .SCORE(score),
                                    .fail(fail),
                                    .STATE(state_master)
                                );
    
    Navigation_State_Machine nsm    (
                                        .CLK(CLK),
                                        .BTNU(BTNU),
                                        .BTND(BTND),
                                        .BTNL(BTNL),
                                        .BTNR(BTNR),
                                        .BTNC(BTNC),
                                        .STATE(state_navigation)
                                    );
    
    Snake_control s (
                        .CLK(CLK),
                        .RESET(BTNC),
                        .score(score),
                        .state_master(state_master),
                        .state_navigation(state_navigation),
                        .target_address(target_address),
                        .pixel_address(address),
                        .COLOUR_OUT(colour),
                        .reached_target(reached_target),
                        .fail(fail)
                    );
    
    Target_Generator tg (
                            .CLK(CLK),
                            .RESET(BTNC),
                            .reached_target(reached_target),
                            .rand_target_address(target_address)
                        );
    
    VGA_Interface vgai  (
                            .CLK(CLK),
                            .COLOUR_IN(colour),
                            .COLOUR_OUT(COLOUR_OUT),
                            .ADDR(address),
                            .HS(HS),
                            .VS(VS)
                        );
    
    Score_Counter sc    (
                            .CLK(CLK),
                            .RESET(BTNC),
                            .reached_target(reached_target),
                            .master_state(state_master),
                            .STROBE(strobe),
                            .SCORE(score)
                        );
    
    Segment_Display_Interface sdi   (
                                        .SEG_SELECT_IN(2'b00),
                                        .BIN_IN(score[3:0]),
                                        .DOT_IN(1'b0),
                                        .SEG_SELECT_OUT(SEG_SELECT),
                                        .HEX_OUT(HEX_OUT)
                                    );
    
endmodule
