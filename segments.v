`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2019 16:36:36
// Design Name: 
// Module Name: segments
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


module segments(input CLK, [11:0]volume, output reg [3:0] an, reg [6:0] seg);


reg [1:0]counter = 3;
reg [6:0]A;
reg [6:0]B;
reg [6:0]C;
reg [6:0]D;
reg [6:0]a0 = 7'b1000000;
reg [6:0]a1 = 7'b1111001;
reg [6:0]a2 = 7'b0100100;
reg [6:0]a3 = 7'b0110000;
reg [6:0]a4 = 7'b0011001;
reg [6:0]a5 = 7'b0010010;
reg [6:0]a6 = 7'b0000010;
reg [6:0]a7 = 7'b1111000;
reg [6:0]a8 = 7'b0000000;
reg [6:0]a9 = 7'b0010000;

reg [16:0]count = 0;
reg my_clk;
always @ (posedge CLK) begin
    count = count + 1;
    my_clk <= (count == 0) ? ~my_clk : my_clk;
end

always @ (posedge my_clk) begin
    counter = counter + 1;
    
    case (volume)
        12'h0000: begin
                A = a0; B = a0; C = a0; D = a0;
            end
        12'h0001: begin
                A = a0; B = a0; C = a0; D = a1;
            end
        12'h0003: begin
                A = a0; B = a0; C = a0; D = a2;
            end
        12'h0007: begin
                A = a0; B = a0; C = a0; D = a3;
            end
        12'h001f: begin
                A = a0; B = a0; C = a0; D = a4;
            end
        12'h003f: begin
                A = a0; B = a0; C = a0; D = a5;
            end
        12'h007f: begin
                A = a0; B = a0; C = a0; D = a6;
            end
        12'h00ff: begin
                A = a0; B = a0; C = a0; D = a7;
            end
        12'h01ff: begin
                A = a0; B = a0; C = a0; D = a8;
            end
        12'h03ff: begin
                A = a0; B = a0; C = a0; D = a9;
            end
        12'h05ff: begin
                A = a0; B = a0; C = a1; D = a0;
            end
        12'h07ff:begin
                A = a0; B = a0; C = a1; D = a1;
            end
        default: begin
                A = a0; B = a0; C = a1; D = a2;
            end
    endcase
    
    case (counter)
        0:
            begin
                an = 4'b0111;
                seg = A;
                //seg = a0;
            end
        1:
             begin
                 an = 4'b1011;
                 seg = B;
                 //seg = a1;
             end
        2:
            begin
                 an = 4'b1101;
                 seg = C;
                 //seg = a2;
             end
        default:
            begin
                 an = 4'b1110;
                 seg = D;
                 //seg = a3;
            end
        endcase
    end
endmodule