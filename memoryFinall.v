`timescale 1ns / 1ns
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
module memoryFinall #(parameter DW = 8, m = 8 , n = 8) (
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
