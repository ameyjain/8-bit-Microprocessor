`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:40:48 11/01/2014 
// Design Name: 
// Module Name:    Controller 
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
