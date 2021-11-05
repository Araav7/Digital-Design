`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//-------------------------------------------------------------------------  
//                  DRAWING GRID LINES AND TICKS ON SCREEN
// Description:
// Grid lines are drawn at pixel # 320 along the x-axis, and
// pixel #768 along the y-axis

// Note the VGA controller is configured to produce a 1024 x 1280 pixel resolution
//-------------------------------------------------------------------------

//-------------------------------------------------------------------------
// TOOD:    Draw grid lines at every 80-th pixel along the horizontal axis, and every 64th pixel
//          along the vertical axis. This gives us a 16x16 grid on screen. 
//          
//          Further draw ticks on the central x and y grid lines spaced 16 and 8 pixels apart in the 
//          horizontal and vertical directions respectively. This gives us 5 sub-divisions per division 
//          in the horizontal and 8 sub-divisions per divsion in the vertical direction   
//-------------------------------------------------------------------------  
  
//////////////////////////////////////////////////////////////////////////////////


module Draw_Background(
    input clk_20,
    input [4:0] btn, //center, up, left, right, down (0, 1, 2, 3, 4)
    input [9:0] sw,  //freeze, grid, axis/ticks, wave, ramp, 4 colors (0, 1, 2, 3, 4, 5-8)
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    output [3:0] VGA_Red_Grid,
    output [3:0] VGA_Green_Grid,
    output [3:0] VGA_Blue_Grid,
    output reg [1:0] state = 0
    );
    

    // For partitioned background
    wire Condition_For_Grid = (sw[1] || btn[3]) ? 0 : {(VGA_HORZ_COORD % 80 == 0 && VGA_VERT_COORD % 8 == 0 || VGA_VERT_COORD % 64 == 0 && VGA_HORZ_COORD % 16 == 0) && (VGA_HORZ_COORD < 960)};
    wire Condition_For_Partition = btn[3] ? 0 : ((VGA_HORZ_COORD < 963) && (VGA_HORZ_COORD > 957)) || 
                                    {(VGA_HORZ_COORD > 960) && ((VGA_VERT_COORD < 683 && VGA_VERT_COORD > 677) ||
                                    (VGA_VERT_COORD < 343 && VGA_VERT_COORD > 337))};
    wire Selector_top = {(VGA_HORZ_COORD < 1270) && (VGA_HORZ_COORD > 970) && ((VGA_VERT_COORD == 10) || (VGA_VERT_COORD == 330))} ||
                            {(VGA_VERT_COORD < 330) && (VGA_VERT_COORD > 10) && ((VGA_HORZ_COORD == 970) || (VGA_HORZ_COORD == 1270))};
    wire Selector_mid = {(VGA_HORZ_COORD < 1270) && (VGA_HORZ_COORD > 970) && ((VGA_VERT_COORD == 350) || (VGA_VERT_COORD == 670))} ||
                            {(VGA_VERT_COORD < 670) && (VGA_VERT_COORD > 350) && ((VGA_HORZ_COORD == 970) || (VGA_HORZ_COORD == 1270))};
    wire Selector_low = {(VGA_HORZ_COORD < 1270) && (VGA_HORZ_COORD > 970) && ((VGA_VERT_COORD == 690) || (VGA_VERT_COORD == 1010))} ||
                            {(VGA_VERT_COORD < 1010) && (VGA_VERT_COORD > 690) && ((VGA_HORZ_COORD == 970) || (VGA_HORZ_COORD == 1270))};
    wire Condition_For_Axis = (sw[2] || btn[3]) ? 0 : (VGA_HORZ_COORD == 480) || {(VGA_VERT_COORD == 512) && (VGA_HORZ_COORD < 960)};
    wire Condition_For_Ticks = (sw[2] || btn[3]) ? 0 : ((VGA_VERT_COORD % 8 == 0 && VGA_HORZ_COORD < 485 && VGA_HORZ_COORD > 475) ||
                                    (VGA_HORZ_COORD % 16 == 0 && VGA_HORZ_COORD < 960 && VGA_VERT_COORD < 517 && VGA_VERT_COORD > 507));
    
    wire Selector;               
    wire center;                 
    wire up;
    wire down;
    wire right;
    pushbutton btn1 (clk_20, btn[0], center);
    pushbutton btn2 (clk_20, btn[1], up);
    pushbutton btn3 (clk_20, btn[4], down);
    pushbutton btn4 (clk_20, btn[3], right);
    reg [1:0] selection = 1;
    reg [1:0] control = 0;
    reg [1:0] temp;
    
//    always @ (posedge center) begin
//        control = selection;
//    end
    
    always @ (posedge clk_20) begin
        case (selection)
        1: selection = down ? 2 : {up ? 3 : 1};
        2: selection = down ? 3 : {up ? 1 : 2};
        3: selection = down ? 1 : {up ? 2 : 3};
        default: selection = 1;
        endcase
        
        control = center ? selection : 0;
//        temp = control;
//        case (temp)
//        1: state = (state == 0) ? 1:
//                    {(state == 1) ? 0:
//                        {(state == 2) ? 1:
//                            {(state == 3) ? 1 : state}}};
//        2: state = (state == 0) ? 2:
//                    {(state == 1) ? 2:
//                        {(state == 2) ? 0:
//                            {(state == 3) ? 2 : state}}};
//        3: state = (state == 0) ? 3:
//                    {(state == 1) ? 3:
//                        {(state == 2) ? 3:
//                            {(state == 3) ? 0 : state}}};
//        default: state = state;
//        endcase

        case (state)
        0: begin
            state = (control == 1) ? 1 :
                    {(control == 2) ? 2 :
                        {(control == 3) ? 3 : state}};
            end
                        
        1: begin
            state = (control == 1) ? 0 :
                    {(control == 2) ? 2 :
                        {(control == 3) ? 3 : state}};
            end
                        
        2: begin
            state = (control == 1) ? 1 :
                    {(control == 2) ? 0 :
                        {(control == 3) ? 3 : state}};
            end
                        
        3: begin
            state = (control == 1) ? 1 :
                    {(control == 2) ? 2 :
                        {(control == 3) ? 0 : state}};
            end
        default: state = 0;
        endcase
    end
    assign Selector = btn[3] ? 0 : {(selection == 1) ? Selector_top :
                        {(selection == 2) ? Selector_mid :
                            {(selection == 3) ? Selector_low : 0}}};
//    assign control = center ? selection : 0;

    reg [3:0]background_color_red;
    reg [3:0]background_color_green;
    reg [3:0]background_color_blue;
    reg [3:0]red_color;
    reg [3:0]green_color;
    reg [3:0]blue_color;
    reg condition_red;
    reg condition_green;
    reg condition_blue;    
    always @ (*) begin
        case (sw[8:5])
                4'b0001: begin
                    background_color_red = 4'h5;
                    background_color_green = 4'h0;
                    background_color_blue = 4'h0;
                    red_color = 4'hD;
                    green_color = 4'hD;
                    blue_color = 4'hD;
                    condition_red = 0;
                    condition_green = (Condition_For_Axis || Condition_For_Ticks);
                    condition_blue = Condition_For_Grid;
                end
                5'b0010: begin
                    background_color_red = 4'h0;
                    background_color_green = 4'h5;
                    background_color_blue = 4'h0;
                    red_color = 4'hD;
                    green_color = 4'hD;
                    blue_color = 4'hD;
                    condition_red = 0;
                    condition_green = Condition_For_Grid;
                    condition_blue = (Condition_For_Axis || Condition_For_Ticks);    
                end 
                5'b0100: begin
                    background_color_red = 4'h0;
                    background_color_green = 4'h0;
                    background_color_blue = 4'h5;
                    red_color = 4'hD;
                    green_color = 4'hD;
                    blue_color = 4'hD;
                    condition_red = 0;
                    condition_green = (Condition_For_Axis || Condition_For_Ticks);
                    condition_blue = Condition_For_Grid;
                end
                5'b1000: begin
                    background_color_red = 4'h3;
                    background_color_green = 4'h3;
                    background_color_blue = 4'h3;
                    red_color = 4'hD;
                    green_color = 4'hD;
                    blue_color = 4'hD;
                    condition_red = 0;
                    condition_green = (Condition_For_Axis || Condition_For_Ticks);
                    condition_blue = Condition_For_Grid;
                end
                default: begin
                    background_color_red = 4'h0;
                    background_color_green = 4'h0;
                    background_color_blue = 4'h0;
                    red_color = 4'ha;
                    green_color = 4'hD;
                    blue_color = 4'ha;
                    condition_red = Condition_For_Grid;
                    condition_green = (Condition_For_Axis || Condition_For_Ticks || Condition_For_Grid);
                    condition_blue = Condition_For_Grid;
                end            
        endcase
    end
    
// Please modify below codes to change the background color and to display ticks defined above
    assign VGA_Red_Grid   = sw[9] ? 0 : 
                                {condition_red   ? red_color :
                                    {Selector ? 4'hf : background_color_red}} ;
    assign VGA_Green_Grid = sw[9] ? 0 : 
                                {condition_green ? green_color : background_color_green} ;
    assign VGA_Blue_Grid  = sw[9] ? 0 : 
                                {condition_blue  ? blue_color  : 
                                    {Condition_For_Partition ? 4'hf : background_color_blue}} ;
                            // if true, a red pixel is put at coordinates (VGA_HORZ_COORD, VGA_VERT_COORD), 
     
endmodule
