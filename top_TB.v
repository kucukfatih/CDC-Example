`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 10:29:44
// Design Name: 
// Module Name: top_TB
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


module top_TB;

    parameter K = 8;
    
     reg a_clk;
     reg b_clk;
     reg rst;
     reg en;
     wire [K-1:0] b_data_out;
     
     
     initial a_clk = 0;
     always #10 a_clk = !a_clk;
     
     initial b_clk = 0;
     always #7 b_clk = !b_clk;
     
     top top1 (.a_clk(a_clk),.b_clk(b_clk),.rst(rst),.en(en),.b_data_out(b_data_out));
     
     
     initial begin 
     rst = 0;
     #5
     rst = 1;
     #5
     rst = 0;
     en = 1;
     #200;
     $finish;
     
     end
    
endmodule

