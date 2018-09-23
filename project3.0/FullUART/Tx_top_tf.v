`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:56:14 03/09/2018
// Design Name:   Tx_top
// Module Name:   F:/Spring2018/CECS460/project2/transmitEngine/Tx_top_tf.v
// Project Name:  transmitEngine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Tx_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Tx_top_tf;

	// Inputs
	reg clk;
	reg rst;
	reg eight;
	reg pen;
	reg ohel;
	reg [3:0] baud;

	// Outputs
	wire [15:0] reads;
	wire [15:0] writes;
	wire [15:0] leds;
	wire Tx;

	// Instantiate the Unit Under Test (UUT)
	Tx_top uut (
		.clk(clk), 
		.rst(rst), 
		.eight(eight), 
		.pen(pen), 
		.ohel(ohel), 
		.baud(baud), 
		.reads(reads), 
		.writes(writes), 
		.leds(leds), 
		.Tx(Tx)
	);
	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		eight = 1;
		pen = 1;
		ohel = 0;
		baud = 4'b1011;

		// Wait 100 ns for global reset to finish
		#100;
		
		rst = 0; 
		
		
        
		// Add stimulus here

	end
      
endmodule

