`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:32:36 03/06/2018 
// Design Name: 
// Module Name:    dflop 
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
module dflop(input clk, rst, d,
				 output reg q);
	
	always @ (posedge clk, posedge rst)	
		if (rst) 
			q <= 1'b0;
		else
			q <= d;

endmodule
