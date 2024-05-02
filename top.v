`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 10:23:59
// Design Name: 
// Module Name: top
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


module top#(parameter K = 8)(

    input wire a_clk,
    input wire b_clk,
    input wire rst,
    input wire en,
    output wire [K-1:0] b_data_out

    );
    
    wire [K-1:0] a_internal_wire_gray;
    wire [K-1:0] b_internal_wire_gray;
    wire [K-1:0] b_internal_wire_gray2;
    wire a_load_w;
    wire b_load_w;
    
    (*dont_touch = "true"*)
    
    gray_counter #(K) cnt1 (.clk(a_clk),
    .rst(rst),
    .en(en),
    .load(a_load_w),
    .cnt_out(a_internal_wire_gray));
    
    synch #(K+1) syn1 (.syn_clk(b_clk),
    .rst(rst),
    .in({a_load_w,a_internal_wire_gray}),
    .syn_out({b_load_w,b_internal_wire_gray}));
    
    register #(K) reg1 (.clk(b_clk),
    .load(b_load_w),
    .data_in(b_internal_wire_gray),
    .data_out(b_internal_wire_gray2));
    
    gray2bin #(K) conv (.data_in(b_internal_wire_gray2),
    .data_out(b_data_out));
    
endmodule
