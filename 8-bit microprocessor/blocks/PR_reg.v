`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:36:16 11/07/2014 
// Design Name: 
// Module Name:    PR_reg 
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
module PR_reg(clk, rst, ar_on_pr, increment_pr,data_2_pr,pr_on_bus);
	input clk;
	input rst;
	input ar_on_pr,increment_pr;
	input [7:0] data_2_pr;
	output [7:0] pr_on_bus;
	reg [7:0] pr_on_bus;
	
	always @(posedge clk)
	begin
		if(rst)
		begin
			pr_on_bus <= 8'b0;	
		end
					
		if(ar_on_pr)
			begin
				pr_on_bus <= data_2_pr;
			end
			
		else if(increment_pr)
			begin
				pr_on_bus <= pr_on_bus + 1;
			end
		end
	
	endmodule
