`timescale 1ns / 1ps
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
module register(
	input clk,
	input rst,
	input ld,
	input [17:0] data_in,
	output reg [17:0] data
);

   always @(posedge clk)
      if (rst) begin
         data <= 17'b0;
      end else if (ld) begin
         data <= data_in;
		end
		
endmodule
