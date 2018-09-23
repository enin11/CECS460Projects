`timescale 1ns / 1ps
/***************************************************************************
 * File Name: ped.v
 * Project: Tx Machine 
 * Designer: Marc Cabote
 * Email: marcdominic011@gmail.com
 * Rev. Date: 20 September, 2017
 * 
 * Purpose:	The positive edge detect(PED) creates and sends out a pulse to
 *          the counter. The pulse fed to the counter adjusts the output 
 *          value depending on the up-high down-low switch. The signal is
 *          coming from the output of the debounce to determine if it will
 *          send a pulse. The pulse is driven by two flops with one output
 *          being high (AND)ed with the other output being low; hence the
 *          inverter on the (AND) gate. 
 *
 * Notes:	-	This module has a synchronous reset input coming from the AISO.
 *          -  Signal is coming from the debounce module:
 *             if signal is 1 q1 gets 1 and q2 gets 0 producing the pulse
 ***************************************************************************/
module ped(input   clk, rst, signal,
		     output  pulse);
			  
   //local registers
	reg q1, q2; //q1-level; q2-delayReg

	always @(posedge clk, posedge rst)
		if(rst) begin 
			  q1 <= 1'b0;//q1 and q2 gets reset 
			  q2 <= 1'b0;
		end
	
		else begin   
	        q1 <= signal; //q1 gets signal
	        q2 <= q1;     //q2 gets q1
		end		  
	
	assign pulse = q1 & ~q2;//AND gate for a Positive Edge Detect Output
	


endmodule
