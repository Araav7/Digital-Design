`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2019 14:26:14
// Design Name: 
// Module Name: indicator
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


module indicator(    input CLK,    input [11:0] in,    output reg [11:0] led,  output reg [9:0] sample_max);

reg [20:0]count20;
reg [24:0]count5;
reg [20:0]reset_count;
reg my_clk20;
reg my_clk5;
reg [11:0]sample = 0;
reg a, b;

always @ (posedge CLK) begin
    count20 = (count20 == 2499) ? 0 : count20 + 1;
    count5 =(count5 == 9999999) ? 0 : count5 + 1;
    my_clk20 <= (count20 == 0) ? ~my_clk20 : my_clk20;
    my_clk5 <= (count5 == 0) ? ~my_clk5 : my_clk5;
end

always @ (posedge my_clk20) begin
    reset_count = (reset_count == 3999) ? 0 : reset_count + 1;
    sample <= (reset_count == 0) ? 0 : 
                {(in > sample) ? in : sample};
end    

always @ (posedge my_clk5) 
    begin
    sample_max = sample[9:0];
    if (sample < 2000)
        led = 12'b000000000000;//0
    else if (sample < 2200)
        led = 12'b000000000001;//1 
    else if (sample < 2400)
        led = 12'b000000000011;//2
    else if (sample < 2600)
        led = 12'b000000000111;//3
    else if (sample < 2800)
        led = 12'b000000001111;//4
    else if (sample < 2976)
        led = 12'b000000011111;//5
    else if (sample < 3136)
        led = 12'b000000111111;//6
    else if (sample < 3296)
        led = 12'b000001111111;//7
    else if (sample < 3456)
        led = 12'b000011111111;//8
    else if (sample < 3616)
        led = 12'b000111111111;//9
    else if (sample < 3776)
        led = 12'b001111111111;//10
    else if (sample < 3936)
        led = 12'b011111111111;//11    
    else 
        led = 12'b111111111111;
end

endmodule
