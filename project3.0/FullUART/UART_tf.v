`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:35:26 03/09/2018
// Design Name:   UART
// Module Name:   F:/Spring2018/CECS460/project2/transmitEngine/UART_tf.v
// Project Name:  transmitEngine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UART
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module UART_tf;

	// Inputs
	reg clk;
	reg rst;
	reg load;
	reg eight;
	reg pen;
	reg ohel;
	reg [7:0] outPort;
	reg [3:0] baud;

	// Outputs
	wire TxRdy;
	wire Tx;

	// Instantiate the Unit Under Test (UUT)
	UART uut (
		.clk(clk), 
		.rst(rst), 
		.load(load), 
		.eight(eight), 
		.pen(pen), 
		.ohel(ohel), 
		.outPort(outPort), 
		.baud(baud), 
		.TxRdy(TxRdy), 
		.Tx(Tx)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		load = 0;
		eight = 0;
		pen = 0;
		ohel = 0;
		outPort = 0;
		baud = 4'b1011; 

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
		load = 1;
		eight = 1;
		pen = 1;
		ohel = 0;
		outPort = 16'h0043;
 
		// Add stimulus here

	end
      
endmodule

