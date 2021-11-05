`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2019 21:34:07
// Design Name: 
// Module Name: draw_wave
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


module draw_wave( 
    input [11:0] horz, 
    input [11:0] vert, 
    input [11:0] Sample_Memory, 
    input [1:0] size,
    input [1:0] state,
    input [10:0] i,
    output [3:0] blue, 
    output [3:0] green, 
    output [3:0] red
    );
    
    wire [7:0] scale;
    wire [7:0] mod;
    wire [11:0] x;
    wire [11:0] ymin;
    wire [11:0] ymax;
    assign scale = (size == 1) ? 4 : 1;
    assign mod = (size == 1) ? 3 : 10;
    assign x = (size == 1) ? 1120 : 
                {(size == 2) ? 480 : 640};
    assign ymin = (state == 0) ? 0 :
                {(state == 1) ? 26 :
                    {(state == 2) ? 366 : 706}};
    assign ymax = (state == 0) ? 1024 :
                {(state == 1) ? 314 :
                    {(state == 2) ? 654 : 998}};

//      Code for verticle waveform           
    assign blue =   (size == 0) ? 0 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  < 16 && vert < ymax && vert > ymin) ? 15 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96 == 16 && vert < ymax && vert > ymin) ? 15 :
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96 == 17 && vert < ymax && vert > ymin) ? 14 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96 == 18 && vert < ymax && vert > ymin) ? 13 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96 == 19 && vert < ymax && vert > ymin) ? 12 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96 == 20 && vert < ymax && vert > ymin) ? 11 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96 == 21 && vert < ymax && vert > ymin) ? 10 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96 == 22 && vert < ymax && vert > ymin) ? 9 :  
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96 == 23 && vert < ymax && vert > ymin) ? 8 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96 == 24 && vert < ymax && vert > ymin) ? 7 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96 == 25 && vert < ymax && vert > ymin) ? 6 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96 == 26 && vert < ymax && vert > ymin) ? 5 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96 == 27 && vert < ymax && vert > ymin) ? 4 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96 == 28 && vert < ymax && vert > ymin) ? 3 :      
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96 == 29 && vert < ymax && vert > ymin) ? 2 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96 == 30 && vert < ymax && vert > ymin) ? 1 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96 == 31 && vert < ymax && vert > ymin) ? 0 :  
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96 == 31 && vert < ymax && vert > ymin) ? 0 :
                                       
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 80 && vert < ymax && vert > ymin) ? 0 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 81 && vert < ymax && vert > ymin) ? 1 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 82 && vert < ymax && vert > ymin) ? 2 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 83 && vert < ymax && vert > ymin) ? 3 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 84 && vert < ymax && vert > ymin) ? 4 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 85 && vert < ymax && vert > ymin) ? 5 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 86 && vert < ymax && vert > ymin) ? 6 :  
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 87 && vert < ymax && vert > ymin) ? 7 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 88 && vert < ymax && vert > ymin) ? 8 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 89 && vert < ymax && vert > ymin) ? 9 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 90 && vert < ymax && vert > ymin) ? 10 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 91 && vert < ymax && vert > ymin) ? 11 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 92 && vert < ymax && vert > ymin) ? 12 :      
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 93 && vert < ymax && vert > ymin) ? 13 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 94 && vert < ymax && vert > ymin) ? 14 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 95 && vert < ymax && vert > ymin) ? 15 : 0; 

    assign green =  (size == 0) ? 0 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 0 && vert < ymax && vert > ymin) ? 0 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 1 && vert < ymax && vert > ymin) ? 1 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 2 && vert < ymax && vert > ymin) ? 2 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 3 && vert < ymax && vert > ymin) ? 3 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 4 && vert < ymax && vert > ymin) ? 4 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 5 && vert < ymax && vert > ymin) ? 5 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 6 && vert < ymax && vert > ymin) ? 6 :  
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 7 && vert < ymax && vert > ymin) ? 7 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 8 && vert < ymax && vert > ymin) ? 8 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 9 && vert < ymax && vert > ymin) ? 9 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 10 && vert < ymax && vert > ymin) ? 10 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 11 && vert < ymax && vert > ymin) ? 11 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 12 && vert < ymax && vert > ymin) ? 12 :      
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 13 && vert < ymax && vert > ymin) ? 13 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 14 && vert < ymax && vert > ymin) ? 14 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 15 && vert < ymax && vert > ymin) ? 15 :  
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  > 15) && (((vert + i) / mod) % 96  < 48 && vert < ymax && vert > ymin) ? 15 :
                   
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 48 && vert < ymax && vert > ymin) ? 15 :
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 49 && vert < ymax && vert > ymin) ? 14 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 50 && vert < ymax && vert > ymin) ? 13 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 51 && vert < ymax && vert > ymin) ? 12 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 52 && vert < ymax && vert > ymin) ? 11 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 53 && vert < ymax && vert > ymin) ? 10 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 54 && vert < ymax && vert > ymin) ? 9 :  
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 55 && vert < ymax && vert > ymin) ? 8 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 56 && vert < ymax && vert > ymin) ? 7 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 57 && vert < ymax && vert > ymin) ? 6 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 58 && vert < ymax && vert > ymin) ? 5 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 59 && vert < ymax && vert > ymin) ? 4 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 60 && vert < ymax && vert > ymin) ? 3 :      
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 61 && vert < ymax && vert > ymin) ? 2 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 62 && vert < ymax && vert > ymin) ? 1 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 63 && vert < ymax && vert > ymin) ? 0 : 0;
                    
    assign red =    (size == 0) ? 0 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 32 && vert < ymax && vert > ymin) ? 0 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 33 && vert < ymax && vert > ymin) ? 1 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 34 && vert < ymax && vert > ymin) ? 2 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 35 && vert < ymax && vert > ymin) ? 3 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 36 && vert < ymax && vert > ymin) ? 4 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 37 && vert < ymax && vert > ymin) ? 5 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 38 && vert < ymax && vert > ymin) ? 6 :  
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 39 && vert < ymax && vert > ymin) ? 7 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 40 && vert < ymax && vert > ymin) ? 8 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 41 && vert < ymax && vert > ymin) ? 9 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 42 && vert < ymax && vert > ymin) ? 10 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 43 && vert < ymax && vert > ymin) ? 11 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 44 && vert < ymax && vert > ymin) ? 12 :      
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 45 && vert < ymax && vert > ymin) ? 13 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 46 && vert < ymax && vert > ymin) ? 14 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 47 && vert < ymax && vert > ymin) ? 15 :  
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  > 47) && (((vert + i) / mod) % 96  < 80 && vert < ymax && vert > ymin) ? 15 :
                   
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 80 && vert < ymax && vert > ymin) ? 15 :
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 81 && vert < ymax && vert > ymin) ? 14 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 82 && vert < ymax && vert > ymin) ? 13 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 83 && vert < ymax && vert > ymin) ? 12 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 84 && vert < ymax && vert > ymin) ? 11 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 85 && vert < ymax && vert > ymin) ? 10 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 86 && vert < ymax && vert > ymin) ? 9 :  
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 87 && vert < ymax && vert > ymin) ? 8 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 88 && vert < ymax && vert > ymin) ? 7 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 89 && vert < ymax && vert > ymin) ? 6 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 90 && vert < ymax && vert > ymin) ? 5 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 91 && vert < ymax && vert > ymin) ? 4 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 92 && vert < ymax && vert > ymin) ? 3 :      
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 93 && vert < ymax && vert > ymin) ? 2 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 94 && vert < ymax && vert > ymin) ? 1 : 
                    (horz < (x + Sample_Memory / scale)) && (horz > (x - Sample_Memory / scale)) && (((vert + i) / mod) % 96  == 95 && vert < ymax && vert > ymin) ? 0 : 0;
   
endmodule
