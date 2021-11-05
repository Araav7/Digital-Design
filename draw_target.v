`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2019 02:23:59
// Design Name: 
// Module Name: draw_target
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


module draw_target(
    input [11:0] horz,
    input [11:0] vert,
    input shoot,
    input fire,
    input [11:0] i,
    input [11:0] j,
    input [9:0] size,
    input [11:0] x_start,
    input [11:0] y_start,
    output target
    );
    
    wire hit = 0;
    wire balloon;
    assign hit = shoot;// || fire) && (horz - j - x_start == 0) && (vert - i - y_start == 0) ? 1 : hit;
    assign target = (horz + 640 - j - x_start)**2 + (vert + 512 - i - y_start)**2 < 20**2;
//    assign target = hit ? target : balloon;
    
endmodule
