`timescale 1ns / 1ps
/***************************************************************************
 * File Name: Tx_top.v
 * Project: Tx Machine 
 * Designer: Marc Cabote
 * Email: marcdominic011@gmail.com
 * Rev. Date: 10 March, 2018
 * 
 * Purpose:The transmit engine has the logic needed to communicate with a 
 *         computer using UART. For the terminal to have a stable connection 
 *         in order to output the proper characters, the program—Realterm—
 *         should know what the setting is for the transmit engine—it should 
 *         know the baud rate, odd or even parity and number of bits. 
 *         If the program settings match the FPGA, it will then show 
 *         “CSULB CECS 460 – [LINECOUNTER] <CR> <LF>”.
 *
 * Notes:	-	This module has an asynchronous reset input.
 *         
 ***************************************************************************/
module Tx_top(input clk, rst, eight, pen, ohel,
              input [3:0] baud_val,
				 output [15:0] reads, writes,
				 output [15:0] leds,
				 output Tx);
		
		wire load;
		wire rst_out; //aiso wire
		wire TxRdy;   //Tx wire
		wire ped_out; //ped wire
		wire sr_out;  //sr flop wire
		wire interrupt_ack, write_strobe, read_strobe;//TB wires
		wire [15:0] port_id, in_port;
		wire [15:0] out_port;
		wire [18:0] k;
		
		// assign load
		assign load = (port_id == 16'h0000) & (write_strobe);
		//leds for debugging
		assign leds = out_port[15:0];
		
		aiso 				aiso (.clk(clk), 
									.rst(rst), 
									.rst_out(rst_out));
		
		baud_decoder  baudrt(.baud(baud_val),
									.k(k));
		
		transmitEngine	  tx (.clk(clk), 
									.rst(rst_out), 
									.load(load), 
									.eight(eight), 
									.pen(pen), 
									.ohel(ohel), 
									.out_port(out_port[7:0]), 
									.k(k), 
									.TxRdy(TxRdy), 
									.Tx(Tx));
									
		receiveEngine	  rx ();
					
		ped  				txPED(.clk(clk), 
									.rst(rst_out), 
									.signal(TxRdy), 
									.pulse(ped_out));
		
		ped  				rxPED(.clk(clk), 
									.rst(rst_out), 
									.signal(TxRdy), 
									.pulse(ped_out));
		
		srflop 		  srflop(.clk(clk), 
									.rst(rst_out), 
									.s(ped_out), 
									.r(interrupt_ack),  
									.srOut(sr_out));
		
		tramelblaze_top 	TB(.CLK(clk), 
									.RESET(rst_out), 
									.IN_PORT(in_port), 
									.INTERRUPT(sr_out), 
									.OUT_PORT(out_port), 
									.PORT_ID(port_id), 
									.READ_STROBE(read_strobe), 
									.WRITE_STROBE(write_strobe), 
									.INTERRUPT_ACK(interrupt_ack));
		
		
endmodule
