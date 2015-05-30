`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:50 11/08/2014 
// Design Name: 
// Module Name:    GR_reg 
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
module GR_reg(clk,rst,lsb_on_gr,msb_on_gr,bus_2_gr,gr_2_bus);

input clk;
input rst;
input lsb_on_gr,msb_on_gr;
input [7:0] bus_2_gr;
output [7:0] gr_2_bus;
reg [7:0] gr_2_bus;

always @(posedge clk)
begin 
	if(rst)
	begin
		gr_2_bus <= 8'b0;
	end
	
	else
	begin
	if(lsb_on_gr && !msb_on_gr)
	begin
		gr_2_bus[3:0] <= bus_2_gr[3:0];
	end
	else if(msb_on_gr && !lsb_on_gr)
	begin
		gr_2_bus[7:4] <= bus_2_gr[3:0];
	end
	else if(msb_on_gr && lsb_on_gr)
	begin
		gr_2_bus <= bus_2_gr;
	end
	end
end


endmodule
