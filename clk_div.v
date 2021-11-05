`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2019 14:53:34
// Design Name: 
// Module Name: clk_div
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


module clk_div(    input CLOCK,    output reg slowclock = 0);

reg [12:0]count = 0;

always @ (posedge CLOCK) begin
    count <= (count == 2499) ? 0 : count + 1;
    slowclock <= (count == 0) ? ~slowclock : slowclock;
end

endmodule
