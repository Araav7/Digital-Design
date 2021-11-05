`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2019 21:37:37
// Design Name: 
// Module Name: clk_1hz
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


module flex_clk(    input clk_20k,    input [20:0] limit,  output reg slowclk = 0    );

reg [20:0]count = 0;

always @ (posedge clk_20k) begin
    count <= (count == limit) ? 0 : count + 1;
    slowclk <= (count == 0) ? ~slowclk : slowclk;
end

endmodule