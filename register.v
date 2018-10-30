`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:28:31 29/10/2018 
// Design Name: 
// Module Name:    register 
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
module register #(parameter DW) (
	input clk,
	input rst,
	input ld,
	input [DW-1:0] data_in,
	output reg [DW-1:0] data
);

	always @(posedge clk) begin
		if(rst) begin
			data <= {DW{1'd0}};
		end
		if (ld) begin
	    	data <= data_in;
		end
	end
		
endmodule
