`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/25 15:05:45
// Design Name: 
// Module Name: display
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


module display(
    input [3:0]  x,
    output reg [10:0] y
    );
    always@(x) begin
        case(x)
            4'b0000:y = 11'b1110_0000001;
            4'b0001:y = 11'b1110_1001111;
            4'b0010:y = 11'b1110_0010010;
            4'b0011:y = 11'b1110_0000110;
            4'b0100:y = 11'b1110_1001100;
            4'b0101:y = 11'b1110_0100100;
            4'b0110:y = 11'b1110_0100000;
            4'b0111:y = 11'b1110_0001111;
            4'b1000:y = 11'b1110_0000000;
            4'b1001:y = 11'b1110_0000100;
            4'b1010:y = 11'b1110_0001000;
            4'b1011:y = 11'b1110_1100000;
            4'b1100:y = 11'b1110_0110001;
            4'b1101:y = 11'b1110_1000010;
            4'b1110:y = 11'b1110_0110000;
            4'b1111:y = 11'b1110_0111000;
         endcase
    end
endmodule
