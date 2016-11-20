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
    output [1:0] STROBE,
    output [7:0] SCORE
    );
    
    wire Bit17TriggOut;
    wire [1:0] StrobeCount;
    
    reg [7:0] current_score;
    
    assign SCORE = current_score;
    
    always@(posedge CLK) begin
        if (reached_target)
            current_score <= current_score + 1;
        else
            current_score <= current_score;
    end
    
    Generic_counter # (
                        .COUNTER_WIDTH(17),
                        .COUNTER_MAX(99999)
                      )
                      Bit17Counter (
                        .CLK(CLK),
                        .RESET(RESET),
                        .ENABLE_IN(1'b1),
                        .TRIG_OUT(Bit17TriggOut)
                      );
                      
    Generic_counter # (
                          .COUNTER_WIDTH(2),
                          .COUNTER_MAX(3)
                        )
                        Bit2Counter (
                          .CLK(CLK),
                          .RESET(RESET),
                          .ENABLE_IN(Bit17TriggOut),
                          .COUNT(STROBE)
                      );
    
endmodule
