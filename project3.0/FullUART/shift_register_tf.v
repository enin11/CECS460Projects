`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:55:39 03/09/2018
// Design Name:   shift_register
// Module Name:   F:/Spring2018/CECS460/project2/transmitEngine/shift_register_tf.v
// Project Name:  transmitEngine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shift_register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shift_register_tf;

	// Inputs
	reg clk;
	reg rst;
	reg load;
	reg shift;
	reg bit10;
	reg bit9;
	reg [6:0] ldata;

	// Outputs
	wire Tx;

	// Instantiate the Unit Under Test (UUT)
	shift_register uut (
		.clk(clk), 
		.rst(rst), 
		.load(load), 
		.shift(shift), 
		.bit10(bit10), 
		.bit9(bit9), 
		.ldata(ldata), 
		.Tx(Tx)
	);
	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		load = 0;
		shift = 0;
		bit10 = 0;
		bit9 = 0;
		ldata = 0;

		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
	
		//exercise reset
		rst = 1;
		load = 0;
		shift = 0;
		bit10 = 1;
		bit9 = 1;
		ldata = 7'b010_0101;
		#100;
		
		//exercise load
		//expected output 110_1001_0110
		rst = 0;
		load = 1;
		shift = 0;
		bit10 = 1;
		bit9 = 1;
		ldata = 7'b010_0101;
		#100;
		
		//exercise shift
		//expected output 111_0100_1011
		rst = 0;
		load = 0;
		shift = 1;
		bit10 = 1;
		bit9 = 1;
		ldata = 7'b010_0101;
		#100;
		
		//exercise load and shift
		rst = 0;
		load = 1;
		shift = 1;
		bit10 = 1;
		bit9 = 1;
		ldata = 7'b010_0101;
		#100;
		
		//exercise reset again
		rst = 1;
		load = 1;
		shift = 1;
		bit10 = 1;
		bit9 = 1;
		ldata = 7'b010_0101;
		#100;
		
		

	end
      
endmodule

