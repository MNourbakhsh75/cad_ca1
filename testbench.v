`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:36:27 29/10/2018 
// Design Name: 
// Module Name:    testBench 
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
module testBench();

	reg[7:0] data_in;
	wire[7:0] data_out;
	reg clk = 1;
	reg rst = 1;
	reg start = 0;
	wire done; 
	
	//parameter DW = 8, m = 8 , n = 8)
	matrix_mult #(8, 2 , 2) UUT (
		.clk(clk),
		.reset(rst),
		.data_in(data_in),
		.start(start),
		.data_out(data_out),
		.done(Date)
    );

	always #10 clk=~clk;
	
	initial begin
		#10 rst = 0;
		#10 start = 1;
		
		#20 start = 0; 
		//first matrix
		#20 data_in = 8'd1;
		#20 data_in = 8'd2;
		#20 data_in = 8'd3;
		#20 data_in = 8'd4;
		//second matrix
		#20 data_in = 8'd5;
		#20 data_in = 8'd6;
		#20 data_in = 8'd7;
		#20 data_in = 8'd8;
		
		//#200 data_in = 8'd3;
		//#200 data_in = 8'd1;
		//#200 data_in = 8'd2;
		//#200 data_in = 8'd3;
		//#200 data_in = 8'd1;
		//#200 data_in = 8'd2;
		//#200 data_in = 8'd3;
		//#200 data_in = 8'd1;
		//#200 data_in = 8'd2;
		//#200 data_in = 8'd3;
		
		#3000 $stop;

	end
endmodule
