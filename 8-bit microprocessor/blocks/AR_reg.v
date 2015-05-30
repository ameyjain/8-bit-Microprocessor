`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:33 11/08/2014 
// Design Name: 
// Module Name:    AR_reg 
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
module AR_reg(clk,rst,data_on_ar,data_2_ar,ar_2_bus);
input clk;
input rst;
input  data_on_ar;
inout [7:0] data_2_ar;
output [7:0] ar_2_bus;
reg [7:0] ar_2_bus;

always @(posedge clk)
begin
	if(rst)
	begin
		ar_2_bus <= 8'b0;
	end
	
	else if(data_on_ar)
	begin
		ar_2_bus <= data_2_ar;
	end
	
end


endmodule
