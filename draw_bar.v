`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2019 21:34:07
// Design Name: 
// Module Name: draw_bar
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




    module draw_bar(
        input [11:0] horz,
        input [11:0] vert,
        input [9:0] sample,
        input [1:0] size,
        output condition,
        output [3:0]red, 
        output [3:0]green, 
        output [3:0]blue   
        );
        
        wire [11:0] left;                                                                                                                                                                                                                                                                            
        wire [11:0] right;                                                                                                                                                                                                                                                                           
        wire [11:0] left2;                                                                                                                                                                                                                                                                           
        wire [11:0] right2;                                                                                                                                                                                                                                                                          
        wire [11:0] left3;                                                                                                                                                                                                                                                                           
        wire [11:0] right3; 
        
        wire [11:0] le1;
        wire [11:0] ri1;
        
        wire [11:0] le2;
        wire [11:0] ri2;
        
        wire [11:0] le3;
        wire [11:0] ri3;
        
        wire [11:0] le4;
        wire [11:0] ri4;
        
        wire [11:0] le5;
        wire [11:0] ri5;
        
        wire [11:0] le6;
        wire [11:0] ri6;
        
        wire [11:0] le7;
        wire [11:0] ri7;
        
        wire [11:0] le8;
        wire [11:0] ri8;
        
        wire [11:0] le9;
        wire [11:0] ri9;
        
        wire [11:0] le10;
        wire [11:0] ri10;
        
        wire [11:0] le11;
        wire [11:0] ri11;
        
        wire [11:0] le12;
        wire [11:0] ri12;
        
        wire [11:0] le13;
        wire [11:0] ri13;
        
        wire [11:0] le14;
        wire [11:0] ri14;
        
        wire [11:0] le15;
        wire [11:0] ri15;
        
        wire [11:0] le16;
        wire [11:0] ri16;
                                                                                                                                                                                                                                                                                 
        wire [2:0] scale;                                                                                                                                                                                                                                                                            
        //bar1 with a different colour                                                                                                                                                                                                                                                               
        assign left = (size == 1) ? 1100 :                                                                                                                                                                                                                                                           
                        {(size == 2) ? 460 :                                                                                                                                                                                                                                                         
                            0};                                                                                                                                                                                                                                                
        assign right = (size == 1) ? 1140 :                                                                                                                                                                                                                                                          
                        {(size == 2) ? 600 :                                                                                                                                                                                                                                                         
                             0};                                                                                                                                                                                                                                                
        //bar2 with a different colour                                                                                                                                                                                                                                                               
        assign left2 =                                                                                                                                                                                                                                                                               
       (size == 1) ? 1160 :                                                                                                                                                                                                                                                                           
                      {(size == 2) ? 640 :                                                                                                                                                                                                                                                        
                              0};                                                                                                                                                                                                                                              
        assign right2 =                                                                                                                                                                                                                                                                              
        (size == 1) ? 1200 :                                                                                                                                                                                                                                                                         
                       {(size ==2) ? 780 :                                                                                                                                                                                                                                                        
                               0};                                                                                                                                                                                                                                              
        //bar3 with a different colour                                                                                                                                                                                                                                                               
        assign left3 =                                                                                                                                                                                                                                                                               
        (size == 1) ? 1040 :                                                                                                                                                                                                                                                                         
                       {(size == 2) ? 280 :                                                                                                                                                                                                                                                       
                          0};                                                                                                                                                                                                                                            
        assign right3 =                                                                                                                                                                                                                                                                              
        (size == 1) ? 1080 :                                                                                                                                                                                                                                                                         
                    {(size == 2) ? 420 :                                                                                                                                                                                                                                                         
                            0};   
                           
                           
        assign le1 = (size == 3) ? 0 : 0;
        assign ri1 = (size == 3) ? 40 : 0; 
        
        assign le2 = (size == 3) ? 80 : 0;
        assign ri2 = (size == 3) ? 120 : 0;
         
        assign le3 = (size == 3) ? 160 : 0;
        assign ri3 = (size == 3) ? 200 : 0;
         
        assign le4 = (size == 3) ? 240 : 0;
        assign ri4 = (size == 3) ? 280 : 0; 
        
        assign le5 = (size == 3) ? 320 : 0;
        assign ri5 = (size == 3) ? 360 : 0; 
        
        assign le6 = (size == 3) ? 400 : 0;
        assign ri6 = (size == 3) ? 440 : 0; 
        
        assign le7 = (size == 3) ? 480 : 0;
        assign ri7 = (size == 3) ? 520 : 0;
         
        assign le8 = (size == 3) ? 560 : 0;
        assign ri8 = (size == 3) ? 600 : 0; 
        
        assign le9 = (size == 3) ? 640 : 0;
        assign ri9 = (size == 3) ? 680 : 0; 
        
        assign le10 = (size == 3) ? 720 : 0;
        assign ri10 = (size == 3) ? 760 : 0;
        
        assign le11 = (size == 3) ? 800 : 0;
        assign ri11 = (size == 3) ? 840 : 0;
        
        assign le12 = (size == 3) ? 880 : 0;
        assign ri12 = (size == 3) ? 920 : 0;
        
        assign le13 = (size == 3) ? 960 : 0;
        assign ri13 = (size == 3) ? 1000 : 0;
        
        assign le14 = (size == 3) ? 1040 : 0; 
        assign ri14 = (size == 3) ? 1080 : 0;
         
        assign le15 = (size == 3) ? 1120 : 0; 
        assign ri15 = (size == 3) ? 1160 : 0; 
        
        assign le16 = (size == 3) ? 1200 : 0; 
        assign ri16 = (size == 3) ? 1240 : 0;
    
    
    
    
    
                                                                                                                                                                                                                                                                                                     
        assign scale = (size == 1) ? 4 : 1;                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                     
        assign condition = (horz > left && horz < right && vert < 1000 && vert > (1000 - sample / scale))||(horz > left2 && horz < right2 && vert < 1000 && vert > (1000 - sample / scale))|| (horz > left3 && horz < right3 && vert < 1000 && vert > (1000 - sample / scale))||(horz > le1 && horz < ri1 && vert < 1000 && vert > (1000 - sample / scale))
                            ||(horz > le2 && horz < ri2 && vert < 1000 && vert > (1000 - (sample/2) / scale))||(horz > le3 && horz < ri3 && vert < 1000 && vert > (1000 - (sample/3) / scale))||(horz > le4 && horz < ri4 && vert < 1000 && vert > (1000 - (sample/4) / scale))||
                            (horz > le5 && horz < ri5 && vert < 1000 && vert > (1000 - (sample/4) / scale))||(horz > le6 && horz < ri6 && vert < 1000 && vert > (1000 - (sample/3) / scale))||(horz > le7 && horz < ri7 && vert < 1000 && vert > (1000 - (sample/2) / scale))||(horz > le8 && horz < ri8 && vert < 1000 && vert > (1000 - sample / scale))
                            ||(horz > le9 && horz < ri9 && vert < 1000 && vert > (1000 - sample / scale))||(horz > le10 && horz < ri10 && vert < 1000 && vert > (1000 - (sample/2) / scale))||(horz > le11 && horz < ri11 && vert < 1000 && vert > (1000 - (sample/3) / scale))||
                            (horz > le12 && horz < ri12 && vert < 1000 && vert > (1000 - (sample/4) / scale))||(horz > le13 && horz < ri13 && vert < 1000 && vert > (1000 - (sample/4) / scale))||(horz > le14 && horz < ri14 && vert < 1000 && vert > (1000 - (sample/3) / scale))||
                            (horz > le15 && horz < ri15 && vert < 1000 && vert > (1000 - (sample/2) / scale))||(horz > le16 && horz < ri16 && vert < 1000 && vert > (1000 - sample / scale));                      
        assign red =   15; //(horz > left && horz < right && vert < 1000 && vert > (1000 - sample / scale)) ? 0 : 0;                                                                                                                                                                                  
        assign green = 0; //(horz > 1000 && horz < 1040 && vert < 1000) ? 15 : 0;// && vert > (1000 - sample / scale)) ? 15 : 0;                                                                                                                                                                    
        assign blue =  15; //(horz > left && horz < right && vert < 1000) ? 15 : 0;// && vert > (1000 - sample / scale)) ? 15 : 0;                                                                                                                                                                   
                                                                                                                                                                                                                                                                                                     
       endmodule                                                                                                                                                                                                                                                                                   

