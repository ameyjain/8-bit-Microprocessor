`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:52:53 11/23/2014
// Design Name:   proccessor
// Module Name:   //vmware-host/Shared Folders/Desktop/271/Fulladder8bit/tb_processor.v
// Project Name:  Fulladder8bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: proccessor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`define clk_period_by2 5

module tb_processor;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [7:0] addr;
	wire wrt;
	wire rd;

	// Bidirs
	wire [7:0] dat;

	reg [7:0] out_data;
	
	reg [7:0] mem [0:255];
	// Instantiate the Unit Under Test (UUT)
	proccessor uut (
		.clk(clk), 
		.rst(rst), 
		.addr(addr), 
		.dat(dat), 
		.wrt(wrt), 
		.rd(rd)
	);


//Memory Initialisation
	
	initial 
		begin
			$readmemh ( "mem.txt", mem, 8'h00, 8'hff );
		end
		
	
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		end
		
// Wait 100 ns for global reset to finish
//	#100;
// Add stimulus here

	always # `clk_period_by2 clk = ~clk;
	
	initial begin 
	#40 rst = 0;
	end
	
		// Read memory block
	always @(rd | wrt | addr)
	begin 
		if(rd && !wrt)
			out_data = mem[addr];
	end
	
	//Write memory block
	always @(rd | wrt | addr)
	begin 
		if( !rd && wrt)
		mem[addr] = dat;
	end
	
assign dat = rd ? out_data : 8'bzzzz_zzzz;

initial begin 
$dumpfile("proccessor.vcd");
$dumpvars(0,tb_processor);
end

initial #8000 $finish;

endmodule
      
