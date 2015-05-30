`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:05:39 11/13/2014 
// Design Name: 
// Module Name:    data_block 
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
module data_block(clk,rst,ar_on_pr,pr_on_data,pr_on_add,increment_pr,data_bus,address_bus,ir_on_data,data_on_ir,machine_code
,ar_on_data,data_on_ar,ar_on_add,gr_on_data,lsb_on_gr,msb_on_gr,data_on_dr,dr_on_data,ALU_cin,ALU_sel,load_FR_On_data,alu_2_data,add_sel_b,add_sel_a);


// DATA and ADDRESS Bus
inout [7:0] data_bus;
output [7:0] address_bus;

//System inputs
input clk;
input rst;

//For PR Register 
input  ar_on_pr;
input  pr_on_data;
input  pr_on_add;
input  increment_pr;

//For IR Register
input ir_on_data;
input data_on_ir;
output [7:0] machine_code;

//For AR Register
input ar_on_data;
input data_on_ar;
input ar_on_add;

// For GR Register
input gr_on_data;
input lsb_on_gr;
input msb_on_gr;

// For DR Register
input data_on_dr;
input dr_on_data;

// For FR Register
input load_FR_On_data;

//FOR ALU
input ALU_cin;
input ALU_sel;
input alu_2_data;
input [1:0] add_sel_a;
input [1:0] add_sel_b;

reg [7:0] mux_o1;
reg [7:0] mux_o2;


wire [7:0] pr_on_bus;
wire [7:0] dr_2_bus;
wire [7:0] gr_2_bus;
wire [7:0] ar_2_bus;
wire [8:0] alu_out;
wire [7:0] ir_2_bus;
wire [3:0] flag_2_data;



// ----------------------------------------Register Instantiation---------------------------------

GR_reg General_register(
.clk(clk),
.rst(rst), 
.lsb_on_gr(lsb_on_gr),
.msb_on_gr(msb_on_gr),
.bus_2_gr(data_bus),
.gr_2_bus(gr_2_bus)
);

PR_reg Program_counter(
.clk(clk),
.rst(rst), 
.ar_on_pr(ar_on_pr), 
//.pr_on_data(pr_on_data), 
//.pr_on_add(pr_on_add), 
.increment_pr(increment_pr),
.data_2_pr(data_bus),
.pr_on_bus(pr_on_bus)
);

AR_reg Address_register(
.clk(clk),
.rst(rst), 
//.ar_on_data(ar_on_data),
.data_on_ar(data_on_ar),
//.ar_on_add(ar_on_add),
.data_2_ar(data_bus),
.ar_2_bus(ar_2_bus)
);

DR_reg Data_register(
.clk(clk),
.rst(rst), 
.data_on_dr(data_on_dr), 
//.dr_on_data(dr_on_data),
.bus_2_dr(data_bus),
.dr_2_bus(dr_2_bus)
);


IR_reg Instruction_register(
.clk(clk),
.rst(rst), 
.data_on_ir(data_on_ir), 
.data_2_ir(data_bus),
.ir_2_bus(ir_2_bus)
);

ALU new_alu(
.clk(clk),
.rst(rst), 
.ALU_cin1(ALU_cin),
.ALU_sel1(ALU_sel),
.a1(mux_o1),
.b1(mux_o2),
.alu_out(alu_out)
);

FR_reg Flag_register(
.clk(clk),
.rst(rst),
.alu_output(alu_out),
.flag_reg(flag_2_data),
.alu_2_data(alu_2_data)
);

//---------------------------------Addition & Subtract logic---------------------------------------

always @(*)
begin : mux_block1
	case (add_sel_a)
		2'b00 : mux_o1 = ar_2_bus;
		2'b01 : mux_o1 = dr_2_bus;
		2'b10 : mux_o1 = gr_2_bus;
		2'b11 : mux_o1 = pr_on_bus;
	endcase
end
									 
always @(*)
begin : mux_block2
	case (add_sel_b)
		2'b00 : mux_o2 = ar_2_bus;
		2'b01 : mux_o2 = dr_2_bus;
		2'b10 : mux_o2 = gr_2_bus;
		2'b11 : mux_o2 = pr_on_bus;
	endcase
end

//-----------------------------------Address & Data Bus initialization---------------------------------------

assign address_bus = pr_on_add ? pr_on_bus : 8'bzzzzzzzz;
assign address_bus = ar_on_add ? ar_2_bus : 8'bzzzz_zzzz;

assign data_bus = ir_on_data ? ir_2_bus : 8'bzzzzzzzz;
assign data_bus = pr_on_data ? pr_on_bus : 8'bzzzzzzzz;
assign data_bus = ar_on_data ? ar_2_bus : 8'bzzzzzzzz;
assign data_bus = dr_on_data ? dr_2_bus : 8'bzzzzzzzz;
assign data_bus = alu_2_data ? alu_out[7:0] : 8'bzzzz_zzzz; 
assign data_bus = gr_on_data ? gr_2_bus : 8'bzzzzzzzz;
assign data_bus = load_FR_On_data ? {4'b0000,flag_2_data} : 8'bzzzzzzzz;
assign machine_code = ir_2_bus;



endmodule
