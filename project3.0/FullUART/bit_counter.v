`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:59:16 03/06/2018 
// Design Name: 
// Module Name:    bit_counter 
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
module bit_counter(input clk, rst, doit, btu,
								output done);

	reg [3:0] bitCounter, bitCount;
	
	assign done = (bitCounter == 11);
	
	always @ (posedge clk, posedge rst)
		begin
			if(rst)
				bitCounter <= 4'b0;
			else
				bitCounter <= bitCount;
		end
		
	always @ (*)
		begin
			case ({doit, btu})
				2'b00 : bitCount = 4'b0;
				2'b01 : bitCount = 4'b0;
				2'b10 : bitCount = bitCounter;
				2'b11 : bitCount = bitCounter + 4'b1;
				default: bitCount = 4'b0;
			endcase	
		end		



endmodule
