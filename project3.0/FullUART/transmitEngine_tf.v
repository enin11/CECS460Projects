`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:34:49 04/15/2018
// Design Name:   transmitEngine
// Module Name:   F:/Spring2018/CECS460/project3/FullUART/transmitEngine_tf.v
// Project Name:  transmitEngine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: transmitEngine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module transmitEngine_tf;

	// Inputs
	reg clk;
	reg rst;
	reg eight;
	reg pen;
	reg ohel;
	reg load;
	reg [7:0] out_port;
	reg [18:0] k;

	// Outputs
	wire TxRdy;
	wire Tx;

	// Instantiate the Unit Under Test (UUT)
	transmitEngine uut (
		.clk(clk), 
		.rst(rst), 
		.eight(eight), 
		.pen(pen), 
		.ohel(ohel), 
		.load(load), 
		.out_port(out_port), 
		.k(k), 
		.TxRdy(TxRdy), 
		.Tx(Tx)
	);
	//Generate clock
	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		eight = 0;
		pen = 0;
		ohel = 0;
		load = 0;
		out_port = 8'hA5;
		k = 109;
		
		//Wait 100 ns for global reset to finish
		#100;
		rst = 0;			    //exercise reset
		
		//======================================
		//	case = 3'b000
		// output = 11_0100101_01
		//======================================		
		eight = 0; 
		pen 	= 0;
		ohel 	= 0;
		load 	= 1;
			
		//======================================
		//	case 3'b001
		// output = 11_0100101_01
		//======================================	
		#100;
		eight = 0;
		pen 	= 0;
		ohel 	= 1;
		load 	= 1;
		
		//======================================
		//	case 3'b010
		// output = 11_0100101_01
		//======================================	
		#100;
		eight = 0;
		pen 	= 1;
		ohel 	= 0;
		load 	= 1;

		//======================================
		//	case 3'b011
		// output = 10_0100101_01
		//======================================	
		#100;
		eight = 0;
		pen 	= 1;
		ohel 	= 1;
		load 	= 1;
		
		//======================================
		//	case 3'b100
		// output = 11_0100101_01
		//======================================	
		#100;
		eight = 1;
		pen 	= 0;
		ohel 	= 0;
		load 	= 1;
		
		//======================================
		//	case 3'b101
		// output = 11_0100101_01
		//======================================	
		#100;
		eight = 1;
		pen 	= 0;
		ohel 	= 1;
		load 	= 1;
		
		//======================================
		//	case 3'b110
		// output = 01_0100101_01
		//======================================	
		#100;
		eight = 1;
		pen 	= 1;
		ohel 	= 0;
		load 	= 1;
		
		//======================================
		//	case 3'b111
		// output = 11_0100101_01
		//======================================	
		#100;
		eight = 1;
		pen 	= 1;
		ohel 	= 1;
		load 	= 1;
        
	end
      
endmodule

