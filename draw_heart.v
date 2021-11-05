`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2019 21:34:07
// Design Name: 
// Module Name: draw_heart
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


module draw_heart(
    input [11:0] horz,
    input [11:0] vert,
    input [9:0] sample,
    input [1:0] size,
    input [9:0] memory_high,
    input [9:0] memory_low,
    output condition,
    output [3:0] red_heart
    );
    
    wire [11:0] x;
    wire [11:0] y;
    wire [7:0] r;
    assign x = (size == 1) ? 1120 :
                {(size == 2) ? 480 :
                    {(size == 3) ? 640 : 0}};
    assign y = (size == 1) ? 170 : 
                {(size == 2) ? 512 :
                    {(size == 3) ? 512 : 0}};
    assign r = (size == 1) ? 8 : 1;
    
    wire [11:0] abs_horz;
    assign abs_horz = (horz < x) ? (x - horz) : horz - x;
    
    assign condition  = (size == 0) ? 0 : ((horz - x)**2 + (vert - y)*(abs_horz) + (vert - y)**2) < (100*sample / r);
    wire size_1k = ((horz - x)**2 + (vert - y)*(abs_horz) + (vert - y)**2) < (1000 / r);
    wire size_4k = ((horz - x)**2 + (vert - y)*(abs_horz) + (vert - y)**2) < (4000 / r);
    wire size_10k = ((horz - x)**2 + (vert - y)*(abs_horz) + (vert - y)**2) < (10000 / r);
    wire size_20k = ((horz - x)**2 + (vert - y)*(abs_horz) + (vert - y)**2) < (20000 / r);
    wire size_40k = ((horz - x)**2 + (vert - y)*(abs_horz) + (vert - y)**2) < (40000 / r);
    wire size_70k = ((horz - x)**2 + (vert - y)*(abs_horz) + (vert - y)**2) < (70000 / r);
    wire size_100k = ((horz - x)**2 + (vert - y)*(abs_horz) + (vert - y)**2) < (100000 / r);
    assign red_heart = (size_1k) ? 6 : 
                        {(size_4k) ? 7 : 
                            {(size_10k) ? 8 : 
                                {(size_20k) ? 9 : 
                                    {(size_40k) ? 11 : 
                                        {(size_70k) ? 13 :  
                                           {(size_100k) ? 15 : 0}}}}}};   
    
endmodule
