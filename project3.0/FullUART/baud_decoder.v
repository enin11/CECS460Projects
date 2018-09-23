`timescale 1ns / 1ps
/***************************************************************************
 * File Name: baud_decoder.v
 * Project: UART
 * Designer: Marc Dominic Cabote
 * Email: marcdominic011@gmail.com
 * Rev. Date: 5 May, 2018
 * 
 * Purpose:Determines the rate of data communication
 *
 * Notes:	-	This module has a synchronous reset input.
 *         
 ***************************************************************************/
module baud_decoder(input [3:0] baud,
						  output reg[18:0] k );
	
	
	always @(*) begin
			case (baud)
				4'b0000: k = 333333; //300
				4'b0001: k = 83333;  //1200
				4'b0010: k = 41667;  //2400
				4'b0011: k = 20833;  //4800
				4'b0100: k = 10417;  //9600
				4'b0101: k = 5208;   //19200
				4'b0110: k = 2604;   //38400
				4'b0111: k = 1736;   //57600
				4'b1000: k = 868;    //115200
				4'b1001: k = 434;    //230400
				4'b1010: k = 217;    //460800
				4'b1011: k = 109;    //921600
				default: k = 333333;	//300
			endcase
	end
	
endmodule
