`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:44:34 03/06/2018 
// Design Name: 
// Module Name:    bit_time_counter 
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
module bit_time_counter(input clk, rst, doit,
								input [18:0] k,
								output btu);
								
	reg [18:0] bitTimeCounter, bitTimeCount;	
	
	assign btu = (bitTimeCounter == k);
	
	always @ (posedge clk, posedge rst)
		begin
			if (rst)
				bitTimeCounter <= 19'b0;
			else
				bitTimeCounter <= bitTimeCount;
		end
		
	always @ (*)
		begin
			case ({doit, btu})
				2'b00 : bitTimeCount = 19'b0;
				2'b01 : bitTimeCount = 19'b0;
				2'b10 : bitTimeCount = bitTimeCounter + 19'b1;
				2'b11 : bitTimeCount = 19'b0;
				default: bitTimeCount = 19'b0;
			endcase	
		end							


endmodule
