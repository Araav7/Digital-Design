`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2019 16:53:02
// Design Name: 
// Module Name: draw_ballon
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


module draw_balloon(
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    input [11:0] i,
    input [11:0] j,
    output balloon1_black,
    output balloon1_red,
    output balloon2_black,
    output balloon2_red,
    output balloon3_black,
    output balloon3_red,
    output balloon4_black,
    output balloon4_red
    );
    
    wire Condition_For_balloon1_black =
    ((VGA_VERT_COORD + 512 - i  >= 400 && VGA_VERT_COORD + 512 - i  < 405) && ((VGA_HORZ_COORD - 640 + j  >= 415 && VGA_HORZ_COORD - 640 + j  < 440))) ||
    ((VGA_VERT_COORD + 512 - i  >= 405 && VGA_VERT_COORD + 512 - i  < 410) && ((VGA_HORZ_COORD - 640 + j  >= 410 && VGA_HORZ_COORD - 640 + j  < 415) || (VGA_HORZ_COORD - 640 + j  >= 440 && VGA_HORZ_COORD - 640 + j  < 445))) ||
    ((VGA_VERT_COORD + 512 - i  >= 410 && VGA_VERT_COORD + 512 - i  < 415) && ((VGA_HORZ_COORD - 640 + j  >= 405 && VGA_HORZ_COORD - 640 + j  < 410) || (VGA_HORZ_COORD - 640 + j  >= 445 && VGA_HORZ_COORD - 640 + j  < 450))) ||
    ((VGA_VERT_COORD + 512 - i  >= 415 && VGA_VERT_COORD + 512 - i  < 420) && ((VGA_HORZ_COORD - 640 + j  >= 400 && VGA_HORZ_COORD - 640 + j  < 405) || (VGA_HORZ_COORD - 640 + j  >= 450 && VGA_HORZ_COORD - 640 + j  < 455))) ||
    ((VGA_VERT_COORD + 512 - i  >= 420 && VGA_VERT_COORD + 512 - i  < 425) && ((VGA_HORZ_COORD - 640 + j  >= 400 && VGA_HORZ_COORD - 640 + j  < 405) || (VGA_HORZ_COORD - 640 + j  >= 450 && VGA_HORZ_COORD - 640 + j  < 455))) ||
    ((VGA_VERT_COORD + 512 - i  >= 425 && VGA_VERT_COORD + 512 - i  < 430) && ((VGA_HORZ_COORD - 640 + j  >= 400 && VGA_HORZ_COORD - 640 + j  < 405) || (VGA_HORZ_COORD - 640 + j  >= 450 && VGA_HORZ_COORD - 640 + j  < 455))) ||
    ((VGA_VERT_COORD + 512 - i  >= 430 && VGA_VERT_COORD + 512 - i  < 435) && ((VGA_HORZ_COORD - 640 + j  >= 400 && VGA_HORZ_COORD - 640 + j  < 405) || (VGA_HORZ_COORD - 640 + j  >= 450 && VGA_HORZ_COORD - 640 + j  < 455))) ||
    ((VGA_VERT_COORD + 512 - i  >= 435 && VGA_VERT_COORD + 512 - i  < 440) && ((VGA_HORZ_COORD - 640 + j  >= 400 && VGA_HORZ_COORD - 640 + j  < 405) || (VGA_HORZ_COORD - 640 + j  >= 450 && VGA_HORZ_COORD - 640 + j  < 455))) ||
    ((VGA_VERT_COORD + 512 - i  >= 440 && VGA_VERT_COORD + 512 - i  < 445) && ((VGA_HORZ_COORD - 640 + j  >= 400 && VGA_HORZ_COORD - 640 + j  < 405) || (VGA_HORZ_COORD - 640 + j  >= 450 && VGA_HORZ_COORD - 640 + j  < 455))) ||
    ((VGA_VERT_COORD + 512 - i  >= 445 && VGA_VERT_COORD + 512 - i  < 450) && ((VGA_HORZ_COORD - 640 + j  >= 405 && VGA_HORZ_COORD - 640 + j  < 410) || (VGA_HORZ_COORD - 640 + j  >= 445 && VGA_HORZ_COORD - 640 + j  < 450))) ||
    ((VGA_VERT_COORD + 512 - i  >= 450 && VGA_VERT_COORD + 512 - i  < 455) && ((VGA_HORZ_COORD - 640 + j  >= 410 && VGA_HORZ_COORD - 640 + j  < 415) || (VGA_HORZ_COORD - 640 + j  >= 440 && VGA_HORZ_COORD - 640 + j  < 445))) ||
    ((VGA_VERT_COORD + 512 - i  >= 455 && VGA_VERT_COORD + 512 - i  < 460) && ((VGA_HORZ_COORD - 640 + j  >= 415 && VGA_HORZ_COORD - 640 + j  < 420) || (VGA_HORZ_COORD - 640 + j  >= 435 && VGA_HORZ_COORD - 640 + j  < 440))) ||
    ((VGA_VERT_COORD + 512 - i  >= 460 && VGA_VERT_COORD + 512 - i  < 465) && ((VGA_HORZ_COORD - 640 + j  >= 420 && VGA_HORZ_COORD - 640 + j  < 425) || (VGA_HORZ_COORD - 640 + j  >= 430 && VGA_HORZ_COORD - 640 + j  < 435))) ||
    ((VGA_VERT_COORD + 512 - i  >= 465 && VGA_VERT_COORD + 512 - i  < 470) && ((VGA_HORZ_COORD - 640 + j  >= 425 && VGA_HORZ_COORD - 640 + j  < 430))) ||
    ((VGA_VERT_COORD + 512 - i  >= 470 && VGA_VERT_COORD + 512 - i  < 475) && ((VGA_HORZ_COORD - 640 + j  >= 425 && VGA_HORZ_COORD - 640 + j  < 430))) ||
    ((VGA_VERT_COORD + 512 - i  >= 475 && VGA_VERT_COORD + 512 - i  < 480) && ((VGA_HORZ_COORD - 640 + j  >= 425 && VGA_HORZ_COORD - 640 + j  < 430))) ||
    ((VGA_VERT_COORD + 512 - i  >= 480 && VGA_VERT_COORD + 512 - i  < 485) && ((VGA_HORZ_COORD - 640 + j  >= 425 && VGA_HORZ_COORD - 640 + j  < 430))) ||
    ((VGA_VERT_COORD + 512 - i  >= 485 && VGA_VERT_COORD + 512 - i  < 490) && ((VGA_HORZ_COORD - 640 + j  >= 415 && VGA_HORZ_COORD - 640 + j  < 425))) ||
    ((VGA_VERT_COORD + 512 - i  >= 490 && VGA_VERT_COORD + 512 - i  < 495) && ((VGA_HORZ_COORD - 640 + j  >= 410 && VGA_HORZ_COORD - 640 + j  < 415))) ||
    ((VGA_VERT_COORD + 512 - i  >= 495 && VGA_VERT_COORD + 512 - i  < 500) && ((VGA_HORZ_COORD - 640 + j  >= 405 && VGA_HORZ_COORD - 640 + j  < 410)));
    
    wire Condition_For_balloon1_red =
    ((VGA_VERT_COORD + 512 - i  >= 405 && VGA_VERT_COORD + 512 - i  < 410) && ((VGA_HORZ_COORD - 640 + j  >= 415 && VGA_HORZ_COORD - 640 + j  < 440))) ||
    ((VGA_VERT_COORD + 512 - i  >= 410 && VGA_VERT_COORD + 512 - i  < 415) && ((VGA_HORZ_COORD - 640 + j  >= 410 && VGA_HORZ_COORD - 640 + j  < 445))) ||
    ((VGA_VERT_COORD + 512 - i  >= 415 && VGA_VERT_COORD + 512 - i  < 420) && ((VGA_HORZ_COORD - 640 + j  >= 405 && VGA_HORZ_COORD - 640 + j  < 450))) ||
    ((VGA_VERT_COORD + 512 - i  >= 420 && VGA_VERT_COORD + 512 - i  < 425) && ((VGA_HORZ_COORD - 640 + j  >= 405 && VGA_HORZ_COORD - 640 + j  < 450))) ||
    ((VGA_VERT_COORD + 512 - i  >= 425 && VGA_VERT_COORD + 512 - i  < 430) && ((VGA_HORZ_COORD - 640 + j  >= 405 && VGA_HORZ_COORD - 640 + j  < 450))) ||
    ((VGA_VERT_COORD + 512 - i  >= 430 && VGA_VERT_COORD + 512 - i  < 435) && ((VGA_HORZ_COORD - 640 + j  >= 405 && VGA_HORZ_COORD - 640 + j  < 450))) ||
    ((VGA_VERT_COORD + 512 - i  >= 435 && VGA_VERT_COORD + 512 - i  < 440) && ((VGA_HORZ_COORD - 640 + j  >= 405 && VGA_HORZ_COORD - 640 + j  < 450))) ||
    ((VGA_VERT_COORD + 512 - i  >= 440 && VGA_VERT_COORD + 512 - i  < 445) && ((VGA_HORZ_COORD - 640 + j  >= 405 && VGA_HORZ_COORD - 640 + j  < 450))) ||
    ((VGA_VERT_COORD + 512 - i  >= 445 && VGA_VERT_COORD + 512 - i  < 450) && ((VGA_HORZ_COORD - 640 + j  >= 410 && VGA_HORZ_COORD - 640 + j  < 445))) ||
    ((VGA_VERT_COORD + 512 - i  >= 450 && VGA_VERT_COORD + 512 - i  < 455) && ((VGA_HORZ_COORD - 640 + j  >= 415 && VGA_HORZ_COORD - 640 + j  < 440))) ||
    ((VGA_VERT_COORD + 512 - i  >= 455 && VGA_VERT_COORD + 512 - i  < 460) && ((VGA_HORZ_COORD - 640 + j  >= 420 && VGA_HORZ_COORD - 640 + j  < 435))) ||
    ((VGA_VERT_COORD + 512 - i  >= 460 && VGA_VERT_COORD + 512 - i  < 465) && ((VGA_HORZ_COORD - 640 + j  >= 425 && VGA_HORZ_COORD - 640 + j  < 430)));
    
    wire Condition_For_balloon2_black =
    ((VGA_VERT_COORD + 512 - i  >= 600 && VGA_VERT_COORD + 512 - i  < 605) && ((VGA_HORZ_COORD - 640 + j  >= 815 && VGA_HORZ_COORD - 640 + j  < 840))) ||
    ((VGA_VERT_COORD + 512 - i  >= 605 && VGA_VERT_COORD + 512 - i  < 610) && ((VGA_HORZ_COORD - 640 + j  >= 810 && VGA_HORZ_COORD - 640 + j  < 815) || (VGA_HORZ_COORD - 640 + j  >= 840 && VGA_HORZ_COORD - 640 + j  < 845))) ||
    ((VGA_VERT_COORD + 512 - i  >= 610 && VGA_VERT_COORD + 512 - i  < 615) && ((VGA_HORZ_COORD - 640 + j  >= 805 && VGA_HORZ_COORD - 640 + j  < 810) || (VGA_HORZ_COORD - 640 + j  >= 845 && VGA_HORZ_COORD - 640 + j  < 850))) ||
    ((VGA_VERT_COORD + 512 - i  >= 615 && VGA_VERT_COORD + 512 - i  < 620) && ((VGA_HORZ_COORD - 640 + j  >= 800 && VGA_HORZ_COORD - 640 + j  < 805) || (VGA_HORZ_COORD - 640 + j  >= 850 && VGA_HORZ_COORD - 640 + j  < 855))) ||
    ((VGA_VERT_COORD + 512 - i  >= 620 && VGA_VERT_COORD + 512 - i  < 625) && ((VGA_HORZ_COORD - 640 + j  >= 800 && VGA_HORZ_COORD - 640 + j  < 805) || (VGA_HORZ_COORD - 640 + j  >= 850 && VGA_HORZ_COORD - 640 + j  < 855))) ||
    ((VGA_VERT_COORD + 512 - i  >= 625 && VGA_VERT_COORD + 512 - i  < 630) && ((VGA_HORZ_COORD - 640 + j  >= 800 && VGA_HORZ_COORD - 640 + j  < 805) || (VGA_HORZ_COORD - 640 + j  >= 850 && VGA_HORZ_COORD - 640 + j  < 855))) ||
    ((VGA_VERT_COORD + 512 - i  >= 630 && VGA_VERT_COORD + 512 - i  < 635) && ((VGA_HORZ_COORD - 640 + j  >= 800 && VGA_HORZ_COORD - 640 + j  < 805) || (VGA_HORZ_COORD - 640 + j  >= 850 && VGA_HORZ_COORD - 640 + j  < 855))) ||
    ((VGA_VERT_COORD + 512 - i  >= 635 && VGA_VERT_COORD + 512 - i  < 640) && ((VGA_HORZ_COORD - 640 + j  >= 800 && VGA_HORZ_COORD - 640 + j  < 805) || (VGA_HORZ_COORD - 640 + j  >= 850 && VGA_HORZ_COORD - 640 + j  < 855))) ||
    ((VGA_VERT_COORD + 512 - i  >= 640 && VGA_VERT_COORD + 512 - i  < 645) && ((VGA_HORZ_COORD - 640 + j  >= 800 && VGA_HORZ_COORD - 640 + j  < 805) || (VGA_HORZ_COORD - 640 + j  >= 850 && VGA_HORZ_COORD - 640 + j  < 855))) ||
    ((VGA_VERT_COORD + 512 - i  >= 645 && VGA_VERT_COORD + 512 - i  < 650) && ((VGA_HORZ_COORD - 640 + j  >= 805 && VGA_HORZ_COORD - 640 + j  < 810) || (VGA_HORZ_COORD - 640 + j  >= 845 && VGA_HORZ_COORD - 640 + j  < 850))) ||
    ((VGA_VERT_COORD + 512 - i  >= 650 && VGA_VERT_COORD + 512 - i  < 655) && ((VGA_HORZ_COORD - 640 + j  >= 810 && VGA_HORZ_COORD - 640 + j  < 815) || (VGA_HORZ_COORD - 640 + j  >= 840 && VGA_HORZ_COORD - 640 + j  < 845))) ||
    ((VGA_VERT_COORD + 512 - i  >= 655 && VGA_VERT_COORD + 512 - i  < 660) && ((VGA_HORZ_COORD - 640 + j  >= 815 && VGA_HORZ_COORD - 640 + j  < 820) || (VGA_HORZ_COORD - 640 + j  >= 835 && VGA_HORZ_COORD - 640 + j  < 840))) ||
    ((VGA_VERT_COORD + 512 - i  >= 660 && VGA_VERT_COORD + 512 - i  < 665) && ((VGA_HORZ_COORD - 640 + j  >= 820 && VGA_HORZ_COORD - 640 + j  < 825) || (VGA_HORZ_COORD - 640 + j  >= 830 && VGA_HORZ_COORD - 640 + j  < 835))) ||
    ((VGA_VERT_COORD + 512 - i  >= 665 && VGA_VERT_COORD + 512 - i  < 670) && ((VGA_HORZ_COORD - 640 + j  >= 825 && VGA_HORZ_COORD - 640 + j  < 830))) ||
    ((VGA_VERT_COORD + 512 - i  >= 670 && VGA_VERT_COORD + 512 - i  < 675) && ((VGA_HORZ_COORD - 640 + j  >= 825 && VGA_HORZ_COORD - 640 + j  < 830))) ||
    ((VGA_VERT_COORD + 512 - i  >= 675 && VGA_VERT_COORD + 512 - i  < 680) && ((VGA_HORZ_COORD - 640 + j  >= 825 && VGA_HORZ_COORD - 640 + j  < 830))) ||
    ((VGA_VERT_COORD + 512 - i  >= 680 && VGA_VERT_COORD + 512 - i  < 685) && ((VGA_HORZ_COORD - 640 + j  >= 825 && VGA_HORZ_COORD - 640 + j  < 830))) ||
    ((VGA_VERT_COORD + 512 - i  >= 685 && VGA_VERT_COORD + 512 - i  < 690) && ((VGA_HORZ_COORD - 640 + j  >= 815 && VGA_HORZ_COORD - 640 + j  < 825))) ||
    ((VGA_VERT_COORD + 512 - i  >= 690 && VGA_VERT_COORD + 512 - i  < 695) && ((VGA_HORZ_COORD - 640 + j  >= 810 && VGA_HORZ_COORD - 640 + j  < 815))) ||
    ((VGA_VERT_COORD + 512 - i  >= 695 && VGA_VERT_COORD + 512 - i  < 700) && ((VGA_HORZ_COORD - 640 + j  >= 805 && VGA_HORZ_COORD - 640 + j  < 810)));
    
    wire Condition_For_balloon2_red =
    ((VGA_VERT_COORD + 512 - i  >= 605 && VGA_VERT_COORD + 512 - i  < 610) && ((VGA_HORZ_COORD - 640 + j  >= 815 && VGA_HORZ_COORD - 640 + j  < 840))) ||
    ((VGA_VERT_COORD + 512 - i  >= 610 && VGA_VERT_COORD + 512 - i  < 615) && ((VGA_HORZ_COORD - 640 + j  >= 810 && VGA_HORZ_COORD - 640 + j  < 845))) ||
    ((VGA_VERT_COORD + 512 - i  >= 615 && VGA_VERT_COORD + 512 - i  < 620) && ((VGA_HORZ_COORD - 640 + j  >= 805 && VGA_HORZ_COORD - 640 + j  < 850))) ||
    ((VGA_VERT_COORD + 512 - i  >= 620 && VGA_VERT_COORD + 512 - i  < 625) && ((VGA_HORZ_COORD - 640 + j  >= 805 && VGA_HORZ_COORD - 640 + j  < 850))) ||
    ((VGA_VERT_COORD + 512 - i  >= 625 && VGA_VERT_COORD + 512 - i  < 630) && ((VGA_HORZ_COORD - 640 + j  >= 805 && VGA_HORZ_COORD - 640 + j  < 850))) ||
    ((VGA_VERT_COORD + 512 - i  >= 630 && VGA_VERT_COORD + 512 - i  < 635) && ((VGA_HORZ_COORD - 640 + j  >= 805 && VGA_HORZ_COORD - 640 + j  < 850))) ||
    ((VGA_VERT_COORD + 512 - i  >= 635 && VGA_VERT_COORD + 512 - i  < 640) && ((VGA_HORZ_COORD - 640 + j  >= 805 && VGA_HORZ_COORD - 640 + j  < 850))) ||
    ((VGA_VERT_COORD + 512 - i  >= 640 && VGA_VERT_COORD + 512 - i  < 645) && ((VGA_HORZ_COORD - 640 + j  >= 805 && VGA_HORZ_COORD - 640 + j  < 850))) ||
    ((VGA_VERT_COORD + 512 - i  >= 645 && VGA_VERT_COORD + 512 - i  < 650) && ((VGA_HORZ_COORD - 640 + j  >= 810 && VGA_HORZ_COORD - 640 + j  < 845))) ||
    ((VGA_VERT_COORD + 512 - i  >= 650 && VGA_VERT_COORD + 512 - i  < 655) && ((VGA_HORZ_COORD - 640 + j  >= 815 && VGA_HORZ_COORD - 640 + j  < 840))) ||
    ((VGA_VERT_COORD + 512 - i  >= 655 && VGA_VERT_COORD + 512 - i  < 660) && ((VGA_HORZ_COORD - 640 + j  >= 820 && VGA_HORZ_COORD - 640 + j  < 835))) ||
    ((VGA_VERT_COORD + 512 - i  >= 660 && VGA_VERT_COORD + 512 - i  < 665) && ((VGA_HORZ_COORD - 640 + j  >= 825 && VGA_HORZ_COORD - 640 + j  < 830)));
    
    
    wire Condition_For_balloon3_black =
    ((VGA_VERT_COORD + 512 - i >= 250 && VGA_VERT_COORD + 512 - i < 255) && ((VGA_HORZ_COORD - 640 + j >= 1015 && VGA_HORZ_COORD - 640 + j < 1040))) ||
    ((VGA_VERT_COORD + 512 - i >= 255 && VGA_VERT_COORD + 512 - i < 260) && ((VGA_HORZ_COORD - 640 + j >= 1010 && VGA_HORZ_COORD - 640 + j < 1015) || (VGA_HORZ_COORD - 640 + j >= 1040 && VGA_HORZ_COORD - 640 + j < 1045))) ||
    ((VGA_VERT_COORD + 512 - i >= 260 && VGA_VERT_COORD + 512 - i < 265) && ((VGA_HORZ_COORD - 640 + j >= 1005 && VGA_HORZ_COORD - 640 + j < 1010) || (VGA_HORZ_COORD - 640 + j >= 1045 && VGA_HORZ_COORD - 640 + j < 1050))) ||
    ((VGA_VERT_COORD + 512 - i >= 265 && VGA_VERT_COORD + 512 - i < 270) && ((VGA_HORZ_COORD - 640 + j >= 1000 && VGA_HORZ_COORD - 640 + j < 1005) || (VGA_HORZ_COORD - 640 + j >= 1050 && VGA_HORZ_COORD - 640 + j < 1055))) ||
    ((VGA_VERT_COORD + 512 - i >= 270 && VGA_VERT_COORD + 512 - i < 275) && ((VGA_HORZ_COORD - 640 + j >= 1000 && VGA_HORZ_COORD - 640 + j < 1005) || (VGA_HORZ_COORD - 640 + j >= 1050 && VGA_HORZ_COORD - 640 + j < 1055))) ||
    ((VGA_VERT_COORD + 512 - i >= 275 && VGA_VERT_COORD + 512 - i < 280) && ((VGA_HORZ_COORD - 640 + j >= 1000 && VGA_HORZ_COORD - 640 + j < 1005) || (VGA_HORZ_COORD - 640 + j >= 1050 && VGA_HORZ_COORD - 640 + j < 1055))) ||
    ((VGA_VERT_COORD + 512 - i >= 280 && VGA_VERT_COORD + 512 - i < 285) && ((VGA_HORZ_COORD - 640 + j >= 1000 && VGA_HORZ_COORD - 640 + j < 1005) || (VGA_HORZ_COORD - 640 + j >= 1050 && VGA_HORZ_COORD - 640 + j < 1055))) ||
    ((VGA_VERT_COORD + 512 - i >= 285 && VGA_VERT_COORD + 512 - i < 290) && ((VGA_HORZ_COORD - 640 + j >= 1000 && VGA_HORZ_COORD - 640 + j < 1005) || (VGA_HORZ_COORD - 640 + j >= 1050 && VGA_HORZ_COORD - 640 + j < 1055))) ||
    ((VGA_VERT_COORD + 512 - i >= 290 && VGA_VERT_COORD + 512 - i < 295) && ((VGA_HORZ_COORD - 640 + j >= 1000 && VGA_HORZ_COORD - 640 + j < 1005) || (VGA_HORZ_COORD - 640 + j >= 1050 && VGA_HORZ_COORD - 640 + j < 1055))) ||
    ((VGA_VERT_COORD + 512 - i >= 295 && VGA_VERT_COORD + 512 - i < 300) && ((VGA_HORZ_COORD - 640 + j >= 1005 && VGA_HORZ_COORD - 640 + j < 1010) || (VGA_HORZ_COORD - 640 + j >= 1045 && VGA_HORZ_COORD - 640 + j < 1050))) ||
    ((VGA_VERT_COORD + 512 - i >= 300 && VGA_VERT_COORD + 512 - i < 305) && ((VGA_HORZ_COORD - 640 + j >= 1010 && VGA_HORZ_COORD - 640 + j < 1015) || (VGA_HORZ_COORD - 640 + j >= 1040 && VGA_HORZ_COORD - 640 + j < 1045))) ||
    ((VGA_VERT_COORD + 512 - i >= 305 && VGA_VERT_COORD + 512 - i < 310) && ((VGA_HORZ_COORD - 640 + j >= 1015 && VGA_HORZ_COORD - 640 + j < 1020) || (VGA_HORZ_COORD - 640 + j >= 1035 && VGA_HORZ_COORD - 640 + j < 1040))) ||
    ((VGA_VERT_COORD + 512 - i >= 310 && VGA_VERT_COORD + 512 - i < 315) && ((VGA_HORZ_COORD - 640 + j >= 1020 && VGA_HORZ_COORD - 640 + j < 1025) || (VGA_HORZ_COORD - 640 + j >= 1030 && VGA_HORZ_COORD - 640 + j < 1035))) ||
    ((VGA_VERT_COORD + 512 - i >= 315 && VGA_VERT_COORD + 512 - i < 320) && ((VGA_HORZ_COORD - 640 + j >= 1025 && VGA_HORZ_COORD - 640 + j < 1030))) ||
    ((VGA_VERT_COORD + 512 - i >= 320 && VGA_VERT_COORD + 512 - i < 325) && ((VGA_HORZ_COORD - 640 + j >= 1025 && VGA_HORZ_COORD - 640 + j < 1030))) ||
    ((VGA_VERT_COORD + 512 - i >= 325 && VGA_VERT_COORD + 512 - i < 330) && ((VGA_HORZ_COORD - 640 + j >= 1025 && VGA_HORZ_COORD - 640 + j < 1030))) ||
    ((VGA_VERT_COORD + 512 - i >= 330 && VGA_VERT_COORD + 512 - i < 335) && ((VGA_HORZ_COORD - 640 + j >= 1025 && VGA_HORZ_COORD - 640 + j < 1030))) ||
    ((VGA_VERT_COORD + 512 - i >= 335 && VGA_VERT_COORD + 512 - i < 340) && ((VGA_HORZ_COORD - 640 + j >= 1015 && VGA_HORZ_COORD - 640 + j < 1025))) ||
    ((VGA_VERT_COORD + 512 - i >= 340 && VGA_VERT_COORD + 512 - i < 345) && ((VGA_HORZ_COORD - 640 + j >= 1010 && VGA_HORZ_COORD - 640 + j < 1015))) ||
    ((VGA_VERT_COORD + 512 - i >= 345 && VGA_VERT_COORD + 512 - i < 350) && ((VGA_HORZ_COORD - 640 + j >= 1005 && VGA_HORZ_COORD - 640 + j < 1010)));
    
    wire Condition_For_balloon3_red =
    ((VGA_VERT_COORD + 512 - i >= 205 && VGA_VERT_COORD + 512 - i < 110) && ((VGA_HORZ_COORD - 640 + j >= 1015 && VGA_HORZ_COORD - 640 + j < 1040))) ||
    ((VGA_VERT_COORD + 512 - i >= 210 && VGA_VERT_COORD + 512 - i < 115) && ((VGA_HORZ_COORD - 640 + j >= 1010 && VGA_HORZ_COORD - 640 + j < 1045))) ||
    ((VGA_VERT_COORD + 512 - i >= 215 && VGA_VERT_COORD + 512 - i < 120) && ((VGA_HORZ_COORD - 640 + j >= 1005 && VGA_HORZ_COORD - 640 + j < 1050))) ||
    ((VGA_VERT_COORD + 512 - i >= 220 && VGA_VERT_COORD + 512 - i < 125) && ((VGA_HORZ_COORD - 640 + j >= 1005 && VGA_HORZ_COORD - 640 + j < 1050))) ||
    ((VGA_VERT_COORD + 512 - i >= 225 && VGA_VERT_COORD + 512 - i < 130) && ((VGA_HORZ_COORD - 640 + j >= 1005 && VGA_HORZ_COORD - 640 + j < 1050))) ||
    ((VGA_VERT_COORD + 512 - i >= 230 && VGA_VERT_COORD + 512 - i < 135) && ((VGA_HORZ_COORD - 640 + j >= 1005 && VGA_HORZ_COORD - 640 + j < 1050))) ||
    ((VGA_VERT_COORD + 512 - i >= 235 && VGA_VERT_COORD + 512 - i < 140) && ((VGA_HORZ_COORD - 640 + j >= 1005 && VGA_HORZ_COORD - 640 + j < 1050))) ||
    ((VGA_VERT_COORD + 512 - i >= 240 && VGA_VERT_COORD + 512 - i < 145) && ((VGA_HORZ_COORD - 640 + j >= 1005 && VGA_HORZ_COORD - 640 + j < 1050))) ||
    ((VGA_VERT_COORD + 512 - i >= 245 && VGA_VERT_COORD + 512 - i < 150) && ((VGA_HORZ_COORD - 640 + j >= 1010 && VGA_HORZ_COORD - 640 + j < 1045))) ||
    ((VGA_VERT_COORD + 512 - i >= 250 && VGA_VERT_COORD + 512 - i < 155) && ((VGA_HORZ_COORD - 640 + j >= 1015 && VGA_HORZ_COORD - 640 + j < 1040))) ||
    ((VGA_VERT_COORD + 512 - i >= 255 && VGA_VERT_COORD + 512 - i < 160) && ((VGA_HORZ_COORD - 640 + j >= 1020 && VGA_HORZ_COORD - 640 + j < 1035))) ||
    ((VGA_VERT_COORD + 512 - i >= 260 && VGA_VERT_COORD + 512 - i < 165) && ((VGA_HORZ_COORD - 640 + j >= 1025 && VGA_HORZ_COORD - 640 + j < 1030)));
    
    wire Condition_For_balloon4_black =
    ((VGA_VERT_COORD + 512 - i >= 800 && VGA_VERT_COORD + 512 - i < 805) && ((VGA_HORZ_COORD - 640 + j >= 315 && VGA_HORZ_COORD - 640 + j < 340))) ||
    ((VGA_VERT_COORD + 512 - i >= 805 && VGA_VERT_COORD + 512 - i < 810) && ((VGA_HORZ_COORD - 640 + j >= 310 && VGA_HORZ_COORD - 640 + j < 315) || (VGA_HORZ_COORD - 640 + j >= 340 && VGA_HORZ_COORD - 640 + j < 345))) ||
    ((VGA_VERT_COORD + 512 - i >= 810 && VGA_VERT_COORD + 512 - i < 815) && ((VGA_HORZ_COORD - 640 + j >= 305 && VGA_HORZ_COORD - 640 + j < 310) || (VGA_HORZ_COORD - 640 + j >= 345 && VGA_HORZ_COORD - 640 + j < 350))) ||
    ((VGA_VERT_COORD + 512 - i >= 815 && VGA_VERT_COORD + 512 - i < 820) && ((VGA_HORZ_COORD - 640 + j >= 300 && VGA_HORZ_COORD - 640 + j < 305) || (VGA_HORZ_COORD - 640 + j >= 350 && VGA_HORZ_COORD - 640 + j < 355))) ||
    ((VGA_VERT_COORD + 512 - i >= 820 && VGA_VERT_COORD + 512 - i < 825) && ((VGA_HORZ_COORD - 640 + j >= 300 && VGA_HORZ_COORD - 640 + j < 305) || (VGA_HORZ_COORD - 640 + j >= 350 && VGA_HORZ_COORD - 640 + j < 355))) ||
    ((VGA_VERT_COORD + 512 - i >= 825 && VGA_VERT_COORD + 512 - i < 830) && ((VGA_HORZ_COORD - 640 + j >= 300 && VGA_HORZ_COORD - 640 + j < 305) || (VGA_HORZ_COORD - 640 + j >= 350 && VGA_HORZ_COORD - 640 + j < 355))) ||
    ((VGA_VERT_COORD + 512 - i >= 830 && VGA_VERT_COORD + 512 - i < 835) && ((VGA_HORZ_COORD - 640 + j >= 300 && VGA_HORZ_COORD - 640 + j < 305) || (VGA_HORZ_COORD - 640 + j >= 350 && VGA_HORZ_COORD - 640 + j < 355))) ||
    ((VGA_VERT_COORD + 512 - i >= 835 && VGA_VERT_COORD + 512 - i < 840) && ((VGA_HORZ_COORD - 640 + j >= 300 && VGA_HORZ_COORD - 640 + j < 305) || (VGA_HORZ_COORD - 640 + j >= 350 && VGA_HORZ_COORD - 640 + j < 355))) ||
    ((VGA_VERT_COORD + 512 - i >= 840 && VGA_VERT_COORD + 512 - i < 845) && ((VGA_HORZ_COORD - 640 + j >= 300 && VGA_HORZ_COORD - 640 + j < 305) || (VGA_HORZ_COORD - 640 + j >= 350 && VGA_HORZ_COORD - 640 + j < 355))) ||
    ((VGA_VERT_COORD + 512 - i >= 845 && VGA_VERT_COORD + 512 - i < 850) && ((VGA_HORZ_COORD - 640 + j >= 305 && VGA_HORZ_COORD - 640 + j < 310) || (VGA_HORZ_COORD - 640 + j >= 345 && VGA_HORZ_COORD - 640 + j < 350))) ||
    ((VGA_VERT_COORD + 512 - i >= 850 && VGA_VERT_COORD + 512 - i < 855) && ((VGA_HORZ_COORD - 640 + j >= 310 && VGA_HORZ_COORD - 640 + j < 315) || (VGA_HORZ_COORD - 640 + j >= 340 && VGA_HORZ_COORD - 640 + j < 345))) ||
    ((VGA_VERT_COORD + 512 - i >= 855 && VGA_VERT_COORD + 512 - i < 860) && ((VGA_HORZ_COORD - 640 + j >= 315 && VGA_HORZ_COORD - 640 + j < 320) || (VGA_HORZ_COORD - 640 + j >= 335 && VGA_HORZ_COORD - 640 + j < 340))) ||
    ((VGA_VERT_COORD + 512 - i >= 860 && VGA_VERT_COORD + 512 - i < 865) && ((VGA_HORZ_COORD - 640 + j >= 320 && VGA_HORZ_COORD - 640 + j < 325) || (VGA_HORZ_COORD - 640 + j >= 330 && VGA_HORZ_COORD - 640 + j < 335))) ||
    ((VGA_VERT_COORD + 512 - i >= 865 && VGA_VERT_COORD + 512 - i < 870) && ((VGA_HORZ_COORD - 640 + j >= 325 && VGA_HORZ_COORD - 640 + j < 330))) ||
    ((VGA_VERT_COORD + 512 - i >= 870 && VGA_VERT_COORD + 512 - i < 875) && ((VGA_HORZ_COORD - 640 + j >= 325 && VGA_HORZ_COORD - 640 + j < 330))) ||
    ((VGA_VERT_COORD + 512 - i >= 875 && VGA_VERT_COORD + 512 - i < 880) && ((VGA_HORZ_COORD - 640 + j >= 325 && VGA_HORZ_COORD - 640 + j < 330))) ||
    ((VGA_VERT_COORD + 512 - i >= 880 && VGA_VERT_COORD + 512 - i < 885) && ((VGA_HORZ_COORD - 640 + j >= 325 && VGA_HORZ_COORD - 640 + j < 330))) ||
    ((VGA_VERT_COORD + 512 - i >= 885 && VGA_VERT_COORD + 512 - i < 890) && ((VGA_HORZ_COORD - 640 + j >= 315 && VGA_HORZ_COORD - 640 + j < 325))) ||
    ((VGA_VERT_COORD + 512 - i >= 890 && VGA_VERT_COORD + 512 - i < 895) && ((VGA_HORZ_COORD - 640 + j >= 310 && VGA_HORZ_COORD - 640 + j < 315))) ||
    ((VGA_VERT_COORD + 512 - i >= 895 && VGA_VERT_COORD + 512 - i < 900) && ((VGA_HORZ_COORD - 640 + j >= 305 && VGA_HORZ_COORD - 640 + j < 310)));
    
    wire Condition_For_balloon4_red =
    ((VGA_VERT_COORD + 512 - i >= 805 && VGA_VERT_COORD + 512 - i < 810) && ((VGA_HORZ_COORD - 640 + j >= 315 && VGA_HORZ_COORD - 640 + j < 340))) ||
    ((VGA_VERT_COORD + 512 - i >= 810 && VGA_VERT_COORD + 512 - i < 815) && ((VGA_HORZ_COORD - 640 + j >= 310 && VGA_HORZ_COORD - 640 + j < 345))) ||
    ((VGA_VERT_COORD + 512 - i >= 815 && VGA_VERT_COORD + 512 - i < 820) && ((VGA_HORZ_COORD - 640 + j >= 305 && VGA_HORZ_COORD - 640 + j < 350))) ||
    ((VGA_VERT_COORD + 512 - i >= 820 && VGA_VERT_COORD + 512 - i < 825) && ((VGA_HORZ_COORD - 640 + j >= 305 && VGA_HORZ_COORD - 640 + j < 350))) ||
    ((VGA_VERT_COORD + 512 - i >= 825 && VGA_VERT_COORD + 512 - i < 830) && ((VGA_HORZ_COORD - 640 + j >= 305 && VGA_HORZ_COORD - 640 + j < 350))) ||
    ((VGA_VERT_COORD + 512 - i >= 830 && VGA_VERT_COORD + 512 - i < 835) && ((VGA_HORZ_COORD - 640 + j >= 305 && VGA_HORZ_COORD - 640 + j < 350))) ||
    ((VGA_VERT_COORD + 512 - i >= 835 && VGA_VERT_COORD + 512 - i < 840) && ((VGA_HORZ_COORD - 640 + j >= 305 && VGA_HORZ_COORD - 640 + j < 350))) ||
    ((VGA_VERT_COORD + 512 - i >= 840 && VGA_VERT_COORD + 512 - i < 845) && ((VGA_HORZ_COORD - 640 + j >= 305 && VGA_HORZ_COORD - 640 + j < 350))) ||
    ((VGA_VERT_COORD + 512 - i >= 845 && VGA_VERT_COORD + 512 - i < 850) && ((VGA_HORZ_COORD - 640 + j >= 310 && VGA_HORZ_COORD - 640 + j < 345))) ||
    ((VGA_VERT_COORD + 512 - i >= 850 && VGA_VERT_COORD + 512 - i < 855) && ((VGA_HORZ_COORD - 640 + j >= 315 && VGA_HORZ_COORD - 640 + j < 340))) ||
    ((VGA_VERT_COORD + 512 - i >= 855 && VGA_VERT_COORD + 512 - i < 860) && ((VGA_HORZ_COORD - 640 + j >= 320 && VGA_HORZ_COORD - 640 + j < 335))) ||
    ((VGA_VERT_COORD + 512 - i >= 860 && VGA_VERT_COORD + 512 - i < 865) && ((VGA_HORZ_COORD - 640 + j >= 325 && VGA_HORZ_COORD - 640 + j < 330)));
    
    assign balloon1_black = Condition_For_balloon1_black;
    assign balloon1_red = Condition_For_balloon1_red;
    assign balloon2_black = Condition_For_balloon2_black;
    assign balloon2_red = Condition_For_balloon2_red;
    assign balloon3_black = Condition_For_balloon3_black;
    assign balloon3_red = Condition_For_balloon3_red;
    assign balloon4_black = Condition_For_balloon4_black;
    assign balloon4_red = Condition_For_balloon4_red;
    
endmodule
