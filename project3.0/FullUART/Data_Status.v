`timescale 1ns / 1ps
/***************************************************************************
 * File Name: Data_Status.v
 * Project: UART
 * Designer: Marc Dominic Cabote
 * Email: marcdominic011@gmail.com
 * Rev. Date: 5 May, 2018
 * 
 * Purpose:Selects what data goes to the tramelBlaze
 *
 * Notes:	-	This module has a synchronous reset input.
 *         
 ***************************************************************************/
module Data_Status(input select, 
						 input [7:0] data, status,
						 output reg [15:0] in_port);
						 
	always @ (*) begin
		if (select)
			in_port = {8'b0, status};
		else
			in_port = {8'b0, data};
	end
						 
endmodule
