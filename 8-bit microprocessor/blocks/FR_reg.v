`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:04:42 11/08/2014 
// Design Name: 
// Module Name:    FR_reg 
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
module FR_reg(clk,rst,alu_output,flag_reg,alu_2_data);

input clk,rst;
input alu_2_data;
input [8:0] alu_output;
output [3:0] flag_reg;
reg [3:0] flag_reg;

always @(posedge clk)
begin
	if(rst)
	begin
		flag_reg <= 4'b0;
	end
	else if (alu_2_data)
		begin
			flag_reg[3] <= ~|alu_output;   							//Zero flag
			flag_reg[2] <= (alu_output[7]^alu_output[8]);		//Signed flag
			flag_reg[1] <= alu_output[8];								//Carry flag
			flag_reg[0] <= alu_output[7]^alu_output[8];			//Overflow flag
		end	
end

endmodule
