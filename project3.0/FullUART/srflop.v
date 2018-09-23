`timescale 1ns / 1ps
/***************************************************************************
 * File Name: srflop.v
 * Project: Tx Machine 
 * Designer: Marc Cabote
 * Email: marcdominic011@gmail.com
 * Rev. Date: 8 February, 2018
 * 
 * Purpose:	An SR Flop is an arrangement of logic gates that maintains a 
 *          stable output even after the inputs are turned off.  This simple 
 *          flip flop circuit has a set input (S) and a reset input (R). 
 *
 * Notes:	-	This module has a synchronous reset input.
 *         
 ***************************************************************************/
module srflop(input clk, rst, s, r, 
				  output reg srOut);
				 
	
	always @(posedge clk, posedge rst)
		if(rst) srOut <= 1'b0; else
		if(s)	  srOut <= 1'b1; else
		if(r)   srOut <= 1'b0; 
		else	  srOut <= srOut;//not really needed


endmodule
