`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:04:33 04/15/2018
// Design Name:   receiveEngine
// Module Name:   F:/Spring2018/CECS460/project3/FullUART/receiveEngine_tf.v
// Project Name:  transmitEngine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: receiveEngine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module receiveEngine_tf;

	// Inputs
	reg clk;
	reg rst;
	reg Rx;
	reg eight;
	reg pen;
	reg reads0;
	reg even;
	reg [18:0] k;

	// Outputs
	wire RxRdy;
	wire perr;
	wire ferr;
	wire ovf;
	wire [7:0] data;

	// Instantiate the Unit Under Test (UUT)
	receiveEngine uut (
		.clk(clk), 
		.rst(rst), 
		.Rx(Rx), 
		.eight(eight), 
		.pen(pen), 
		.reads0(reads0), 
		.even(even), 
		.k(k), 
		.RxRdy(RxRdy), 
		.perr(perr), 
		.ferr(ferr), 
		.ovf(ovf), 
		.data(data)
	);
	
	//Generate clock
	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		Rx = 0;
		eight = 0;
		pen = 0;
		reads0 = 0;
		even = 0;
		k = 109; //maximum baud rate

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
		
		//DATA to be receieved 0xA5
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 1;
		
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 0;
		
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 1;
		
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 0;
		
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 0;
		
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 1;
		
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 0;
		
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 1;
		
		//stop bit
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 1;//stop
		
		wait(uut.done ==1);
		#200;
		$finish;
	 
		// Add stimulus here

	end
      
endmodule

