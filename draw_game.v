`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2019 01:38:38
// Design Name: 
// Module Name: draw_game
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


module draw_game(
    input clk_20,
    input [11:0] horz,
    input [11:0] vert,
    input [9:0] sample_max,
    input btn,
    input fire,
    input left,
    input right,
    output [3:0] red_game,
    output [3:0] green_game,
    output [3:0] blue_game
    );
    
    // Set sample
    wire [9:0] sample;
    assign sample = (sample_max < 512) ? 0 : (sample_max - 512) / 16;
    
    // Set clock and movement
    reg [9:0] i = 400;
    reg [11:0] j = 640;
    wire clk_100;
    flex_clk hz_10 (clk_20, 800, clk_100);
    
    always @ (posedge clk_100) begin
        i = btn ? 400 :
            {(sample == 0) ? i :
                {(sample < 18 && i > 224) ? (i - 32 + sample) :
                    {(sample > 19 && i < 800) ? i + sample : i}}};
        j = (left && j > 10) ? j - 10 :
                {(right && j < 1270) ? j + 10 : j};
    end
    
    
    wire [9:0]shake = sample;
    
    // Ready aim fire
    wire pew;
    wire shoot;
    wire flash;
    wire bam;
    assign pew = (sample > 27) ? 1 : 0;
    pushbutton pewpew (clk_100, pew, shoot);
    draw_target pow (horz, vert, 0, 0, 512, 640, 10, 640, 512, flash);
    assign bam = shoot || fire ? flash : 0;
                      
    reg hit1 = 0;
    reg hit2 = 0;
    reg hit3 = 0;
    reg hit4 = 0;
    wire b1_black;
    wire b1_red;
    wire b2_black;
    wire b2_red;
    wire b3_black;
    wire b3_red;
    wire b4_black;
    wire b4_red;
    wire balloon1_black;
    wire balloon1_red;
    wire balloon2_black;
    wire balloon2_red;
    wire balloon3_black;
    wire balloon3_red;
    wire balloon4_black;
    wire balloon4_red;
    draw_balloon b1 (horz, vert, i, j + shake, b1_black, b1_red, b2_black, b2_red, b3_black, b3_red, b4_black, b4_red);
    
    always @ (posedge clk_20) begin
        if ((shoot || fire) && j < 480 && j > 400 && i < 654 && i > 554) hit1 = 1;
        else if (btn) hit1 = 0;
        if ((shoot || fire) && j < 880 && j > 800 && i < 454 && i > 354) hit2 = 1;
        else if (btn) hit2 = 0;
        if ((shoot || fire) && j < 1080 && j > 1000 && i < 804 && i > 684) hit3 = 1;
        else if (btn) hit3 = 0;
        if ((shoot || fire) && j < 380 && j > 300 && i < 304) hit4 = 1;
        else if (btn) hit4 = 0;
    end
    assign balloon1_black = (hit1 == 0) ? b1_black : 0;
    assign balloon1_red =   (hit1 == 0) ? b1_red : 0;
    assign balloon2_black = (hit2 == 0) ? b2_black : 0;
    assign balloon2_red =   (hit2 == 0) ? b2_red : 0;
    assign balloon3_black = (hit3 == 0) ? b3_black : 0;
    assign balloon3_red =   (hit3 == 0) ? b3_red : 0;
    assign balloon4_black = (hit4 == 0) ? b4_black : 0;
    assign balloon4_red =   (hit4 == 0) ? b4_red : 0;
    
    wire scope;
    wire background;
    wire ground;
    wire sky;
    wire crosshair;
    assign scope = (horz - 640)**2 + (vert - 512)**2 > 400**2 &&
                    (horz - 640)**2 + (vert - 512)**2 < 600**2 ||
                        (horz - 640)**2 + (vert - 512)**2 < 380**2 &&
                            (horz - 640)**2 + (vert - 512)**2 > 377**2;
    assign background = (horz - 640)**2 + (vert - 512)**2 > 600**2;
    assign ground = vert > i;
    assign sky = !ground;    
    assign crosshair = (horz == 640) || (vert == 512) || 
                            ((vert % 32 == 0 && vert > 512 && horz < 650 && horz > 630));
    
    // Assign colors
    assign red_game =  background && ground ? 1 : 
                            {background && sky ? 0 :
                                {crosshair || scope ? 0 : 
                                    {bam ? 15 :
                                        {balloon1_black ? 0 :
                                            {balloon1_red ? 10 :
                                                {balloon2_black ? 0 :
                                                    {balloon2_red ? 0 :
                                                        {balloon3_black ? 0 :
                                                            {balloon3_red ? 0 : 
                                                                {balloon4_black ? 0 :
                                                                    {balloon4_red ? 10 :
                                                                                {sky ? 5 : 0}}}}}}}}}}}};
    assign green_game = background && ground ? 2 :
                            {background && sky ? 2 : 
                                {crosshair || scope ? 0 :                                                
                                    {bam ? 15 :
                                        {balloon1_black ? 0 :
                                            {balloon1_red ? 0 : 
                                                {balloon2_black ? 0 :
                                                    {balloon2_red ? 0 :
                                                        {balloon3_black ? 0 :
                                                            {balloon3_red ? 15 : 
                                                                {balloon4_black ? 0 :
                                                                    {balloon4_red ? 0 :
                                                                                {ground || sky ? 10 : 0}}}}}}}}}}}};
    assign blue_game = background && ground ? 0 : 
                            {background && sky ? 2 : 
                                {crosshair || scope ? 0 :                                                                  
                                    {bam ? 0 : 
                                        {balloon1_black ? 0 :
                                            {balloon1_red ? 0 : 
                                                {balloon2_black ? 0 :
                                                    {balloon2_red ? 10 :
                                                        {balloon3_black ? 0 :
                                                            {balloon3_red ? 0 : 
                                                                {balloon4_black ? 0 :
                                                                    {balloon4_red ? 10 :
                                                                                {sky ? 10 : 0}}}}}}}}}}}};
    
endmodule
