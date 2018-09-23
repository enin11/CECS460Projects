`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:03:22 03/06/2018 
// Design Name: 
// Module Name:    parity_decoder 
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
module parity_decoder(input eight, pen, ohel,
							 input [7:0] ldata,
							 output reg bit10, bit9);
wire ep, op;

assign ep = eight ? (^ldata) : ^(ldata[6:0]); 
assign op = eight ? !(^ldata): !(^(ldata[6:0])); 


	always @ (*)
		begin
			case ({eight, pen, ohel})
				3'b000 : {bit10, bit9} = 2'b11;				//7N1
				3'b001 : {bit10, bit9} = 2'b11;				//7N1
				3'b010 : {bit10, bit9} = {1'b1, ep};			//7E1
				3'b011 : {bit10, bit9} = {1'b1, op};			//7O1
				3'b100 : {bit10, bit9} = {1'b1, ldata[7]}; //8N1
				3'b101 : {bit10, bit9} = {1'b1, ldata[7]}; //8N1
				3'b110 : {bit10, bit9} = {ep, ldata[7]};	//8E1
				3'b111 : {bit10, bit9} = {op, ldata[7]};	//801
			endcase
		end


endmodule
