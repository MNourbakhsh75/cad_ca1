`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:27:05 29/10/2018 
// Design Name: 
// Module Name:    datapath 
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

module datapath #(parameter DATA_WIDTH = 8, m = 8, n = 8) (
		input [DATA_WIDTH-1:0] data_in,
		input clk, rst,
		input m1EN, m2EN, m3EN, m1rEN, m2rEN, m3rEN, m1wEN, m2wEN, m3wEN,
		input mult_ld, mult_rst,
		input [m+n-1:0] addr1, addr2, addr3,
		input [1:0] shift_cnt,
		output [DATA_WIDTH-1:0] data_out
    );
	
	wire [DATA_WIDTH-1:0] out1;
	wire [DATA_WIDTH-1:0] out2;
	
	
	
	memory #(DATA_WIDTH,m,n) mat1 (
		.clk(clk), 
		.readEN(m1rEN), 
		.writeEN(m1wEN), 
		.ramEN(m1EN), 
		.addr(addr1), 
		.data_in(data_in), 
		.data_out(out1)
    );
	
	memory #(DATA_WIDTH,n,m) mat2 (
		.clk(clk), 
		.readEN(m2rEN), 
		.writeEN(m2wEN), 
		.ramEN(m2EN), 
		.addr(addr2), 
		.data_in(data_in), 
		.data_out(out2)
    );

	
	wire [2*DATA_WIDTH+2-1:0] mult_reg_out;
	wire [2*DATA_WIDTH+2-1:0] mult_reg_in;
	wire [2*DATA_WIDTH+2-1:0] mult_res;
	wire [2*DATA_WIDTH+2-1:0] result;

	(*mult_style="block"*)
	assign mult_res = out1 * out2;
	assign mult_reg_in = mult_reg_out + mult_res;
		
	wire ld_rst = rst | mult_rst;
		
	register ld_reg(
		.clk(clk), 
		.rst(ld_rst), 
		.ld(mult_ld),
		.data_in(mult_reg_in),
		.data(mult_reg_out)
    );

	
	memory18 mat3 (
		.clk(clk), 
		.readEN(m3rEN), 
		.writeEN(m3wEN), 
		.ramEN(m3EN), 
		.addr(addr3), 
		.data_in(mult_reg_out), 
		.data_out(result)
    );

	// shifter shift_out (
	// 	.data_in(result),
	// 	.shift_cnt(shift_cnt),
	// 	.data_out(data_out)
	// );
/*
	shift_register shift_reg (
    .clk(clk), 
    .rst(rst), 
    .shr(shr), 
    .ld(shift_ld), 
    .reg_in(result), 
    .reg_out(shift_reg_out)
    );
*/
endmodule
