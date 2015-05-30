`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:16:50 11/30/2014 
// Design Name: 
// Module Name:    ALU 
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

module ALU(clk,rst,a1,b1,ALU_cin1,ALU_sel1,alu_out,Cout);
input [7:0] a1;
input [7:0] b1;
input clk,rst,ALU_cin1,ALU_sel1;
output [7:0] alu_out;
output Cout;

wire c0,c1,c2,c3,c4,c5,c6;
full_adder f1(alu_out[0],C0,a1[0],b1[0],ALU_cin1,ALU_sel1);
full_adder f2(alu_out[1],C1,a1[1],b1[1],C0,ALU_sel1);
full_adder f3(alu_out[2],C2,a1[2],b1[2],C1,ALU_sel1);
full_adder f4(alu_out[3],C3,a1[3],b1[3],C2,ALU_sel1);
full_adder f5(alu_out[4],C4,a1[4],b1[4],C3,ALU_sel1);
full_adder f6(alu_out[5],C5,a1[5],b1[5],C4,ALU_sel1);
full_adder f7(alu_out[6],C6,a1[6],b1[6],C5,ALU_sel1);
full_adder f8(alu_out[7],COUT,a1[7],b1[7],C6,ALU_sel1);
endmodule
