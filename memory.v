`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:30:03 29/10/2018 
// Design Name: 
// Module Name:    memory 
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
module memory #(parameter DW = 8, m = 8 , n = 8) (
		input clk,
		input readEN,
		input writeEN,
		input ramEN,
		input [(m + n)-1:0] addr,
		input [(m + n)-1 :0] data_in,
		output reg [DW-1:0] data_out
    );
	(*RAM_STYLE="BLOCK"*)


  reg [DW-1:0] mat [m*n-1:0]; // width = DW & height = m*n mehrdad


    always @(posedge clk) begin
        if (ramEN)
            if (writeEN)
                mat[addr] <= data_in;
            else if(readEN)
                data_out <= mat[addr];
    end

endmodule
