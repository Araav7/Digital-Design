`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2019 15:48:58
// Design Name: 
// Module Name: count_to_ten
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


module count_to_ten(    input clk_20k,    input start,  input btn, input [1:0] state,    output reg done = 0    );

reg [20:0]count = 0;

always @ (posedge clk_20k) begin
    count = (!start || count == 200000) ? 0 : count + 1;
    done = (count == 200000) ? 1 : 
                {(btn || state != 1) ? 0 : done};
end

endmodule
