`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:25:51 03/06/2018 
// Design Name: 
// Module Name:    ld_reg 
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
module ld_reg(input clk, rst, ld, 
				  input [7:0] d,
				  output reg [7:0] q);
				  
	always @ (posedge clk, posedge rst)
		if (rst)
			q <= 7'b0; else
		if (ld)
			q <= d;//if load is high
		else
			q <= q;//default 
	
				  
				  


endmodule
