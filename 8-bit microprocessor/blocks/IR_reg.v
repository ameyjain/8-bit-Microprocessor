`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:53:12 11/07/2014 
// Design Name: 
// Module Name:    IR_reg 
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
module IR_reg(clk,rst,data_on_ir,data_2_ir,ir_2_bus);
input clk;
input rst;
input data_on_ir;
input [7:0] data_2_ir;
output [7:0] ir_2_bus;
reg [7:0] ir_2_bus;

always@(posedge clk)
begin
	if(rst)
		begin
			ir_2_bus <= 8'b0;	
		end

	if(data_on_ir)
		begin
			ir_2_bus <= data_2_ir;
		end
	

end

endmodule
