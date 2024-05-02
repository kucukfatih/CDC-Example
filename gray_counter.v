`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 09:25:11
// Design Name: 
// Module Name: gray_counter
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


module gray_counter#(parameter K = 8)(
    
    input wire clk,
    input wire rst,
    input wire en,
    output reg [K-1:0] cnt_out,
    output reg load
    
    );
    
    reg [K-1:0] counter_reg;
    
    always @(posedge clk, posedge rst) begin 
        if(rst) begin 
            counter_reg <= 0;
            load <= 0;
        end
        else if(en) begin
            counter_reg <= counter_reg + 1;
            load <= 1;
        end
        else
            counter_reg <= counter_reg;
    end
    
    always @(*) begin 
    
    cnt_out = (counter_reg >> 1) ^ counter_reg;
    
    end
endmodule
