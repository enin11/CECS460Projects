`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:53:13 03/04/2018 
// Design Name: 
// Module Name:    baud_decode 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module baud_decode(input [3:0] baud,
						 output reg [18:0] k);
						 
	always @ (*) begin
			case (baud)
				4'b0000: k = 333333 - 1; //300
				4'b0001: k = 83333 - 1;  //1200
				4'b0010: k = 41667 - 1;  //2400
				4'b0011: k = 20833 - 1;  //4800
				4'b0100: k = 10417 - 1;  //9600
				4'b0101: k = 5208 - 1;   //19200
				4'b0110: k = 2604 - 1;   //38400
				4'b0111: k = 1736 - 1;   //57600
				4'b1000: k = 868 - 1;    //115200
				4'b1001: k = 434 - 1;    //230400
				4'b1010: k = 217 - 1;    //460800
				4'b1011: k = 109 - 1;    //921600
			 //4'b1100: k = ;
			 //4'b1101: k = ;
			 //4'b1110: k = ;
			 //4'b1111: k = ;
				default: k = 333333 - 1;
			endcase
	end
endmodule
