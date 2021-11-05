`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2019 22:18:56
// Design Name: 
// Module Name: no_music
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


module no_music(    input [11:0] VGA_HORZ_COORD,    input [11:0] VGA_VERT_COORD, input clk_256,    output life    );

reg [9:0]count = 0;

always @ (posedge clk_256) begin
    count = count + 1;
end

//wire condition = 
assign life =
            // N
            {(VGA_HORZ_COORD + 40 > 220) && (VGA_HORZ_COORD + 40 < 226) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 225) && (VGA_HORZ_COORD + 40 < 231) && (VGA_VERT_COORD < 480) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 230) && (VGA_HORZ_COORD + 40 < 236) && (VGA_VERT_COORD < 485) && (VGA_VERT_COORD > 469)} ||
            {(VGA_HORZ_COORD + 40 > 235) && (VGA_HORZ_COORD + 40 < 241) && (VGA_VERT_COORD < 490) && (VGA_VERT_COORD > 474)} ||
            {(VGA_HORZ_COORD + 40 > 240) && (VGA_HORZ_COORD + 40 < 246) && (VGA_VERT_COORD < 495) && (VGA_VERT_COORD > 479)} ||
            {(VGA_HORZ_COORD + 40 > 245) && (VGA_HORZ_COORD + 40 < 251) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            // O
            {(VGA_HORZ_COORD + 40 > 260) && (VGA_HORZ_COORD + 40 < 266) && (VGA_VERT_COORD < 495) && (VGA_VERT_COORD > 469)} ||
            {(VGA_HORZ_COORD + 40 > 265) && (VGA_HORZ_COORD + 40 < 271) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 270) && (VGA_HORZ_COORD + 40 < 276) && {{(VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} || {(VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)}}} ||
            {(VGA_HORZ_COORD + 40 > 275) && (VGA_HORZ_COORD + 40 < 281) && {{(VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} || {(VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)}}} ||
            {(VGA_HORZ_COORD + 40 > 280) && (VGA_HORZ_COORD + 40 < 286) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 285) && (VGA_HORZ_COORD + 40 < 291) && (VGA_VERT_COORD < 495) && (VGA_VERT_COORD > 469)} ||
            // M
            {(VGA_HORZ_COORD + 40 > 320) && (VGA_HORZ_COORD + 40 < 326) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 325) && (VGA_HORZ_COORD + 40 < 331) && (VGA_VERT_COORD < 485) && (VGA_VERT_COORD > 469)} ||
            {(VGA_HORZ_COORD + 40 > 330) && (VGA_HORZ_COORD + 40 < 336) && (VGA_VERT_COORD < 490) && (VGA_VERT_COORD > 474)} ||
            {(VGA_HORZ_COORD + 40 > 335) && (VGA_HORZ_COORD + 40 < 341) && (VGA_VERT_COORD < 485) && (VGA_VERT_COORD > 469)} ||
            {(VGA_HORZ_COORD + 40 > 340) && (VGA_HORZ_COORD + 40 < 346) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 345) && (VGA_HORZ_COORD + 40 < 351) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            // U
            {(VGA_HORZ_COORD + 40 > 360) && (VGA_HORZ_COORD + 40 < 366) && (VGA_VERT_COORD < 495) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 365) && (VGA_HORZ_COORD + 40 < 371) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 370) && (VGA_HORZ_COORD + 40 < 376) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} ||
            {(VGA_HORZ_COORD + 40 > 375) && (VGA_HORZ_COORD + 40 < 381) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} ||
            {(VGA_HORZ_COORD + 40 > 380) && (VGA_HORZ_COORD + 40 < 386) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 385) && (VGA_HORZ_COORD + 40 < 391) && (VGA_VERT_COORD < 495) && (VGA_VERT_COORD > 464)} ||
            // S
            {(VGA_HORZ_COORD + 40 > 400) && (VGA_HORZ_COORD + 40 < 406) && {{(VGA_VERT_COORD < 495) && (VGA_VERT_COORD > 489)} || {(VGA_VERT_COORD < 480) && (VGA_VERT_COORD > 469)}}} ||
            {(VGA_HORZ_COORD + 40 > 405) && (VGA_HORZ_COORD + 40 < 411) && {{(VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 489)} || {(VGA_VERT_COORD < 485) && (VGA_VERT_COORD > 464)}}} ||
            {(VGA_HORZ_COORD + 40 > 410) && (VGA_HORZ_COORD + 40 < 416) && {{(VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} || {(VGA_VERT_COORD < 485) && (VGA_VERT_COORD > 479)} || {(VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)}}} ||
            {(VGA_HORZ_COORD + 40 > 415) && (VGA_HORZ_COORD + 40 < 421) && {{(VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} || {(VGA_VERT_COORD < 485) && (VGA_VERT_COORD > 479)} || {(VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)}}}||
            {(VGA_HORZ_COORD + 40 > 420) && (VGA_HORZ_COORD + 40 < 426) && {{(VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 479)} || {(VGA_VERT_COORD < 475) && (VGA_VERT_COORD > 464)}}} ||
            {(VGA_HORZ_COORD + 40 > 425) && (VGA_HORZ_COORD + 40 < 431) && {{(VGA_VERT_COORD < 495) && (VGA_VERT_COORD > 484)} || {(VGA_VERT_COORD < 475) && (VGA_VERT_COORD > 469)}}} ||
            // I
            {(VGA_HORZ_COORD + 40 > 440) && (VGA_HORZ_COORD + 40 < 446) && {{(VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} || {(VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)}}} ||
            {(VGA_HORZ_COORD + 40 > 445) && (VGA_HORZ_COORD + 40 < 451) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 450) && (VGA_HORZ_COORD + 40 < 456) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 455) && (VGA_HORZ_COORD + 40 < 461) && {{(VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} || {(VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)}}} ||
            // C
            {(VGA_HORZ_COORD + 40 > 470) && (VGA_HORZ_COORD + 40 < 476) && (VGA_VERT_COORD < 495) && (VGA_VERT_COORD > 469)} ||
            {(VGA_HORZ_COORD + 40 > 475) && (VGA_HORZ_COORD + 40 < 481) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 480) && (VGA_HORZ_COORD + 40 < 486) && {{(VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} || {(VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)}}} ||
            {(VGA_HORZ_COORD + 40 > 485) && (VGA_HORZ_COORD + 40 < 491) && {{(VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} || {(VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)}}} ||
            {(VGA_HORZ_COORD + 40 > 490) && (VGA_HORZ_COORD + 40 < 496) && {{(VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 489)} || {(VGA_VERT_COORD < 475) && (VGA_VERT_COORD > 464)}}} ||
            {(VGA_HORZ_COORD + 40 > 495) && (VGA_HORZ_COORD + 40 < 501) && {{(VGA_VERT_COORD < 495) && (VGA_VERT_COORD > 489)} || {(VGA_VERT_COORD < 475) && (VGA_VERT_COORD > 469)}}} ||
            // =
            {(VGA_HORZ_COORD + 40 > 530) && (VGA_HORZ_COORD + 40 < 536) && {{(VGA_VERT_COORD < 490) && (VGA_VERT_COORD > 484)} || {(VGA_VERT_COORD < 480) && (VGA_VERT_COORD > 474)}}} ||
            {(VGA_HORZ_COORD + 40 > 535) && (VGA_HORZ_COORD + 40 < 541) && {{(VGA_VERT_COORD < 490) && (VGA_VERT_COORD > 484)} || {(VGA_VERT_COORD < 480) && (VGA_VERT_COORD > 474)}}} ||
            {(VGA_HORZ_COORD + 40 > 540) && (VGA_HORZ_COORD + 40 < 546) && {{(VGA_VERT_COORD < 490) && (VGA_VERT_COORD > 484)} || {(VGA_VERT_COORD < 480) && (VGA_VERT_COORD > 474)}}} ||
            {(VGA_HORZ_COORD + 40 > 545) && (VGA_HORZ_COORD + 40 < 551) && {{(VGA_VERT_COORD < 490) && (VGA_VERT_COORD > 484)} || {(VGA_VERT_COORD < 480) && (VGA_VERT_COORD > 474)}}} ||
            // N
            {(VGA_HORZ_COORD + 40 > 580) && (VGA_HORZ_COORD + 40 < 586) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 585) && (VGA_HORZ_COORD + 40 < 591) && (VGA_VERT_COORD < 480) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 590) && (VGA_HORZ_COORD + 40 < 596) && (VGA_VERT_COORD < 485) && (VGA_VERT_COORD > 469)} ||
            {(VGA_HORZ_COORD + 40 > 595) && (VGA_HORZ_COORD + 40 < 601) && (VGA_VERT_COORD < 490) && (VGA_VERT_COORD > 474)} ||
            {(VGA_HORZ_COORD + 40 > 600) && (VGA_HORZ_COORD + 40 < 606) && (VGA_VERT_COORD < 495) && (VGA_VERT_COORD > 479)} ||
            {(VGA_HORZ_COORD + 40 > 605) && (VGA_HORZ_COORD + 40 < 611) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            // O
            {(VGA_HORZ_COORD + 40 > 620) && (VGA_HORZ_COORD + 40 < 626) && (VGA_VERT_COORD < 495) && (VGA_VERT_COORD > 469)} ||
            {(VGA_HORZ_COORD + 40 > 625) && (VGA_HORZ_COORD + 40 < 631) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 630) && (VGA_HORZ_COORD + 40 < 636) && {{(VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} || {(VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)}}} ||
            {(VGA_HORZ_COORD + 40 > 635) && (VGA_HORZ_COORD + 40 < 641) && {{(VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} || {(VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)}}} ||
            {(VGA_HORZ_COORD + 40 > 640) && (VGA_HORZ_COORD + 40 < 646) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 645) && (VGA_HORZ_COORD + 40 < 651) && (VGA_VERT_COORD < 495) && (VGA_VERT_COORD > 469)} ||
            // L
            {(VGA_HORZ_COORD + 40 > 680) && (VGA_HORZ_COORD + 40 < 686) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 685) && (VGA_HORZ_COORD + 40 < 691) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 690) && (VGA_HORZ_COORD + 40 < 696) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} ||
            {(VGA_HORZ_COORD + 40 > 695) && (VGA_HORZ_COORD + 40 < 701) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} ||
            {(VGA_HORZ_COORD + 40 > 700) && (VGA_HORZ_COORD + 40 < 706) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} ||
            {(VGA_HORZ_COORD + 40 > 705) && (VGA_HORZ_COORD + 40 < 711) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} ||
            // I
            {(VGA_HORZ_COORD + 40 > 720) && (VGA_HORZ_COORD + 40 < 726) && {{(VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} || {(VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)}}} ||
            {(VGA_HORZ_COORD + 40 > 725) && (VGA_HORZ_COORD + 40 < 731) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 730) && (VGA_HORZ_COORD + 40 < 736) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 735) && (VGA_HORZ_COORD + 40 < 741) && {{(VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} || {(VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)}}} ||
            // F
            {(VGA_HORZ_COORD + 40 > 750) && (VGA_HORZ_COORD + 40 < 756) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 755) && (VGA_HORZ_COORD + 40 < 761) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 760) && (VGA_HORZ_COORD + 40 < 766) && {{(VGA_VERT_COORD < 485) && (VGA_VERT_COORD > 479)} || {(VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)}}} ||
            {(VGA_HORZ_COORD + 40 > 765) && (VGA_HORZ_COORD + 40 < 771) && {{(VGA_VERT_COORD < 485) && (VGA_VERT_COORD > 479)} || {(VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)}}} ||
            {(VGA_HORZ_COORD + 40 > 770) && (VGA_HORZ_COORD + 40 < 776) && {{(VGA_VERT_COORD < 485) && (VGA_VERT_COORD > 479)} || {(VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)}}} ||
            {(VGA_HORZ_COORD + 40 > 775) && (VGA_HORZ_COORD + 40 < 781) && (VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)} ||
            // E
            {(VGA_HORZ_COORD + 40 > 790) && (VGA_HORZ_COORD + 40 < 796) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 795) && (VGA_HORZ_COORD + 40 < 801) && (VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 464)} ||
            {(VGA_HORZ_COORD + 40 > 800) && (VGA_HORZ_COORD + 40 < 806) && {{(VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} || {(VGA_VERT_COORD < 485) && (VGA_VERT_COORD > 479)} || {(VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)}}} ||
            {(VGA_HORZ_COORD + 40 > 805) && (VGA_HORZ_COORD + 40 < 811) && {{(VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} || {(VGA_VERT_COORD < 485) && (VGA_VERT_COORD > 479)} || {(VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)}}} ||
            {(VGA_HORZ_COORD + 40 > 810) && (VGA_HORZ_COORD + 40 < 816) && {{(VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} || {(VGA_VERT_COORD < 485) && (VGA_VERT_COORD > 479)} || {(VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)}}} ||
            {(VGA_HORZ_COORD + 40 > 815) && (VGA_HORZ_COORD + 40 < 821) && {{(VGA_VERT_COORD < 500) && (VGA_VERT_COORD > 494)} || {(VGA_VERT_COORD < 470) && (VGA_VERT_COORD > 464)}}};

endmodule
