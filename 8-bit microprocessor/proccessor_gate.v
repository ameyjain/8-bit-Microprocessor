
module GR_reg ( clk, rst, lsb_on_gr, msb_on_gr, bus_2_gr, gr_2_bus );
  input [7:0] bus_2_gr;
  output [7:0] gr_2_bus;
  input clk, rst, lsb_on_gr, msb_on_gr;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n1;
  tri   [7:0] bus_2_gr;

  CAOR2X1 U21 ( .A(gr_2_bus[0]), .B(n3), .C(bus_2_gr[0]), .D(n4), .Z(n17) );
  CAOR2X1 U22 ( .A(gr_2_bus[1]), .B(n3), .C(bus_2_gr[1]), .D(n4), .Z(n18) );
  CAOR2X1 U23 ( .A(gr_2_bus[2]), .B(n3), .C(bus_2_gr[2]), .D(n4), .Z(n19) );
  CAOR2X1 U24 ( .A(gr_2_bus[3]), .B(n3), .C(bus_2_gr[3]), .D(n4), .Z(n20) );
  CFD1QXL \gr_2_bus_reg[7]  ( .D(n24), .CP(clk), .Q(gr_2_bus[7]) );
  CFD1QXL \gr_2_bus_reg[6]  ( .D(n23), .CP(clk), .Q(gr_2_bus[6]) );
  CFD1QXL \gr_2_bus_reg[3]  ( .D(n20), .CP(clk), .Q(gr_2_bus[3]) );
  CFD1QXL \gr_2_bus_reg[2]  ( .D(n19), .CP(clk), .Q(gr_2_bus[2]) );
  CFD1QXL \gr_2_bus_reg[5]  ( .D(n22), .CP(clk), .Q(gr_2_bus[5]) );
  CFD1QXL \gr_2_bus_reg[4]  ( .D(n21), .CP(clk), .Q(gr_2_bus[4]) );
  CFD1QXL \gr_2_bus_reg[1]  ( .D(n18), .CP(clk), .Q(gr_2_bus[1]) );
  CFD1QXL \gr_2_bus_reg[0]  ( .D(n17), .CP(clk), .Q(gr_2_bus[0]) );
  CANR2XL U2 ( .A(bus_2_gr[7]), .B(n8), .C(n9), .D(bus_2_gr[3]), .Z(n14) );
  CAN2X1 U3 ( .A(n16), .B(lsb_on_gr), .Z(n8) );
  CAN2X1 U4 ( .A(n16), .B(n1), .Z(n9) );
  CNR3XL U5 ( .A(n9), .B(rst), .C(n8), .Z(n7) );
  CNR2X1 U6 ( .A(lsb_on_gr), .B(rst), .Z(n3) );
  CNR2X1 U7 ( .A(n1), .B(rst), .Z(n4) );
  CNR2IX1 U8 ( .B(msb_on_gr), .A(rst), .Z(n16) );
  CND2X1 U9 ( .A(gr_2_bus[6]), .B(n7), .Z(n13) );
  CND2X1 U10 ( .A(n5), .B(n6), .Z(n21) );
  CANR2X1 U11 ( .A(bus_2_gr[4]), .B(n8), .C(n9), .D(bus_2_gr[0]), .Z(n5) );
  CND2X1 U12 ( .A(gr_2_bus[4]), .B(n7), .Z(n6) );
  CND2X1 U13 ( .A(n10), .B(n11), .Z(n22) );
  CANR2X1 U14 ( .A(bus_2_gr[5]), .B(n8), .C(n9), .D(bus_2_gr[1]), .Z(n10) );
  CND2X1 U15 ( .A(gr_2_bus[5]), .B(n7), .Z(n11) );
  CND2X1 U16 ( .A(n14), .B(n15), .Z(n24) );
  CND2X1 U17 ( .A(gr_2_bus[7]), .B(n7), .Z(n15) );
  CANR2X1 U18 ( .A(bus_2_gr[6]), .B(n8), .C(n9), .D(bus_2_gr[2]), .Z(n12) );
  CND2X1 U19 ( .A(n12), .B(n13), .Z(n23) );
  CIVX2 U20 ( .A(lsb_on_gr), .Z(n1) );
endmodule


module PR_reg_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  CHA1X1 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  CHA1X1 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  CHA1X1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  CHA1X1 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  CHA1X1 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CHA1X1 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CIVX2 U1 ( .A(A[0]), .Z(SUM[0]) );
  CEOX1 U2 ( .A(carry[7]), .B(A[7]), .Z(SUM[7]) );
endmodule


module PR_reg ( clk, rst, ar_on_pr, increment_pr, data_2_pr, pr_on_bus );
  input [7:0] data_2_pr;
  output [7:0] pr_on_bus;
  input clk, rst, ar_on_pr, increment_pr;
  wire   N5, N6, N7, N8, N9, N10, N11, N12, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27;
  tri   [7:0] data_2_pr;

  PR_reg_DW01_inc_0 add_870 ( .A(pr_on_bus), .SUM({N12, N11, N10, N9, N8, N7, 
        N6, N5}) );
  CFD1QXL \pr_on_bus_reg[6]  ( .D(n21), .CP(clk), .Q(pr_on_bus[6]) );
  CFD1QXL \pr_on_bus_reg[1]  ( .D(n26), .CP(clk), .Q(pr_on_bus[1]) );
  CFD1QXL \pr_on_bus_reg[2]  ( .D(n25), .CP(clk), .Q(pr_on_bus[2]) );
  CFD1QXL \pr_on_bus_reg[3]  ( .D(n24), .CP(clk), .Q(pr_on_bus[3]) );
  CFD1QXL \pr_on_bus_reg[0]  ( .D(n27), .CP(clk), .Q(pr_on_bus[0]) );
  CFD1QXL \pr_on_bus_reg[7]  ( .D(n20), .CP(clk), .Q(pr_on_bus[7]) );
  CFD1QXL \pr_on_bus_reg[4]  ( .D(n23), .CP(clk), .Q(pr_on_bus[4]) );
  CFD1QXL \pr_on_bus_reg[5]  ( .D(n22), .CP(clk), .Q(pr_on_bus[5]) );
  CANR2X1 U3 ( .A(N12), .B(n5), .C(data_2_pr[7]), .D(ar_on_pr), .Z(n2) );
  CND2XL U4 ( .A(pr_on_bus[0]), .B(n4), .Z(n19) );
  CANR2XL U5 ( .A(N5), .B(n5), .C(data_2_pr[0]), .D(ar_on_pr), .Z(n18) );
  CNR2IX1 U6 ( .B(increment_pr), .A(ar_on_pr), .Z(n5) );
  CNR3XL U7 ( .A(ar_on_pr), .B(n5), .C(rst), .Z(n4) );
  CND2X1 U8 ( .A(pr_on_bus[6]), .B(n4), .Z(n7) );
  CND2X1 U9 ( .A(n2), .B(n3), .Z(n20) );
  CND2X1 U10 ( .A(pr_on_bus[7]), .B(n4), .Z(n3) );
  CND2X1 U11 ( .A(n8), .B(n9), .Z(n22) );
  CANR2X1 U12 ( .A(N10), .B(n5), .C(data_2_pr[5]), .D(ar_on_pr), .Z(n8) );
  CND2X1 U13 ( .A(pr_on_bus[5]), .B(n4), .Z(n9) );
  CND2X1 U14 ( .A(n10), .B(n11), .Z(n23) );
  CANR2X1 U15 ( .A(N9), .B(n5), .C(data_2_pr[4]), .D(ar_on_pr), .Z(n10) );
  CND2X1 U16 ( .A(pr_on_bus[4]), .B(n4), .Z(n11) );
  CND2X1 U17 ( .A(n12), .B(n13), .Z(n24) );
  CANR2X1 U18 ( .A(N8), .B(n5), .C(data_2_pr[3]), .D(ar_on_pr), .Z(n12) );
  CND2X1 U19 ( .A(pr_on_bus[3]), .B(n4), .Z(n13) );
  CND2X1 U20 ( .A(n14), .B(n15), .Z(n25) );
  CANR2X1 U21 ( .A(N7), .B(n5), .C(data_2_pr[2]), .D(ar_on_pr), .Z(n14) );
  CND2X1 U22 ( .A(pr_on_bus[2]), .B(n4), .Z(n15) );
  CND2X1 U23 ( .A(n16), .B(n17), .Z(n26) );
  CANR2X1 U24 ( .A(N6), .B(n5), .C(data_2_pr[1]), .D(ar_on_pr), .Z(n16) );
  CND2X1 U25 ( .A(pr_on_bus[1]), .B(n4), .Z(n17) );
  CND2X1 U26 ( .A(n18), .B(n19), .Z(n27) );
  CANR2X1 U27 ( .A(N11), .B(n5), .C(data_2_pr[6]), .D(ar_on_pr), .Z(n6) );
  CND2X1 U28 ( .A(n6), .B(n7), .Z(n21) );
endmodule


module AR_reg ( clk, rst, data_on_ar, data_2_ar, ar_2_bus );
  inout [7:0] data_2_ar;
  output [7:0] ar_2_bus;
  input clk, rst, data_on_ar;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  tri   [7:0] data_2_ar;

  CAOR2X1 U4 ( .A(ar_2_bus[0]), .B(n2), .C(data_2_ar[0]), .D(n3), .Z(n4) );
  CAOR2X1 U5 ( .A(ar_2_bus[1]), .B(n2), .C(data_2_ar[1]), .D(n3), .Z(n5) );
  CAOR2X1 U6 ( .A(ar_2_bus[2]), .B(n2), .C(data_2_ar[2]), .D(n3), .Z(n6) );
  CAOR2X1 U7 ( .A(ar_2_bus[3]), .B(n2), .C(data_2_ar[3]), .D(n3), .Z(n7) );
  CAOR2X1 U8 ( .A(ar_2_bus[4]), .B(n2), .C(data_2_ar[4]), .D(n3), .Z(n8) );
  CAOR2X1 U9 ( .A(ar_2_bus[5]), .B(n2), .C(data_2_ar[5]), .D(n3), .Z(n9) );
  CAOR2X1 U10 ( .A(ar_2_bus[6]), .B(n2), .C(data_2_ar[6]), .D(n3), .Z(n10) );
  CFD1QXL \ar_2_bus_reg[7]  ( .D(n11), .CP(clk), .Q(ar_2_bus[7]) );
  CFD1QXL \ar_2_bus_reg[6]  ( .D(n10), .CP(clk), .Q(ar_2_bus[6]) );
  CFD1QXL \ar_2_bus_reg[5]  ( .D(n9), .CP(clk), .Q(ar_2_bus[5]) );
  CFD1QXL \ar_2_bus_reg[4]  ( .D(n8), .CP(clk), .Q(ar_2_bus[4]) );
  CFD1QXL \ar_2_bus_reg[3]  ( .D(n7), .CP(clk), .Q(ar_2_bus[3]) );
  CFD1QXL \ar_2_bus_reg[2]  ( .D(n6), .CP(clk), .Q(ar_2_bus[2]) );
  CFD1QXL \ar_2_bus_reg[1]  ( .D(n5), .CP(clk), .Q(ar_2_bus[1]) );
  CFD1QXL \ar_2_bus_reg[0]  ( .D(n4), .CP(clk), .Q(ar_2_bus[0]) );
  CAOR2XL U2 ( .A(ar_2_bus[7]), .B(n2), .C(data_2_ar[7]), .D(n3), .Z(n11) );
  CNR2X1 U3 ( .A(rst), .B(n3), .Z(n2) );
  CNR2IX1 U11 ( .B(data_on_ar), .A(rst), .Z(n3) );
endmodule


module DR_reg ( clk, rst, data_on_dr, bus_2_dr, dr_2_bus );
  input [7:0] bus_2_dr;
  output [7:0] dr_2_bus;
  input clk, rst, data_on_dr;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10;
  tri   [7:0] bus_2_dr;

  CAOR2X1 U4 ( .A(data_on_dr), .B(bus_2_dr[0]), .C(dr_2_bus[0]), .D(n2), .Z(n3) );
  CAOR2X1 U5 ( .A(bus_2_dr[1]), .B(data_on_dr), .C(dr_2_bus[1]), .D(n2), .Z(n4) );
  CAOR2X1 U6 ( .A(bus_2_dr[2]), .B(data_on_dr), .C(dr_2_bus[2]), .D(n2), .Z(n5) );
  CAOR2X1 U7 ( .A(bus_2_dr[3]), .B(data_on_dr), .C(dr_2_bus[3]), .D(n2), .Z(n6) );
  CAOR2X1 U8 ( .A(bus_2_dr[4]), .B(data_on_dr), .C(dr_2_bus[4]), .D(n2), .Z(n7) );
  CAOR2X1 U9 ( .A(bus_2_dr[5]), .B(data_on_dr), .C(dr_2_bus[5]), .D(n2), .Z(n8) );
  CAOR2X1 U10 ( .A(bus_2_dr[6]), .B(data_on_dr), .C(dr_2_bus[6]), .D(n2), .Z(
        n9) );
  CFD1QXL \dr_2_bus_reg[7]  ( .D(n10), .CP(clk), .Q(dr_2_bus[7]) );
  CFD1QXL \dr_2_bus_reg[6]  ( .D(n9), .CP(clk), .Q(dr_2_bus[6]) );
  CFD1QXL \dr_2_bus_reg[5]  ( .D(n8), .CP(clk), .Q(dr_2_bus[5]) );
  CFD1QXL \dr_2_bus_reg[4]  ( .D(n7), .CP(clk), .Q(dr_2_bus[4]) );
  CFD1QXL \dr_2_bus_reg[3]  ( .D(n6), .CP(clk), .Q(dr_2_bus[3]) );
  CFD1QXL \dr_2_bus_reg[2]  ( .D(n5), .CP(clk), .Q(dr_2_bus[2]) );
  CFD1QXL \dr_2_bus_reg[1]  ( .D(n4), .CP(clk), .Q(dr_2_bus[1]) );
  CFD1QXL \dr_2_bus_reg[0]  ( .D(n3), .CP(clk), .Q(dr_2_bus[0]) );
  CAOR2XL U3 ( .A(bus_2_dr[7]), .B(data_on_dr), .C(dr_2_bus[7]), .D(n2), .Z(
        n10) );
  CNR2X1 U11 ( .A(rst), .B(data_on_dr), .Z(n2) );
endmodule


module IR_reg ( clk, rst, data_on_ir, data_2_ir, ir_2_bus );
  input [7:0] data_2_ir;
  output [7:0] ir_2_bus;
  input clk, rst, data_on_ir;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10;
  tri   [7:0] data_2_ir;

  CAOR2X1 U5 ( .A(data_2_ir[1]), .B(data_on_ir), .C(ir_2_bus[1]), .D(n2), .Z(
        n4) );
  CAOR2X1 U6 ( .A(data_2_ir[2]), .B(data_on_ir), .C(ir_2_bus[2]), .D(n2), .Z(
        n5) );
  CAOR2X1 U7 ( .A(data_2_ir[3]), .B(data_on_ir), .C(ir_2_bus[3]), .D(n2), .Z(
        n6) );
  CAOR2X1 U9 ( .A(data_2_ir[5]), .B(data_on_ir), .C(ir_2_bus[5]), .D(n2), .Z(
        n8) );
  CFD1QXL \ir_2_bus_reg[1]  ( .D(n4), .CP(clk), .Q(ir_2_bus[1]) );
  CFD1QXL \ir_2_bus_reg[3]  ( .D(n6), .CP(clk), .Q(ir_2_bus[3]) );
  CFD1QXL \ir_2_bus_reg[0]  ( .D(n3), .CP(clk), .Q(ir_2_bus[0]) );
  CFD1QXL \ir_2_bus_reg[2]  ( .D(n5), .CP(clk), .Q(ir_2_bus[2]) );
  CFD1QX2 \ir_2_bus_reg[6]  ( .D(n9), .CP(clk), .Q(ir_2_bus[6]) );
  CFD1QX1 \ir_2_bus_reg[7]  ( .D(n10), .CP(clk), .Q(ir_2_bus[7]) );
  CFD1QX1 \ir_2_bus_reg[5]  ( .D(n8), .CP(clk), .Q(ir_2_bus[5]) );
  CFD1QX1 \ir_2_bus_reg[4]  ( .D(n7), .CP(clk), .Q(ir_2_bus[4]) );
  CAOR2XL U3 ( .A(data_2_ir[7]), .B(data_on_ir), .C(ir_2_bus[7]), .D(n2), .Z(
        n10) );
  CAOR2XL U4 ( .A(data_on_ir), .B(data_2_ir[0]), .C(ir_2_bus[0]), .D(n2), .Z(
        n3) );
  CNR2X1 U8 ( .A(rst), .B(data_on_ir), .Z(n2) );
  CAOR2XL U10 ( .A(data_2_ir[6]), .B(data_on_ir), .C(ir_2_bus[6]), .D(n2), .Z(
        n9) );
  CAOR2XL U11 ( .A(data_2_ir[4]), .B(data_on_ir), .C(ir_2_bus[4]), .D(n2), .Z(
        n7) );
endmodule


module full_adder_0 ( sum, cout, inp1, inp2, cin, sel );
  input inp1, inp2, cin, sel;
  output sum, cout;
  wire   n3, n4, n1, n2, n5, n6;

  COND2X2 U2 ( .A(n5), .B(n2), .C(n3), .D(n6), .Z(cout) );
  CEOX2 U3 ( .A(inp1), .B(n4), .Z(n3) );
  CENX2 U4 ( .A(sel), .B(inp2), .Z(n4) );
  CNIVXL U1 ( .A(n3), .Z(n1) );
  CEOXL U5 ( .A(n1), .B(n6), .Z(sum) );
  CENXL U6 ( .A(sel), .B(inp2), .Z(n2) );
  CIVX2 U7 ( .A(inp1), .Z(n5) );
  CIVX2 U8 ( .A(cin), .Z(n6) );
endmodule


module full_adder_7 ( sum, cout, inp1, inp2, cin, sel );
  input inp1, inp2, cin, sel;
  output sum, cout;
  wire   n1, n2, n5, n6;

  COND2X2 U2 ( .A(n5), .B(n2), .C(n6), .D(n1), .Z(cout) );
  CEOX2 U3 ( .A(inp1), .B(n5), .Z(n6) );
  CENX1 U1 ( .A(sel), .B(inp2), .Z(n5) );
  CEOXL U4 ( .A(n6), .B(n1), .Z(sum) );
  CIVX2 U5 ( .A(cin), .Z(n1) );
  CIVX2 U6 ( .A(inp1), .Z(n2) );
endmodule


module full_adder_6 ( sum, cout, inp1, inp2, cin, sel );
  input inp1, inp2, cin, sel;
  output sum, cout;
  wire   n1, n2, n5, n6;

  COND2X2 U2 ( .A(n5), .B(n2), .C(n1), .D(n6), .Z(cout) );
  CEOXL U1 ( .A(n6), .B(n1), .Z(sum) );
  CEOX1 U3 ( .A(inp1), .B(n5), .Z(n6) );
  CENX1 U4 ( .A(sel), .B(inp2), .Z(n5) );
  CIVX2 U5 ( .A(cin), .Z(n1) );
  CIVX2 U6 ( .A(inp1), .Z(n2) );
endmodule


module full_adder_5 ( sum, cout, inp1, inp2, cin, sel );
  input inp1, inp2, cin, sel;
  output sum, cout;
  wire   n1, n2, n5, n6;

  COND2X2 U2 ( .A(n5), .B(n2), .C(n1), .D(n6), .Z(cout) );
  CEOX1 U1 ( .A(inp1), .B(n5), .Z(n6) );
  CENX1 U3 ( .A(sel), .B(inp2), .Z(n5) );
  CEOXL U4 ( .A(n6), .B(n1), .Z(sum) );
  CIVX2 U5 ( .A(cin), .Z(n1) );
  CIVX2 U6 ( .A(inp1), .Z(n2) );
endmodule


module full_adder_4 ( sum, cout, inp1, inp2, cin, sel );
  input inp1, inp2, cin, sel;
  output sum, cout;
  wire   n1, n2, n5, n6;

  COND2X2 U2 ( .A(n5), .B(n2), .C(n6), .D(n1), .Z(cout) );
  CEOXL U1 ( .A(n6), .B(n1), .Z(sum) );
  CENX1 U3 ( .A(sel), .B(inp2), .Z(n5) );
  CEOX1 U4 ( .A(inp1), .B(n5), .Z(n6) );
  CIVX2 U5 ( .A(cin), .Z(n1) );
  CIVX2 U6 ( .A(inp1), .Z(n2) );
endmodule


module full_adder_3 ( sum, cout, inp1, inp2, cin, sel );
  input inp1, inp2, cin, sel;
  output sum, cout;
  wire   n1, n2, n5, n6, n7;

  COND2X2 U2 ( .A(n6), .B(n5), .C(n7), .D(n2), .Z(cout) );
  CEOX1 U1 ( .A(n7), .B(n1), .Z(sum) );
  CIVXL U3 ( .A(cin), .Z(n1) );
  CENX1 U4 ( .A(sel), .B(inp2), .Z(n6) );
  CEOX1 U5 ( .A(inp1), .B(n6), .Z(n7) );
  CIVX2 U6 ( .A(cin), .Z(n2) );
  CIVX2 U7 ( .A(inp1), .Z(n5) );
endmodule


module full_adder_2 ( sum, cout, inp1, inp2, cin, sel );
  input inp1, inp2, cin, sel;
  output sum, cout;
  wire   n1, n2, n5, n6, n7;

  CAOR2X1 U1 ( .A(n1), .B(inp1), .C(n2), .D(cin), .Z(cout) );
  CIVX2 U2 ( .A(n6), .Z(n1) );
  CIVX1 U3 ( .A(n7), .Z(n2) );
  CENX1 U4 ( .A(sel), .B(inp2), .Z(n6) );
  CEOX1 U5 ( .A(inp1), .B(n6), .Z(n7) );
  CEOXL U6 ( .A(n7), .B(n5), .Z(sum) );
  CIVX2 U7 ( .A(cin), .Z(n5) );
endmodule


module full_adder_1 ( sum, cout, inp1, inp2, cin, sel );
  input inp1, inp2, cin, sel;
  output sum, cout;
  wire   n1, n2, n5, n6, n7, n8;

  CND2X2 U1 ( .A(n1), .B(n2), .Z(sum) );
  CENX1 U2 ( .A(sel), .B(inp2), .Z(n7) );
  COND2X1 U3 ( .A(n7), .B(n6), .C(n8), .D(n5), .Z(cout) );
  CND2IX1 U4 ( .B(n8), .A(n5), .Z(n2) );
  CND2XL U5 ( .A(n8), .B(cin), .Z(n1) );
  CEOX1 U6 ( .A(inp1), .B(n7), .Z(n8) );
  CIVX2 U7 ( .A(cin), .Z(n5) );
  CIVX2 U8 ( .A(inp1), .Z(n6) );
endmodule


module ALU ( clk, rst, a1, b1, ALU_cin1, ALU_sel1, alu_out, Cout );
  input [7:0] a1;
  input [7:0] b1;
  output [7:0] alu_out;
  input clk, rst, ALU_cin1, ALU_sel1;
  output Cout;
  wire   C0, C1, C2, C3, C4, C5, C6;

  full_adder_0 f1 ( .sum(alu_out[0]), .cout(C0), .inp1(a1[0]), .inp2(b1[0]), 
        .cin(ALU_cin1), .sel(ALU_sel1) );
  full_adder_7 f2 ( .sum(alu_out[1]), .cout(C1), .inp1(a1[1]), .inp2(b1[1]), 
        .cin(C0), .sel(ALU_sel1) );
  full_adder_6 f3 ( .sum(alu_out[2]), .cout(C2), .inp1(a1[2]), .inp2(b1[2]), 
        .cin(C1), .sel(ALU_sel1) );
  full_adder_5 f4 ( .sum(alu_out[3]), .cout(C3), .inp1(a1[3]), .inp2(b1[3]), 
        .cin(C2), .sel(ALU_sel1) );
  full_adder_4 f5 ( .sum(alu_out[4]), .cout(C4), .inp1(a1[4]), .inp2(b1[4]), 
        .cin(C3), .sel(ALU_sel1) );
  full_adder_3 f6 ( .sum(alu_out[5]), .cout(C5), .inp1(a1[5]), .inp2(b1[5]), 
        .cin(C4), .sel(ALU_sel1) );
  full_adder_2 f7 ( .sum(alu_out[6]), .cout(C6), .inp1(a1[6]), .inp2(b1[6]), 
        .cin(C5), .sel(ALU_sel1) );
  full_adder_1 f8 ( .sum(alu_out[7]), .cout(Cout), .inp1(a1[7]), .inp2(b1[7]), 
        .cin(C6), .sel(ALU_sel1) );
endmodule


module FR_reg ( clk, rst, alu_output, flag_reg, alu_2_data, alu_cout );
  input [7:0] alu_output;
  output [3:0] flag_reg;
  input clk, rst, alu_2_data, alu_cout;
  wire   n4, n5, n6, n7, n10, n11, n12, n13, n1, n2, n3, n8, n9, n14, n15, n16,
         n17, n18;

  CAOR1X1 U8 ( .A(flag_reg[0]), .B(n4), .C(n5), .Z(n10) );
  CAOR2X1 U9 ( .A(flag_reg[1]), .B(n4), .C(n6), .D(n18), .Z(n11) );
  CAOR1X1 U10 ( .A(flag_reg[2]), .B(n4), .C(n5), .Z(n12) );
  CFD1QXL \flag_reg_reg[0]  ( .D(n10), .CP(clk), .Q(flag_reg[0]) );
  CFD1QXL \flag_reg_reg[3]  ( .D(n13), .CP(clk), .Q(flag_reg[3]) );
  CFD1QXL \flag_reg_reg[1]  ( .D(n11), .CP(clk), .Q(flag_reg[1]) );
  CFD1QXL \flag_reg_reg[2]  ( .D(n12), .CP(clk), .Q(flag_reg[2]) );
  CNR2XL U2 ( .A(alu_output[6]), .B(alu_output[7]), .Z(n17) );
  CENX1 U3 ( .A(alu_output[7]), .B(alu_cout), .Z(n7) );
  CIVXL U4 ( .A(alu_cout), .Z(n18) );
  CIVX2 U5 ( .A(alu_output[3]), .Z(n9) );
  CIVX2 U6 ( .A(alu_output[4]), .Z(n8) );
  CIVX2 U7 ( .A(alu_output[1]), .Z(n15) );
  CIVX2 U11 ( .A(alu_output[2]), .Z(n14) );
  CIVX2 U12 ( .A(alu_output[5]), .Z(n3) );
  CNR2X1 U13 ( .A(n4), .B(rst), .Z(n6) );
  CIVX2 U14 ( .A(alu_output[0]), .Z(n16) );
  CND2IX1 U15 ( .B(n2), .A(n1), .Z(n13) );
  CND8X1 U16 ( .A(n3), .B(n17), .C(n8), .D(n9), .E(n14), .F(n15), .G(n16), .H(
        n6), .Z(n1) );
  CAN2X1 U17 ( .A(n7), .B(n6), .Z(n5) );
  CAN2X1 U18 ( .A(flag_reg[3]), .B(n4), .Z(n2) );
  CNR2XL U19 ( .A(alu_2_data), .B(rst), .Z(n4) );
endmodule


module data_block ( clk, rst, ar_on_pr, pr_on_data, pr_on_add, increment_pr, 
        data_bus, address_bus, ir_on_data, data_on_ir, machine_code, 
        ar_on_data, data_on_ar, ar_on_add, gr_on_data, lsb_on_gr, msb_on_gr, 
        data_on_dr, dr_on_data, ALU_cin, ALU_sel, load_FR_On_data, alu_2_data, 
        add_sel_b, add_sel_a );
  inout [7:0] data_bus;
  output [7:0] address_bus;
  output [7:0] machine_code;
  input [1:0] add_sel_b;
  input [1:0] add_sel_a;
  input clk, rst, ar_on_pr, pr_on_data, pr_on_add, increment_pr, ir_on_data,
         data_on_ir, ar_on_data, data_on_ar, ar_on_add, gr_on_data, lsb_on_gr,
         msb_on_gr, data_on_dr, dr_on_data, ALU_cin, ALU_sel, load_FR_On_data,
         alu_2_data;
  wire   Cout, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n183, n185, n186, n187, n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11;
  wire   [7:0] gr_2_bus;
  wire   [7:0] pr_on_bus;
  wire   [7:0] ar_2_bus;
  wire   [7:0] dr_2_bus;
  wire   [7:0] mux_o1;
  wire   [7:0] mux_o2;
  wire   [7:0] alu_out;
  wire   [3:0] flag_2_data;
  tri   [7:0] data_bus;
  tri   [7:0] address_bus;

  CTSX2 \data_bus_tri7[0]  ( .A(flag_2_data[0]), .E(load_FR_On_data), .Z(
        data_bus[0]) );
  CTSX2 \data_bus_tri7[1]  ( .A(flag_2_data[1]), .E(load_FR_On_data), .Z(
        data_bus[1]) );
  CTSX2 \data_bus_tri7[2]  ( .A(flag_2_data[2]), .E(load_FR_On_data), .Z(
        data_bus[2]) );
  CTSX2 \data_bus_tri7[3]  ( .A(flag_2_data[3]), .E(load_FR_On_data), .Z(
        data_bus[3]) );
  CTSX2 \data_bus_tri7[4]  ( .A(1'b0), .E(load_FR_On_data), .Z(data_bus[4]) );
  CTSX2 \data_bus_tri7[5]  ( .A(1'b0), .E(load_FR_On_data), .Z(data_bus[5]) );
  CTSX2 \data_bus_tri7[6]  ( .A(1'b0), .E(load_FR_On_data), .Z(data_bus[6]) );
  CTSX2 \data_bus_tri6[0]  ( .A(gr_2_bus[0]), .E(gr_on_data), .Z(data_bus[0])
         );
  CTSX2 \data_bus_tri6[1]  ( .A(gr_2_bus[1]), .E(gr_on_data), .Z(data_bus[1])
         );
  CTSX2 \data_bus_tri6[2]  ( .A(gr_2_bus[2]), .E(gr_on_data), .Z(data_bus[2])
         );
  CTSX2 \data_bus_tri6[3]  ( .A(gr_2_bus[3]), .E(gr_on_data), .Z(data_bus[3])
         );
  CTSX2 \data_bus_tri6[4]  ( .A(gr_2_bus[4]), .E(gr_on_data), .Z(data_bus[4])
         );
  CTSX2 \data_bus_tri6[5]  ( .A(gr_2_bus[5]), .E(gr_on_data), .Z(data_bus[5])
         );
  CTSX2 \data_bus_tri6[6]  ( .A(gr_2_bus[6]), .E(gr_on_data), .Z(data_bus[6])
         );
  CTSX2 \data_bus_tri4[0]  ( .A(dr_2_bus[0]), .E(dr_on_data), .Z(data_bus[0])
         );
  CTSX2 \data_bus_tri4[1]  ( .A(dr_2_bus[1]), .E(dr_on_data), .Z(data_bus[1])
         );
  CTSX2 \data_bus_tri4[2]  ( .A(dr_2_bus[2]), .E(dr_on_data), .Z(data_bus[2])
         );
  CTSX2 \data_bus_tri4[3]  ( .A(dr_2_bus[3]), .E(dr_on_data), .Z(data_bus[3])
         );
  CTSX2 \data_bus_tri4[4]  ( .A(dr_2_bus[4]), .E(dr_on_data), .Z(data_bus[4])
         );
  CTSX2 \data_bus_tri4[5]  ( .A(dr_2_bus[5]), .E(dr_on_data), .Z(data_bus[5])
         );
  CTSX2 \data_bus_tri4[6]  ( .A(dr_2_bus[6]), .E(dr_on_data), .Z(data_bus[6])
         );
  CTSX2 \data_bus_tri3[0]  ( .A(ar_2_bus[0]), .E(ar_on_data), .Z(data_bus[0])
         );
  CTSX2 \data_bus_tri3[1]  ( .A(ar_2_bus[1]), .E(ar_on_data), .Z(data_bus[1])
         );
  CTSX2 \data_bus_tri3[2]  ( .A(ar_2_bus[2]), .E(ar_on_data), .Z(data_bus[2])
         );
  CTSX2 \data_bus_tri3[3]  ( .A(ar_2_bus[3]), .E(ar_on_data), .Z(data_bus[3])
         );
  CTSX2 \data_bus_tri3[4]  ( .A(ar_2_bus[4]), .E(ar_on_data), .Z(data_bus[4])
         );
  CTSX2 \data_bus_tri3[5]  ( .A(ar_2_bus[5]), .E(ar_on_data), .Z(data_bus[5])
         );
  CTSX2 \data_bus_tri3[6]  ( .A(ar_2_bus[6]), .E(ar_on_data), .Z(data_bus[6])
         );
  CTSX2 \data_bus_tri2[0]  ( .A(pr_on_bus[0]), .E(pr_on_data), .Z(data_bus[0])
         );
  CTSX2 \data_bus_tri2[1]  ( .A(pr_on_bus[1]), .E(pr_on_data), .Z(data_bus[1])
         );
  CTSX2 \data_bus_tri2[2]  ( .A(pr_on_bus[2]), .E(pr_on_data), .Z(data_bus[2])
         );
  CTSX2 \data_bus_tri2[3]  ( .A(pr_on_bus[3]), .E(pr_on_data), .Z(data_bus[3])
         );
  CTSX2 \data_bus_tri2[4]  ( .A(pr_on_bus[4]), .E(pr_on_data), .Z(data_bus[4])
         );
  CTSX2 \data_bus_tri2[5]  ( .A(pr_on_bus[5]), .E(pr_on_data), .Z(data_bus[5])
         );
  CTSX2 \data_bus_tri2[6]  ( .A(pr_on_bus[6]), .E(pr_on_data), .Z(data_bus[6])
         );
  CTSX2 \data_bus_tri[0]  ( .A(machine_code[0]), .E(ir_on_data), .Z(
        data_bus[0]) );
  CTSX2 \data_bus_tri[1]  ( .A(machine_code[1]), .E(ir_on_data), .Z(
        data_bus[1]) );
  CTSX2 \data_bus_tri[2]  ( .A(machine_code[2]), .E(ir_on_data), .Z(
        data_bus[2]) );
  CTSX2 \data_bus_tri[3]  ( .A(machine_code[3]), .E(ir_on_data), .Z(
        data_bus[3]) );
  CTSX2 \address_bus_tri2[0]  ( .A(ar_2_bus[0]), .E(ar_on_add), .Z(
        address_bus[0]) );
  CTSX2 \address_bus_tri2[1]  ( .A(ar_2_bus[1]), .E(ar_on_add), .Z(
        address_bus[1]) );
  CTSX2 \address_bus_tri2[2]  ( .A(ar_2_bus[2]), .E(ar_on_add), .Z(
        address_bus[2]) );
  CTSX2 \address_bus_tri2[3]  ( .A(ar_2_bus[3]), .E(ar_on_add), .Z(
        address_bus[3]) );
  CTSX2 \address_bus_tri2[4]  ( .A(ar_2_bus[4]), .E(ar_on_add), .Z(
        address_bus[4]) );
  CTSX2 \address_bus_tri2[5]  ( .A(ar_2_bus[5]), .E(ar_on_add), .Z(
        address_bus[5]) );
  CTSX2 \address_bus_tri2[6]  ( .A(ar_2_bus[6]), .E(ar_on_add), .Z(
        address_bus[6]) );
  CTSX2 \address_bus_tri2[7]  ( .A(ar_2_bus[7]), .E(ar_on_add), .Z(
        address_bus[7]) );
  CTSX2 \address_bus_tri[0]  ( .A(pr_on_bus[0]), .E(pr_on_add), .Z(
        address_bus[0]) );
  CTSX2 \address_bus_tri[1]  ( .A(pr_on_bus[1]), .E(pr_on_add), .Z(
        address_bus[1]) );
  CTSX2 \address_bus_tri[2]  ( .A(pr_on_bus[2]), .E(pr_on_add), .Z(
        address_bus[2]) );
  CTSX2 \address_bus_tri[3]  ( .A(pr_on_bus[3]), .E(pr_on_add), .Z(
        address_bus[3]) );
  CTSX2 \address_bus_tri[4]  ( .A(pr_on_bus[4]), .E(pr_on_add), .Z(
        address_bus[4]) );
  CTSX2 \address_bus_tri[5]  ( .A(pr_on_bus[5]), .E(pr_on_add), .Z(
        address_bus[5]) );
  CTSX2 \address_bus_tri[6]  ( .A(pr_on_bus[6]), .E(pr_on_add), .Z(
        address_bus[6]) );
  CTSX2 \address_bus_tri[7]  ( .A(pr_on_bus[7]), .E(pr_on_add), .Z(
        address_bus[7]) );
  CNR2X2 U28 ( .A(n8), .B(add_sel_b[0]), .Z(n151) );
  GR_reg General_register ( .clk(clk), .rst(rst), .lsb_on_gr(lsb_on_gr), 
        .msb_on_gr(msb_on_gr), .bus_2_gr(data_bus), .gr_2_bus(gr_2_bus) );
  PR_reg Program_counter ( .clk(clk), .rst(rst), .ar_on_pr(ar_on_pr), 
        .increment_pr(increment_pr), .data_2_pr(data_bus), .pr_on_bus(
        pr_on_bus) );
  AR_reg Address_register ( .clk(clk), .rst(rst), .data_on_ar(data_on_ar), 
        .data_2_ar(data_bus), .ar_2_bus(ar_2_bus) );
  DR_reg Data_register ( .clk(clk), .rst(rst), .data_on_dr(data_on_dr), 
        .bus_2_dr(data_bus), .dr_2_bus(dr_2_bus) );
  IR_reg Instruction_register ( .clk(clk), .rst(rst), .data_on_ir(data_on_ir), 
        .data_2_ir(data_bus), .ir_2_bus(machine_code) );
  ALU new_alu ( .clk(clk), .rst(rst), .a1(mux_o1), .b1(mux_o2), .ALU_cin1(
        ALU_cin), .ALU_sel1(ALU_sel), .alu_out(alu_out), .Cout(Cout) );
  FR_reg Flag_register ( .clk(clk), .rst(rst), .alu_output(alu_out), 
        .flag_reg(flag_2_data), .alu_2_data(alu_2_data), .alu_cout(Cout) );
  CTSXL \data_bus_tri[4]  ( .A(machine_code[4]), .E(ir_on_data), .Z(
        data_bus[4]) );
  CTSXL \data_bus_tri[5]  ( .A(machine_code[5]), .E(ir_on_data), .Z(
        data_bus[5]) );
  CTSXL \data_bus_tri[6]  ( .A(machine_code[6]), .E(ir_on_data), .Z(
        data_bus[6]) );
  CTSX2 \data_bus_tri5[2]  ( .A(alu_out[2]), .E(alu_2_data), .Z(data_bus[2])
         );
  CTSX2 \data_bus_tri5[3]  ( .A(alu_out[3]), .E(alu_2_data), .Z(data_bus[3])
         );
  CTSX2 \data_bus_tri5[1]  ( .A(alu_out[1]), .E(alu_2_data), .Z(data_bus[1])
         );
  CTSX2 \data_bus_tri5[0]  ( .A(alu_out[0]), .E(alu_2_data), .Z(data_bus[0])
         );
  CTSX2 \data_bus_tri5[4]  ( .A(alu_out[4]), .E(alu_2_data), .Z(data_bus[4])
         );
  CTSXL \data_bus_tri[7]  ( .A(machine_code[7]), .E(ir_on_data), .Z(
        data_bus[7]) );
  CTSXL \data_bus_tri2[7]  ( .A(pr_on_bus[7]), .E(pr_on_data), .Z(data_bus[7])
         );
  CTSXL \data_bus_tri3[7]  ( .A(ar_2_bus[7]), .E(ar_on_data), .Z(data_bus[7])
         );
  CTSXL \data_bus_tri4[7]  ( .A(dr_2_bus[7]), .E(dr_on_data), .Z(data_bus[7])
         );
  CTSXL \data_bus_tri6[7]  ( .A(gr_2_bus[7]), .E(gr_on_data), .Z(data_bus[7])
         );
  CTSXL \data_bus_tri7[7]  ( .A(1'b0), .E(load_FR_On_data), .Z(data_bus[7]) );
  CTSX2 \data_bus_tri5[7]  ( .A(alu_out[7]), .E(alu_2_data), .Z(data_bus[7])
         );
  CTSX2 \data_bus_tri5[6]  ( .A(alu_out[6]), .E(alu_2_data), .Z(data_bus[6])
         );
  CTSX2 \data_bus_tri5[5]  ( .A(alu_out[5]), .E(alu_2_data), .Z(data_bus[5])
         );
  CNR2X1 U2 ( .A(n9), .B(add_sel_b[1]), .Z(n149) );
  CANR2X1 U3 ( .A(n148), .B(ar_2_bus[0]), .C(dr_2_bus[0]), .D(n149), .Z(n165)
         );
  CND2X1 U4 ( .A(n186), .B(n187), .Z(mux_o1[0]) );
  CAN2X1 U5 ( .A(add_sel_b[1]), .B(add_sel_b[0]), .Z(n150) );
  CIVX2 U6 ( .A(add_sel_b[0]), .Z(n9) );
  CIVX1 U7 ( .A(add_sel_a[0]), .Z(n11) );
  CNR2X1 U8 ( .A(n10), .B(n11), .Z(n172) );
  CNIVX1 U9 ( .A(n2), .Z(n1) );
  CNIVXL U10 ( .A(n151), .Z(n2) );
  CNIVXL U11 ( .A(n149), .Z(n3) );
  CNR2XL U12 ( .A(add_sel_a[0]), .B(add_sel_a[1]), .Z(n4) );
  CNR2X1 U13 ( .A(n11), .B(add_sel_a[1]), .Z(n171) );
  CIVX2 U14 ( .A(add_sel_a[1]), .Z(n10) );
  CNR2XL U15 ( .A(n10), .B(add_sel_a[0]), .Z(n5) );
  CNR2XL U16 ( .A(n10), .B(add_sel_a[0]), .Z(n173) );
  CND2IX1 U17 ( .B(n6), .A(n183), .Z(mux_o1[2]) );
  CAOR2XL U18 ( .A(n172), .B(pr_on_bus[2]), .C(n5), .D(gr_2_bus[2]), .Z(n6) );
  CND2IX1 U19 ( .B(n7), .A(n185), .Z(mux_o1[1]) );
  CAOR2XL U20 ( .A(n172), .B(pr_on_bus[1]), .C(n173), .D(gr_2_bus[1]), .Z(n7)
         );
  CNR2XL U21 ( .A(add_sel_a[0]), .B(add_sel_a[1]), .Z(n170) );
  CND2X1 U22 ( .A(n160), .B(n161), .Z(mux_o2[2]) );
  CND2X1 U23 ( .A(n158), .B(n159), .Z(mux_o2[3]) );
  CND2X1 U24 ( .A(n156), .B(n157), .Z(mux_o2[4]) );
  CND2X1 U25 ( .A(n154), .B(n155), .Z(mux_o2[5]) );
  CANR2X1 U26 ( .A(ar_2_bus[0]), .B(n170), .C(dr_2_bus[0]), .D(n171), .Z(n187)
         );
  CND2X1 U27 ( .A(n180), .B(n181), .Z(mux_o1[3]) );
  CANR2XL U29 ( .A(n172), .B(pr_on_bus[3]), .C(n5), .D(gr_2_bus[3]), .Z(n180)
         );
  CND2X1 U30 ( .A(n178), .B(n179), .Z(mux_o1[4]) );
  CANR2XL U31 ( .A(n172), .B(pr_on_bus[4]), .C(n5), .D(gr_2_bus[4]), .Z(n178)
         );
  CND2X1 U32 ( .A(n152), .B(n153), .Z(mux_o2[6]) );
  CND2X1 U33 ( .A(n146), .B(n147), .Z(mux_o2[7]) );
  CND2X1 U34 ( .A(n176), .B(n177), .Z(mux_o1[5]) );
  CANR2XL U35 ( .A(n172), .B(pr_on_bus[5]), .C(n5), .D(gr_2_bus[5]), .Z(n176)
         );
  CND2X1 U36 ( .A(n174), .B(n175), .Z(mux_o1[6]) );
  CANR2XL U37 ( .A(n172), .B(pr_on_bus[6]), .C(n5), .D(gr_2_bus[6]), .Z(n174)
         );
  CND2X1 U38 ( .A(n168), .B(n169), .Z(mux_o1[7]) );
  CANR2XL U39 ( .A(n172), .B(pr_on_bus[7]), .C(n5), .D(gr_2_bus[7]), .Z(n168)
         );
  CND2X1 U40 ( .A(n162), .B(n163), .Z(mux_o2[1]) );
  CANR2X2 U41 ( .A(pr_on_bus[0]), .B(n150), .C(gr_2_bus[0]), .D(n151), .Z(n164) );
  CANR2XL U42 ( .A(n4), .B(ar_2_bus[7]), .C(n171), .D(dr_2_bus[7]), .Z(n169)
         );
  CANR2XL U43 ( .A(n4), .B(ar_2_bus[6]), .C(n171), .D(dr_2_bus[6]), .Z(n175)
         );
  CANR2XL U44 ( .A(n4), .B(ar_2_bus[5]), .C(n171), .D(dr_2_bus[5]), .Z(n177)
         );
  CANR2XL U45 ( .A(n4), .B(ar_2_bus[4]), .C(n171), .D(dr_2_bus[4]), .Z(n179)
         );
  CANR2XL U46 ( .A(n4), .B(ar_2_bus[3]), .C(n171), .D(dr_2_bus[3]), .Z(n181)
         );
  CANR2XL U47 ( .A(n4), .B(ar_2_bus[2]), .C(n171), .D(dr_2_bus[2]), .Z(n183)
         );
  CANR2XL U48 ( .A(n4), .B(ar_2_bus[1]), .C(n171), .D(dr_2_bus[1]), .Z(n185)
         );
  CND2X2 U49 ( .A(n165), .B(n164), .Z(mux_o2[0]) );
  CANR2X1 U50 ( .A(n172), .B(pr_on_bus[0]), .C(n173), .D(gr_2_bus[0]), .Z(n186) );
  CNR2X1 U51 ( .A(add_sel_b[0]), .B(add_sel_b[1]), .Z(n148) );
  CANR2XL U52 ( .A(ar_2_bus[7]), .B(n148), .C(dr_2_bus[7]), .D(n3), .Z(n147)
         );
  CANR2XL U53 ( .A(ar_2_bus[6]), .B(n148), .C(dr_2_bus[6]), .D(n3), .Z(n153)
         );
  CANR2XL U54 ( .A(ar_2_bus[5]), .B(n148), .C(dr_2_bus[5]), .D(n3), .Z(n155)
         );
  CANR2XL U55 ( .A(ar_2_bus[4]), .B(n148), .C(dr_2_bus[4]), .D(n3), .Z(n157)
         );
  CANR2XL U56 ( .A(ar_2_bus[3]), .B(n148), .C(dr_2_bus[3]), .D(n3), .Z(n159)
         );
  CANR2XL U57 ( .A(ar_2_bus[2]), .B(n148), .C(dr_2_bus[2]), .D(n149), .Z(n161)
         );
  CANR2XL U58 ( .A(ar_2_bus[1]), .B(n148), .C(dr_2_bus[1]), .D(n149), .Z(n163)
         );
  CANR2XL U59 ( .A(pr_on_bus[7]), .B(n150), .C(gr_2_bus[7]), .D(n1), .Z(n146)
         );
  CANR2XL U60 ( .A(pr_on_bus[6]), .B(n150), .C(gr_2_bus[6]), .D(n1), .Z(n152)
         );
  CANR2XL U61 ( .A(pr_on_bus[5]), .B(n150), .C(gr_2_bus[5]), .D(n1), .Z(n154)
         );
  CANR2XL U63 ( .A(pr_on_bus[4]), .B(n150), .C(gr_2_bus[4]), .D(n1), .Z(n156)
         );
  CANR2XL U64 ( .A(pr_on_bus[3]), .B(n150), .C(gr_2_bus[3]), .D(n1), .Z(n158)
         );
  CANR2XL U65 ( .A(pr_on_bus[2]), .B(n150), .C(gr_2_bus[2]), .D(n2), .Z(n160)
         );
  CANR2XL U66 ( .A(pr_on_bus[1]), .B(n150), .C(gr_2_bus[1]), .D(n151), .Z(n162) );
  CIVX2 U67 ( .A(add_sel_b[1]), .Z(n8) );
endmodule


module Controller ( clk, rst, rd_mem, wr_mem, crt_ar_on_pr, crt_pr_on_data, 
        crt_pr_on_add, crt_increment_pr, crt_ir_on_data, crt_data_on_ir, 
        crt_machine_code, crt_ar_on_data, crt_data_on_ar, crt_ar_on_add, 
        crt_alu_2_data, crt_gr_on_data, crt_lsb_on_gr, crt_msb_on_gr, 
        crt_data_on_dr, crt_dr_on_data, crt_ALU_cin, crt_ALU_sel, 
        crt_load_FR_On_data, crt_add_sel_a, crt_add_sel_b );
  input [7:0] crt_machine_code;
  output [1:0] crt_add_sel_a;
  output [1:0] crt_add_sel_b;
  input clk, rst;
  output rd_mem, wr_mem, crt_ar_on_pr, crt_pr_on_data, crt_pr_on_add,
         crt_increment_pr, crt_ir_on_data, crt_data_on_ir, crt_ar_on_data,
         crt_data_on_ar, crt_ar_on_add, crt_alu_2_data, crt_gr_on_data,
         crt_lsb_on_gr, crt_msb_on_gr, crt_data_on_dr, crt_dr_on_data,
         crt_ALU_cin, crt_ALU_sel, crt_load_FR_On_data;
  wire   n60, crt_ALU_cin, N25, N26, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n56, n57, crt_pr_on_add, n59;
  wire   [1:0] present_state;
  assign crt_ALU_sel = crt_ALU_cin;
  assign crt_data_on_ir = crt_pr_on_add;
  assign crt_increment_pr = crt_pr_on_add;

  CANR11X2 U50 ( .A(crt_machine_code[6]), .B(n18), .C(n48), .D(n12), .Z(n52)
         );
  CFD1QX1 \present_state_reg[0]  ( .D(N25), .CP(clk), .Q(present_state[0]) );
  CFD1QX1 \present_state_reg[1]  ( .D(N26), .CP(clk), .Q(present_state[1]) );
  CNR2X2 U3 ( .A(crt_machine_code[7]), .B(crt_machine_code[4]), .Z(n55) );
  CND2XL U4 ( .A(n8), .B(n4), .Z(n6) );
  CANR11XL U5 ( .A(n5), .B(n41), .C(n40), .D(n42), .Z(crt_data_on_ar) );
  CIVX2 U6 ( .A(n60), .Z(n5) );
  COR2X1 U7 ( .A(crt_machine_code[6]), .B(crt_machine_code[5]), .Z(n34) );
  COR3X2 U8 ( .A(n49), .B(n26), .C(crt_machine_code[1]), .Z(n37) );
  CAN6X1 U9 ( .A(n17), .B(n18), .C(present_state[1]), .D(present_state[0]), 
        .E(crt_machine_code[7]), .F(crt_machine_code[4]), .Z(
        crt_load_FR_On_data) );
  CNR2X1 U10 ( .A(n19), .B(crt_machine_code[7]), .Z(n48) );
  COAN1XL U11 ( .A(crt_add_sel_a[0]), .B(n39), .C(n20), .Z(crt_data_on_dr) );
  CNR2X1 U12 ( .A(n26), .B(n6), .Z(crt_ALU_cin) );
  CNR2X1 U13 ( .A(n5), .B(n56), .Z(crt_add_sel_a[0]) );
  CND2X1 U14 ( .A(present_state[1]), .B(present_state[0]), .Z(n26) );
  CIVXL U15 ( .A(n5), .Z(crt_alu_2_data) );
  CNR2IX2 U16 ( .B(crt_machine_code[1]), .A(n5), .Z(crt_add_sel_b[1]) );
  CNR2X1 U17 ( .A(n5), .B(n20), .Z(crt_add_sel_a[1]) );
  CNR2IX2 U18 ( .B(crt_machine_code[0]), .A(n5), .Z(crt_add_sel_b[0]) );
  CNR2X2 U19 ( .A(n52), .B(n26), .Z(n60) );
  CIVX1 U20 ( .A(crt_machine_code[4]), .Z(n19) );
  CIVXL U21 ( .A(n25), .Z(n14) );
  CNR2XL U22 ( .A(n19), .B(crt_machine_code[7]), .Z(n2) );
  CND4XL U23 ( .A(crt_machine_code[1]), .B(crt_machine_code[0]), .C(n25), .D(
        n23), .Z(n24) );
  CND2XL U24 ( .A(n25), .B(n33), .Z(n32) );
  CND2XL U25 ( .A(n25), .B(n31), .Z(n36) );
  COND3X1 U26 ( .A(n30), .B(n56), .C(n44), .D(n45), .Z(crt_ar_on_pr) );
  CND2XL U27 ( .A(n20), .B(n56), .Z(n42) );
  COND2XL U28 ( .A(crt_machine_code[2]), .B(n30), .C(n31), .D(n32), .Z(n29) );
  CND2XL U29 ( .A(crt_machine_code[0]), .B(n25), .Z(n41) );
  CND2XL U30 ( .A(crt_machine_code[3]), .B(crt_machine_code[2]), .Z(n23) );
  CND2XL U31 ( .A(crt_machine_code[3]), .B(n56), .Z(n31) );
  CND2XL U32 ( .A(crt_machine_code[1]), .B(n57), .Z(n33) );
  CANR4CXL U33 ( .A(n14), .B(crt_machine_code[0]), .C(n40), .D(n56), .Z(n39)
         );
  CND2X1 U34 ( .A(n11), .B(n13), .Z(crt_ar_on_add) );
  COND2X1 U35 ( .A(n11), .B(n31), .C(n33), .D(n36), .Z(crt_gr_on_data) );
  CANR2X1 U36 ( .A(n16), .B(n47), .C(n21), .D(n15), .Z(n45) );
  CNR2XL U37 ( .A(n35), .B(n26), .Z(crt_ir_on_data) );
  COND3X1 U38 ( .A(n11), .B(n42), .C(n46), .D(n45), .Z(crt_ar_on_data) );
  CND3XL U39 ( .A(n42), .B(n57), .C(n15), .Z(n46) );
  COND3XL U40 ( .A(n26), .B(n28), .C(n9), .D(n10), .Z(crt_lsb_on_gr) );
  CAN2X1 U41 ( .A(n28), .B(n27), .Z(n35) );
  CND2X1 U42 ( .A(n22), .B(n13), .Z(rd_mem) );
  COND11X1 U43 ( .A(n37), .B(crt_machine_code[2]), .C(n57), .D(n38), .Z(
        crt_dr_on_data) );
  CND3XL U44 ( .A(crt_machine_code[2]), .B(n20), .C(wr_mem), .Z(n38) );
  CANR4CXL U45 ( .A(present_state[0]), .B(n59), .C(n22), .D(rst), .Z(N26) );
  COND1XL U46 ( .A(n23), .B(n11), .C(n24), .Z(crt_pr_on_data) );
  CNR2XL U47 ( .A(crt_machine_code[7]), .B(crt_machine_code[4]), .Z(n3) );
  COND1XL U48 ( .A(n26), .B(n27), .C(n10), .Z(crt_msb_on_gr) );
  CANR1XL U49 ( .A(crt_machine_code[3]), .B(n43), .C(crt_add_sel_a[1]), .Z(n30) );
  CND2XL U51 ( .A(present_state[0]), .B(n59), .Z(n22) );
  CNR2XL U52 ( .A(crt_machine_code[7]), .B(crt_machine_code[4]), .Z(n4) );
  CNR2XL U53 ( .A(n49), .B(n26), .Z(n25) );
  CANR1XL U54 ( .A(n25), .B(crt_machine_code[1]), .C(n43), .Z(n40) );
  CND3XL U55 ( .A(n25), .B(n57), .C(n21), .Z(n44) );
  CANR4CX1 U56 ( .A(n54), .B(n26), .C(present_state[0]), .D(rst), .Z(N25) );
  CNR2X1 U57 ( .A(n50), .B(n26), .Z(n43) );
  CNR2X1 U58 ( .A(n26), .B(n51), .Z(wr_mem) );
  CIVX1 U59 ( .A(crt_machine_code[5]), .Z(n18) );
  CIVXL U60 ( .A(crt_machine_code[6]), .Z(n17) );
  CND2X2 U61 ( .A(crt_machine_code[6]), .B(crt_machine_code[5]), .Z(n7) );
  CND2X2 U62 ( .A(n8), .B(n55), .Z(n53) );
  CIVX2 U63 ( .A(n7), .Z(n8) );
  CND3XL U64 ( .A(n16), .B(n19), .C(crt_machine_code[7]), .Z(n27) );
  CND3XL U65 ( .A(crt_machine_code[5]), .B(n2), .C(crt_machine_code[6]), .Z(
        n28) );
  CNR2IXL U66 ( .B(n2), .A(n26), .Z(n47) );
  CND3XL U67 ( .A(n2), .B(n17), .C(crt_machine_code[5]), .Z(n51) );
  CND3XL U68 ( .A(crt_machine_code[5]), .B(n17), .C(n3), .Z(n50) );
  CND3XL U69 ( .A(n3), .B(n18), .C(crt_machine_code[6]), .Z(n49) );
  CAN6XL U70 ( .A(n52), .B(n34), .C(n35), .D(n50), .E(n51), .F(n49), .Z(n54)
         );
  CIVX2 U71 ( .A(crt_load_FR_On_data), .Z(n9) );
  CIVX2 U72 ( .A(n29), .Z(n10) );
  CIVX2 U73 ( .A(wr_mem), .Z(n11) );
  CIVX2 U74 ( .A(n53), .Z(n12) );
  CIVX2 U75 ( .A(n43), .Z(n13) );
  CIVX2 U76 ( .A(n37), .Z(n15) );
  CIVX2 U77 ( .A(n34), .Z(n16) );
  CIVX2 U78 ( .A(crt_machine_code[3]), .Z(n20) );
  CIVX2 U79 ( .A(n23), .Z(n21) );
  CIVX2 U80 ( .A(crt_machine_code[2]), .Z(n56) );
  CIVX2 U81 ( .A(crt_machine_code[0]), .Z(n57) );
  CIVX2 U82 ( .A(n22), .Z(crt_pr_on_add) );
  CIVX2 U83 ( .A(present_state[1]), .Z(n59) );
endmodule


module proccessor ( clk, rst, addr, dat, wrt, rd );
  output [7:0] addr;
  inout [7:0] dat;
  input clk, rst;
  output wrt, rd;
  wire   data_on_ar, ar_on_add, ar_on_data, data_on_dr, dr_on_data, lsb_on_gr,
         msb_on_gr, gr_on_data, ar_on_pr, increment_pr, pr_on_data, pr_on_add,
         data_on_ir, ir_on_data, ALU_cin, ALU_sel, alu_2_data, load_FR_On_data
;
  wire   [7:0] machine_code;
  wire   [1:0] add_sel_a;
  wire   [1:0] add_sel_b;
  tri   [7:0] addr;
  tri   [7:0] dat;

  data_block data_block_instantiation ( .clk(clk), .rst(rst), .ar_on_pr(
        ar_on_pr), .pr_on_data(pr_on_data), .pr_on_add(pr_on_add), 
        .increment_pr(increment_pr), .data_bus(dat), .address_bus(addr), 
        .ir_on_data(ir_on_data), .data_on_ir(data_on_ir), .machine_code(
        machine_code), .ar_on_data(ar_on_data), .data_on_ar(data_on_ar), 
        .ar_on_add(ar_on_add), .gr_on_data(gr_on_data), .lsb_on_gr(lsb_on_gr), 
        .msb_on_gr(msb_on_gr), .data_on_dr(data_on_dr), .dr_on_data(dr_on_data), .ALU_cin(ALU_cin), .ALU_sel(ALU_sel), .load_FR_On_data(load_FR_On_data), 
        .alu_2_data(alu_2_data), .add_sel_b(add_sel_b), .add_sel_a(add_sel_a)
         );
  Controller controller_instant ( .clk(clk), .rst(rst), .rd_mem(rd), .wr_mem(
        wrt), .crt_ar_on_pr(ar_on_pr), .crt_pr_on_data(pr_on_data), 
        .crt_pr_on_add(pr_on_add), .crt_increment_pr(increment_pr), 
        .crt_ir_on_data(ir_on_data), .crt_data_on_ir(data_on_ir), 
        .crt_machine_code(machine_code), .crt_ar_on_data(ar_on_data), 
        .crt_data_on_ar(data_on_ar), .crt_ar_on_add(ar_on_add), 
        .crt_alu_2_data(alu_2_data), .crt_gr_on_data(gr_on_data), 
        .crt_lsb_on_gr(lsb_on_gr), .crt_msb_on_gr(msb_on_gr), .crt_data_on_dr(
        data_on_dr), .crt_dr_on_data(dr_on_data), .crt_ALU_cin(ALU_cin), 
        .crt_ALU_sel(ALU_sel), .crt_load_FR_On_data(load_FR_On_data), 
        .crt_add_sel_a(add_sel_a), .crt_add_sel_b(add_sel_b) );
endmodule

