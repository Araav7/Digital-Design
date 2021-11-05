`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// You may study and modify the code inside this module to imporve the display feature or introduce other features
//////////////////////////////////////////////////////////////////////////////////

  module Draw_Waveform(
    input [1:0]state, //which waveform is expanded
    input center,
    input up,
    input btn,      //reset heart
    input full_screen,
    input [9:0]sw,  //freeze, grid, axis/ticks, wave, ramp, 4 colors (0, 1, 2, 3, 4, 5-8)
    input clk_sample, //20kHz clock
    input [9:0]sample_max, //max over a 5hz period

    input [9:0] wave_sample,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    output [3:0] VGA_Red_waveform,
    output [3:0] VGA_Green_waveform,
    output [3:0] VGA_Blue_waveform
    );
    
    //The Sample_Memory represents the memory array used to store the voice samples.
    //There are 1280 points and each point can range from 0 to 1023. 
    reg [9:0] Sample_Memory[1279:0];
    reg [9:0] Sample_Wave[1279:0];
    reg [10:0] i = 0;
    reg [10:0] j = 0;
    
    reg [3:0] color_intense;
    reg [20:0] reset_count;
    reg [9:0] sample_256 = 0;
    wire [9:0] circle_sample = (sample_max / 2);
    wire [11:0] abs_horz;
    wire clk_256; // 256Hz clock for heartbeat refresh rate of 5 sec
    wire [9:0] heart_sample;   
    
    
//    Count 10 sec before asystole
    wire start = (sample_max < 200) ? 1 : 0;
    wire done;
    wire life;
    wire Condition_For_No_Life;
    hz_256 clk (clk_sample, clk_256);
    
    // Counts ten seconds then turn off heart
    count_to_ten ten (clk_sample, start, btn, state, done);
    assign heart_sample = (done) ? 0 : sample_max;
    
    // Prints words to scroll across screen and flashes at 1hz
    wire clk_1hz;
    no_music music (VGA_HORZ_COORD, VGA_VERT_COORD, clk_256, life);
    flex_clk hz_1 (clk_sample, 20000, clk_1hz);
    assign Condition_For_No_Life = (done && clk_1hz) ? life : 0;
                        
    //Each wave_sample is displayed on the screen from left to right. 
    reg [1:0] wave_size;
    reg [1:0] heart_size;
    reg [1:0] circle_size;
    reg [1:0] bar_size;
    always @ (posedge clk_sample) begin
        j = (sw[0] == 1) ? j : {(j == 957) ? 0 : j + 1};
        Sample_Wave[j] <= (wave_sample / 2 < 250) ? 0 : (wave_sample / 2) - 250;
        
        // Max within 20kHz range
        reset_count = (reset_count == 79) ? 0 : reset_count + 1;
        sample_256 <= (reset_count == 0) ? wave_sample : 
            {(wave_sample > sample_256) ? wave_sample : sample_256};
            
        case (state)
        0: begin
            wave_size = full_screen ? 3 : 2;
            heart_size = full_screen ? 0 : 1;
            circle_size = full_screen ? 0 : 1;
            bar_size = full_screen ? 0 : 1;
            end
        1: begin
            wave_size = full_screen ? 0 : 1;
            heart_size = full_screen ? 3 : 2;
            circle_size = full_screen ? 0 : 1;
            bar_size = full_screen ? 0 : 1;
            end
        2: begin
            wave_size = full_screen ? 0 : 1;
            heart_size = full_screen ? 0 : 1;
            circle_size = full_screen ? 3 : 2;
            bar_size = full_screen ? 0 : 1;
            end
        3: begin
            wave_size = full_screen ? 0 : 1;
            heart_size = full_screen ? 0 : 1;
            circle_size = full_screen ? 0 : 1;
            bar_size = full_screen ? 3 : 2;
            end
        default: begin
            wave_size = 1;
            heart_size = 0;
            circle_size = 0;
            bar_size = 0;
            end
        endcase
    end

//      For heartbeat at 256Hz
    always @ (posedge clk_256) begin
        i = (sw[0] == 1) ? i : 
            {(i==1279) ? 0 : i + 1};
        Sample_Memory[i] <= ((done && state > 1) || (sample_256 / 2 < 256)) ? 0 : (sample_256 / 2) - 256;
    end
    
    
    // Draw heart
    wire heart;
    wire [3:0]red_heart;
    wire [3:0]green_heart;
    wire [3:0]blue_heart;
    wire heartbeat;
    wire [9:0] memory_high = done ? 0 : (Sample_Memory[VGA_HORZ_COORD] > Sample_Memory[VGA_HORZ_COORD - 1]) ? Sample_Memory[VGA_HORZ_COORD] : Sample_Memory[VGA_HORZ_COORD - 1];
    wire [9:0] memory_low  = done ? 0 : (Sample_Memory[VGA_HORZ_COORD] > Sample_Memory[VGA_HORZ_COORD - 1]) ? Sample_Memory[VGA_HORZ_COORD - 1] : Sample_Memory[VGA_HORZ_COORD];
    
    draw_heart heart_wave (VGA_HORZ_COORD, VGA_VERT_COORD, heart_sample, heart_size, memory_high, memory_low, heart, red_heart);
    assign heartbeat = (state != 1) ? 0 : ((VGA_HORZ_COORD < 958) && (VGA_VERT_COORD > (700 - memory_high)) && (VGA_VERT_COORD < (705 - memory_low)));
    assign green_heart = Condition_For_No_Life && heart_size ? 4'hf:
                           {(!full_screen && (VGA_HORZ_COORD < 958) && (VGA_VERT_COORD > (700 - memory_high)) && (VGA_VERT_COORD < (705 - memory_low)) && (VGA_HORZ_COORD == i)) ? 4'hf :
                               {(!full_screen && (VGA_HORZ_COORD < 958) && (VGA_VERT_COORD > (700 - memory_high)) && (VGA_VERT_COORD < (705 - memory_low)) && (VGA_HORZ_COORD != i)) ? 4'ha : 
                                    {(full_screen && (VGA_VERT_COORD > (700 - memory_high)) && (VGA_VERT_COORD < (705 - memory_low)) && (VGA_HORZ_COORD == i)) ? 4'hf :
                                        {(full_screen &&(VGA_VERT_COORD > (700 - memory_high)) && (VGA_VERT_COORD < (705 - memory_low)) && (VGA_HORZ_COORD != i)) ? 4'ha : 0}}}};
    assign blue_heart =  heart || (Condition_For_No_Life && heart_size == 2)  ? 4'hf : 0; 

    
    // Draw circle
    wire circle;
    wire [3:0]red_circle;
    wire [3:0]green_circle;
    wire [3:0]blue_circle;
    draw_circle circle_wave (VGA_HORZ_COORD, VGA_VERT_COORD, circle_sample, circle_size, circle, green_circle, red_circle, blue_circle);
//    assign red_circle = 0;
//    assign blue_circle = 15;


//      Code for bar
    wire bar;
    wire [3:0]red_bar;
    wire [3:0]green_bar;
    wire [3:0]blue_bar;
    draw_bar bar_war (VGA_HORZ_COORD, VGA_VERT_COORD, sample_max, bar_size, bar, red_bar, green_bar, blue_bar);
             

//      Code for verticle waveform
    wire [3:0] blue;
    wire [3:0] green;
    wire [3:0] red;
    wire [11:0] memory; 
    draw_wave gradient (VGA_HORZ_COORD, VGA_VERT_COORD, Sample_Wave[VGA_VERT_COORD - 30], wave_size, state, i, blue, green, red);
    
//        Code for game
    wire [3:0] game_red;
    wire [3:0] game_green;
    wire [3:0] game_blue;
    draw_game game (clk_sample, VGA_HORZ_COORD, VGA_VERT_COORD, sample_max, center, up, btn, full_screen, game_red, game_green, game_blue);
    
    assign VGA_Red_waveform = sw[9] ? game_red :
                                sw[3] ? 0: 
                                    {heart ? red_heart : 
                                        {circle ? red_circle :
                                            {bar ? red_bar : red}}};
    assign VGA_Green_waveform = sw[9] ? game_green :
                                sw[3] ? 0 :
                                    {heartbeat || Condition_For_No_Life ? green_heart : 
                                        {circle ? green_circle :
                                            {bar ? green_bar : green}}};
    assign VGA_Blue_waveform = sw[9] ? game_blue :
                                sw[3] ? 0 :
                                    {heart || Condition_For_No_Life ? blue_heart : 
                                        {circle ? blue_circle :
                                            {bar ? blue_bar : blue}}};

//      Original code for waveform
//    assign VGA_Red_waveform =   ((VGA_HORZ_COORD < 1280) && (VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD]))
//                                    && (sw[3] == 0)) ? 4'hf : 0;
//    assign VGA_Green_waveform = ((VGA_HORZ_COORD < 1280) && (VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD]))
//                                    && (sw[3] == 0)) ? 4'hf : 0;
//    assign VGA_Blue_waveform =  ((VGA_HORZ_COORD < 1280) && (VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD]))
//                                    && (sw[3] == 0)) ? 4'hf : 0 ;


endmodule