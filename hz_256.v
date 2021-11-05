`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2019 15:07:12
// Design Name: 
// Module Name: hz_256
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


module hz_256(    input clk_20k,    output reg clk_256 = 0    );

reg [8:0]count = 0;

always @ (posedge clk_20k) begin
    count <= (count == 80) ? 0 : count + 1;
    clk_256 <= (count == 0) ? ~clk_256 : clk_256;
end

endmodule
