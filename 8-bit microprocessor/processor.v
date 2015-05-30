`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:04:32 11/23/2014 
// Design Name: 
// Module Name:    proccessor 
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
module proccessor(clk,rst,addr,dat,wrt,rd );
input clk;
input rst;
output[7:0] addr;
inout [7:0] dat;
output wrt;
output rd;



//For AR Register
wire ar_on_data;
wire data_on_ar;
wire ar_on_add;

// For GR Register
wire gr_on_data;
wire lsb_on_gr;
wire msb_on_gr;

// For DR Register
wire data_on_dr;
wire dr_on_data;

// For FR Register
wire load_FR_On_data;

//FOR ALU
wire ALU_cin;
wire ALU_sel;
wire [1:0] add_sel_a;
wire [1:0] add_sel_b;
wire alu_2_data;

//For PR Register 
wire ar_on_pr;
wire pr_on_data;
wire pr_on_add;
wire increment_pr;

//For IR Register
wire ir_on_data;
wire data_on_ir;
wire [7:0] machine_code;


data_block data_block_instantiation (
//System Signals
.clk (clk),
.rst (rst),

//System Bus
.data_bus (dat),
.address_bus (addr),

//AR related signals
.data_on_ar(data_on_ar),
.ar_on_add(ar_on_add),
.ar_on_data(ar_on_data),

//DR related signals
.data_on_dr(data_on_dr),
.dr_on_data(dr_on_data),

//GR related signals
.lsb_on_gr(lsb_on_gr),
.msb_on_gr(msb_on_gr),
.gr_on_data(gr_on_data),

//PR related signals
.ar_on_pr(ar_on_pr),
.increment_pr(increment_pr),
.pr_on_data(pr_on_data),
.pr_on_add(pr_on_add),

//Internal IR related signals
.data_on_ir(data_on_ir),
.ir_on_data(ir_on_data),
.machine_code(machine_code), //used by controller for decoding instructions

//ALU related signals
.ALU_cin(ALU_cin),
.ALU_sel(ALU_sel),
.add_sel_a(add_sel_a),
.add_sel_b(add_sel_b),
.alu_2_data(alu_2_data),

//FLAG related signals
.load_FR_On_data (load_FR_On_data)

);



//--------------------------------------------------------------------------------------

Controller controller_instant (

//System related signals
.clk   (clk),
.rst (rst),
.rd_mem (rd),
.wr_mem (wrt),

//AR related signals
.crt_data_on_ar(data_on_ar),
.crt_ar_on_add(ar_on_add),
.crt_ar_on_data(ar_on_data),

//DR related signals
.crt_data_on_dr(data_on_dr),
.crt_dr_on_data(dr_on_data),

//GR related signals
.crt_lsb_on_gr(lsb_on_gr),
.crt_msb_on_gr(msb_on_gr),
.crt_gr_on_data(gr_on_data),

//PR related signals
.crt_ar_on_pr(ar_on_pr),
.crt_increment_pr(increment_pr),
.crt_pr_on_data(pr_on_data),
.crt_pr_on_add(pr_on_add),

//Internal IR related signals
.crt_data_on_ir(data_on_ir),
.crt_ir_on_data(ir_on_data),
.crt_machine_code(machine_code), //used by controller for decoding instructions

//ALU related signals
.crt_ALU_cin(ALU_cin),
.crt_ALU_sel(ALU_sel),
.crt_add_sel_a(add_sel_a),
.crt_add_sel_b(add_sel_b),
.crt_alu_2_data(alu_2_data),

//FLAG related signals
.crt_load_FR_On_data (load_FR_On_data)

);endmodule

//==========================================================================================================================

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
wire [7:0] alu_out;
wire [7:0] ir_2_bus;
wire [3:0] flag_2_data;
wire Cout;



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
.alu_out(alu_out),
.Cout(Cout)
);

FR_reg Flag_register(
.clk(clk),
.rst(rst),
.alu_output(alu_out),
.alu_cout(Cout),
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
assign data_bus = alu_2_data ? alu_out : 8'bzzzz_zzzz; 
assign data_bus = gr_on_data ? gr_2_bus : 8'bzzzzzzzz;
assign data_bus = load_FR_On_data ? {4'b0000,flag_2_data} : 8'bzzzzzzzz;
assign machine_code = ir_2_bus;



endmodule


//==========================================================================================================================

module Controller(clk,rst,rd_mem,wr_mem,crt_ar_on_pr,crt_pr_on_data,crt_pr_on_add,crt_increment_pr,crt_ir_on_data,crt_data_on_ir,crt_machine_code
,crt_ar_on_data,crt_data_on_ar,crt_ar_on_add,crt_alu_2_data,crt_gr_on_data,crt_lsb_on_gr,crt_msb_on_gr,crt_data_on_dr,crt_dr_on_data,crt_ALU_cin,crt_ALU_sel,crt_load_FR_On_data,crt_add_sel_a,crt_add_sel_b);

input clk,rst;
output reg rd_mem;
output reg wr_mem;

//Instruction opcodes
parameter NOP  = 4'b0000;
parameter JMP  = 4'b0001;
parameter RDM  = 4'b0010;
parameter WRM  = 4'b0011;
parameter CPR  = 4'b0100;
parameter ADD  = 4'b0101;
parameter SUB  = 4'b0110;
parameter LLS  = 4'b0111;
parameter LMS  = 4'b1000;
parameter CFR  = 4'b1001;



//For PR Register 
output reg crt_ar_on_pr;
output reg crt_pr_on_data;
output reg crt_pr_on_add;
output reg crt_increment_pr;

//For IR Register
output reg crt_ir_on_data;
output reg crt_data_on_ir;
input [7:0] crt_machine_code;

//For AR Register
output reg crt_ar_on_data;
output reg crt_data_on_ar;
output reg crt_ar_on_add;

// For GR Register
output reg crt_gr_on_data;
output reg crt_lsb_on_gr;
output reg crt_msb_on_gr;

// For DR Register
output reg crt_data_on_dr;
output reg crt_dr_on_data;

// For FR Register
output reg crt_load_FR_On_data;


//FOR ALU
output reg crt_alu_2_data;
output reg crt_ALU_cin;
output reg crt_ALU_sel;
output reg [1:0] crt_add_sel_a;
output reg [1:0] crt_add_sel_b;


//Register Assignment
parameter AR     = 2'b00;
parameter DR     = 2'b01;
parameter GR     = 2'b10;
parameter PR     = 2'b11;

//State
parameter RST = 2'b00;
parameter FETCH = 2'b01;
parameter DECODE = 2'b10;
parameter EXECUTE = 2'b11;

reg [1:0] present_state;
reg [1:0] next_state;


always @(posedge clk)
begin
	if(rst)
	present_state <= 2'b00;
	else
	present_state <= next_state;
end


always @(present_state or rst or crt_machine_code)
begin

rd_mem = 0;
wr_mem = 0;

		crt_ar_on_pr= 0;
		crt_ar_on_add = 0;
		crt_data_on_ar = 0;
		crt_pr_on_data= 0;
		crt_ar_on_data = 0;
		crt_ir_on_data = 0;
		crt_gr_on_data = 0;
		crt_dr_on_data = 0;

		crt_pr_on_add= 0;
		crt_increment_pr =0;
		
		crt_ALU_cin = 0;
		crt_ALU_sel = 0;
		crt_add_sel_a = 2'b00;
		crt_add_sel_b = 2'b00;
 		crt_alu_2_data = 0;
		
		crt_data_on_ir = 0;
		crt_load_FR_On_data = 0;
		crt_lsb_on_gr = 0;
		crt_msb_on_gr = 0;
		crt_data_on_dr = 0;
		
		crt_load_FR_On_data = 0;
		
case (present_state)

RST : 
		begin
		next_state = rst? 00 : 01;
		end
		
FETCH : 
			begin
			rd_mem = 1; 
         crt_pr_on_add = 1;
			crt_data_on_ir = 1;
			crt_increment_pr = 1;
			next_state = 10;
			end
			
DECODE : begin 
				next_state = 11;
			end

EXECUTE : begin
				next_state = FETCH;
			
			case(crt_machine_code[7:4])
			
			NOP : ;
			
			JMP : 
					begin
						crt_ar_on_pr = 1;
						crt_ar_on_data = 1;
					end
			CPR : 
					begin
						case(crt_machine_code[3:0])	// Source
					/*		00 : crt_ar_on_data = 1;
							01 : crt_dr_on_data = 1;
							10 : crt_gr_on_data = 1;
							11 : crt_pr_on_data = 1;
					endcase
					case(crt_machine_code[3:2])   							// Destination
							00 : crt_data_on_ar = 1;
							01 : crt_data_on_dr = 1;
							10 : begin crt_lsb_on_gr = 1; crt_msb_on_gr = 1; end
							11 : crt_ar_on_pr = 1;
					endcase
				end*/
					
					
					
					
						4'b0010 : 										 	//  D = AR & S = GR
									begin
											crt_data_on_ar = 1;
											crt_gr_on_data = 1;											
									end 	
						4'b0011 :											//  D = AR & S = PR
									begin
											crt_pr_on_data = 1;
											crt_data_on_ar = 1;
									end 							 
						4'b0001 :											//  D = AR & S = DR
									begin
											crt_dr_on_data = 1;
											crt_data_on_ar = 1;
									end 
						4'b1000 :											//  D = GR & S = AR
									begin
											crt_ar_on_data = 1;
											crt_lsb_on_gr = 1;
											crt_msb_on_gr = 1;
									end 
						4'b1011 :											//  D = GR & S = PR
									begin
											crt_pr_on_data = 1;
											crt_lsb_on_gr = 1;
											crt_msb_on_gr = 1;
									end 
						4'b1001 :											//  D = GR & S = DR
									begin
											crt_dr_on_data = 1;
											crt_lsb_on_gr = 1;
											crt_msb_on_gr = 1;
									end 
						4'b1100 :											//  D = PR & S = AR
									begin
											crt_ar_on_data = 1;
											crt_ar_on_pr = 1;
									end 
						4'b1101 :											//  D = PR & S = AR
									begin
											crt_ar_on_data = 1;
											crt_ar_on_pr = 1;
									end 
						4'b1110 :											//  D = PR & S = GR
									begin
											crt_gr_on_data = 1;
											crt_ar_on_pr = 1;
									end 
						4'b0100 :											//  D = DR & S = AR
									begin
											crt_ar_on_data = 1;
											crt_data_on_dr = 1;
									end
						4'b0110 :											//  D = DR & S = GR
									begin
											crt_gr_on_data = 1;
											crt_data_on_dr = 1;
									end
						4'b0111 :											//  D = DR & S = PR
									begin
											crt_pr_on_data = 1;
											crt_data_on_dr = 1;
									end 
									
						4'b0000 : ;    // INVALID
						4'b1111 : ;		// INVALID
						4'b0101 : ;		// INVALID
						4'b1010 : ;		// INVALID
						
						endcase
						end
						
			CFR : begin
							crt_load_FR_On_data = 1;
							crt_lsb_on_gr = 1;
					end
			
			
			LLS : 
					begin
						crt_ir_on_data = 1;
						crt_lsb_on_gr = 1; 
					end
				
			LMS : 
					begin
						crt_ir_on_data = 1;
						crt_msb_on_gr = 1;
					end
			
			CFR : 
					begin
						crt_load_FR_On_data = 1;
						crt_lsb_on_gr = 1;
					end
				
			WRM : 
					begin
						wr_mem = 1;
					
						case(crt_machine_code [3:2])
							
							2'b01 : 
									begin
										crt_dr_on_data = 1;
										crt_ar_on_add = 1;
									end
							2'b10 :
									begin
										crt_gr_on_data = 1;
										crt_ar_on_add = 1;
									end
							
							2'b11 :
									begin
										crt_pr_on_data = 1;	
										crt_ar_on_add = 1;
									end
							2'b00 : 
									begin
										crt_ar_on_data = 1;	
										crt_ar_on_add = 1;
									end			
						endcase
					end		
			RDM : 
					begin
						rd_mem = 1;
						crt_ar_on_add = 1;
						case(crt_machine_code [3:2])
							
							2'b01 : crt_data_on_dr = 1;
									
							2'b10 :begin
										crt_lsb_on_gr = 1;
										crt_msb_on_gr = 1;
									end
							2'b11 : crt_ar_on_pr = 1;
									
							2'b00 : crt_data_on_ar = 1;
											
					endcase
					end
			ADD : 
					begin
							crt_ALU_cin = 0;
							crt_ALU_sel = 0;
							crt_add_sel_a = crt_machine_code [3:2];
							crt_add_sel_b = crt_machine_code [1:0];
								
								crt_alu_2_data = 1;
								case (crt_machine_code [3:2])
								2'b00 : crt_data_on_ar = 1;
								2'b01 : crt_data_on_dr = 1;
								2'b10 : begin crt_lsb_on_gr = 1;
							              crt_msb_on_gr = 1;
									end								2'b11 : crt_ar_on_pr = 1;
							 endcase
							 

							
					end
			SUB : 
					begin crt_ALU_cin = 1;
					      crt_ALU_sel = 1; 
							
					      crt_add_sel_a = crt_machine_code [3:2];
							crt_add_sel_b = crt_machine_code [1:0];
									
								crt_alu_2_data = 1;	
								case (crt_machine_code [3:2])
								2'b00 : crt_data_on_ar = 1;
								2'b01 : crt_data_on_dr = 1;
								2'b10 : begin crt_lsb_on_gr = 1;
							              crt_msb_on_gr = 1;
									end
								2'b11 : crt_ar_on_pr = 1;
							 endcase
					end
							
			default : next_state = RST ;
			
			endcase
			end
			
endcase
end
endmodule


//==========================================================================================================================

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
full_adder f8(alu_out[7],Cout,a1[7],b1[7],C6,ALU_sel1);
endmodule

module full_adder(sum,cout,inp1,inp2,cin,sel);
input cin, inp1, inp2,sel;
output  sum,cout;
wire w1,w2,w3,w0;
xor x0(w0,inp2,sel);
//addsub as(.w_01(w0), .inp2_1(inp2), .sel2(sel));
xor x1(w1,inp1,w0);
xor x2(sum,w1,cin);
and a1(w2,inp1,w0);
and a2(w3,w1,cin);
or(cout,w2,w3);
endmodule


//==========================================================================================================================

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

//==========================================================================================================================

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

//==========================================================================================================================

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

//==========================================================================================================================

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

//==========================================================================================================================

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

//==========================================================================================================================

module FR_reg(clk,rst,alu_output,flag_reg,alu_2_data,alu_cout);

input clk,rst;
input alu_2_data;
input alu_cout;
input [7:0] alu_output;
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
			flag_reg[2] <= (alu_output[7]^ ~|alu_cout);		//Signed flag
			flag_reg[1] <= ~|alu_cout;								//Carry flag
			flag_reg[0] <= alu_output[7]^ ~|alu_cout;			//Overflow flag
		end	
	else 
	      flag_reg <= flag_reg; 
end

endmodule

//==========================================================================================================================



