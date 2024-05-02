`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 11:03:22
// Design Name: 
// Module Name: register
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


module register#(parameter K = 8)(

    input wire [K-1:0] data_in,
    input wire clk,
    input wire load,
    output wire [K-1:0] data_out

    );
    
    reg [K-1:0] register;
    
    always @(posedge clk) begin
        if(load)
            register <= data_in;
        else
            register <= register;
    end
    
    assign data_out = register;
endmodule
