`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:09:55 11/08/2014 
// Design Name: 
// Module Name:    DR_reg 
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
module DR_reg(clk,rst,data_on_dr,bus_2_dr,dr_2_bus);

input clk;
input rst;
input data_on_dr;
input [7:0] bus_2_dr;
output [7:0] dr_2_bus;
reg [7:0] dr_2_bus;

always @(posedge clk)
begin
	if(rst)
	begin
		dr_2_bus <= 8'b0;
	end
	
	if(data_on_dr)
	begin
		dr_2_bus <= bus_2_dr;
	end

end

endmodule
