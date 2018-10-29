`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:33:08 29/10/2018 
// Design Name: 
// Module Name:    memory18 
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
module memory18 #(parameter RAM_WIDTH = 18, RAM_ADDR_BITS = 8) (
		input clk,
		input readEN,
		input writeEN,
		input ramEN,
		input [RAM_ADDR_BITS-1:0] addr,
		input [RAM_WIDTH-1:0] data_in,
		output reg [RAM_WIDTH-1:0] data_out
    );
	 (*RAM_STYLE="BLOCK"*)

  
   reg [RAM_WIDTH-1:0] mat [(2**RAM_ADDR_BITS)-1:0];
  
  always @(posedge clk)
      if (ramEN)
        if (writeEN)
          mat[addr] <= data_in;
        else if(readEN)
            data_out <= mat[addr];

endmodule
