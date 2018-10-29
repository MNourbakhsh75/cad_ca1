`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:43:30 11/10/2017 
// Design Name: 
// Module Name:    matrix_mult 
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
module matrix_mult #(parameter DW = 8, m = 8 , n = 8)(
		input clk,
		input reset,
		input [7:0] data_in,
		input start,
		output [7:0] data_out,
		output done
    );

// parameter addrNum = $clog2(m*n); //$
// wire [addrNum:0] addr1, addr2, addr3; // m+n $ add addrNum
// wire [1:0] shift_cnt;



wire [m+n:0] addr1, addr2, addr3;
wire [1:0] shift_cnt;


datapath mult_dp (
    .data_in(data_in), 
    .clk(clk), 
    .rst(reset), 
    .m1EN(m1EN), 
    .m2EN(m2EN), 
    .m3EN(m3EN), 
    .m1rEN(m1rEN), 
    .m2rEN(m2rEN), 
    .m3rEN(m3rEN), 
    .m1wEN(m1wEN), 
    .m2wEN(m2wEN), 
    .m3wEN(m3wEN), 
    .mult_ld(mult_ld), 
    .mult_rst(mult_rst), 
    .addr1(addr1), 
    .addr2(addr2), 
    .addr3(addr3), 
	.shift_cnt(shift_cnt),
    .data_out(data_out)
    );

controller mult_ctrl (
    .start(start), 
    .rst(reset), 
    .clk(clk), 
    .m1EN(m1EN), 
    .m2EN(m2EN), 
    .m3EN(m3EN), 
    .m1rEN(m1rEN), 
    .m2rEN(m2rEN), 
    .m3rEN(m3rEN), 
    .m1wEN(m1wEN), 
    .m2wEN(m2wEN), 
    .m3wEN(m3wEN), 
    .mult_ld(mult_ld), 
	.shift_cnt(shift_cnt),
    .mult_rst(mult_rst), 
    .addr1(addr1), 
    .addr2(addr2), 
    .addr3(addr3), 
    .done(done)
    );
endmodule