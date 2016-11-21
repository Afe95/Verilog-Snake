`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2016 01:27:31
// Design Name: 
// Module Name: Score_Counter
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


module Score_Counter(
    input CLK,
    input RESET,
    input reached_target,
    input [1:0] master_state,
    output [1:0] STROBE,
    output [3:0] SCORE
    );
    
    wire Bit17TriggOut;
    wire [1:0] StrobeCount;
    
    reg [3:0] current_score;
//    reg [3:0] next_score;
    assign SCORE = current_score;
    
    always@(posedge CLK) begin
        if (master_state == 2'd1) begin
            if (reached_target)
                current_score <= current_score + 4'd1;
        end
        else if (RESET)
            current_score <= 4'd0;
    end
    
//    always@(posedge CLK) begin
//        current_score <= next_score;
//    end
    
    Generic_counter # (
                        .COUNTER_WIDTH(17),
                        .COUNTER_MAX(99999)
                      )
                      Bit17Counter (
                        .CLK(CLK),
                        .RESET(1'b0),
                        .ENABLE_IN(1'b1),
                        .TRIG_OUT(Bit17TriggOut)
                      );
                      
    Generic_counter # (
                          .COUNTER_WIDTH(2),
                          .COUNTER_MAX(3)
                        )
                        Bit2Counter (
                          .CLK(CLK),
                          .RESET(1'b0),
                          .ENABLE_IN(Bit17TriggOut),
                          .COUNT(STROBE)
                      );
    
endmodule
