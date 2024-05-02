`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2024 16:06:50
// Design Name: 
// Module Name: synch
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


module synch#(parameter K = 8)(
    
    input wire syn_clk,
    input wire rst,
    input wire [K-1:0] in,
    output reg [K-1:0] syn_out

    );
    
   reg [K-1:0] internal;
   
   always @(posedge syn_clk,posedge rst) begin
        if(rst) begin
           internal <= 0;
           syn_out <= 0;
        end
        else begin
           internal <= in;
           syn_out <= internal;
        end
   end
endmodule
