`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2019 10:08:54
// Design Name: 
// Module Name: pushbutton
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


module pushbutton(    input clk_20,    input btn,    output Q    );

    wire out1;
    wire out2;
    dff f1 (clk_20, btn, out1);
    dff f2 (clk_20, out1, out2);
    assign Q = out1 & ~out2;

endmodule
