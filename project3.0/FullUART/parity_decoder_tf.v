`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:21:44 03/09/2018
// Design Name:   parity_decoder
// Module Name:   F:/Spring2018/CECS460/project2/transmitEngine/parity_decoder_tf.v
// Project Name:  transmitEngine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: parity_decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module parity_decoder_tf;

	// Inputs
	reg eight;
	reg pen;
	reg ohel;
	reg [7:0] ldata;

	// Outputs
	wire bit10;
	wire bit9;

	// Instantiate the Unit Under Test (UUT)
	parity_decoder uut1 (
		.eight(eight), 
		.pen(pen), 
		.ohel(ohel), 
		.ldata(ldata), 
		.bit10(bit10), 
		.bit9(bit9)
	);
	
	
	initial begin
		// Initialize Inputs
		{eight, pen, ohel} = 3'b000;
		ldata = 8'hA5;

		// Wait 100 ns for global reset to finish
		#100;
	   {eight, pen, ohel} = 3'b001;
		#100;
		{eight, pen, ohel} = 3'b010;
		#100;
		{eight, pen, ohel} = 3'b011;
		#100;
		{eight, pen, ohel} = 3'b100;
		#100;
		{eight, pen, ohel} = 3'b101;
		#100;
		{eight, pen, ohel} = 3'b110;
		#100;
		{eight, pen, ohel} = 3'b111;
		#100;
        
	end
      
endmodule

