`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:14:34 03/06/2018 
// Design Name: 
// Module Name:    shift_register 
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
module shift_register(input clk, rst, load, shift,
							 input bit10, bit9,
							 input [6:0] ldata,
							 output reg Tx);
	
	reg [10:0] shift_out;
	reg sd0;
	
	always @ (posedge clk, posedge rst)
		begin
			if (rst)
				shift_out <= 11'b11111111111; else //reset SR to all 1's
			
			if (load)
				shift_out <= {bit10, bit9, ldata[6:0], 1'b0, 1'b1}; else
			
			if (shift)
				shift_out <= {1'b1, shift_out [10:1]};
				
		end
		
	always @ (*)
		begin
			sd0 = shift_out[0];
			Tx = sd0;
		end

endmodule
