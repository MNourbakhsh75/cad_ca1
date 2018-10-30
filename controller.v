`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:22:04 29/10/2018 
// Design Name: 
// Module Name:    controller 
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
module controller #(parameter m = 8 , n = 8)(
		input start,
		input rst, clk,
		output reg m1EN, m2EN, m3EN, m1rEN, m2rEN, m3rEN, m1wEN, m2wEN, m3wEN,
		output reg mult_ld,
		output reg [1:0] shift_cnt,
		output reg mult_rst,
		output reg [7:0] addr1, addr2, addr3,
		output reg done
    );
	 (* FSM_ENCODING="SEQUENTIAL", SAFE_IMPLEMENTATION="NO" *)
	
	parameter sum_MN = m + n - 1;
	
	reg [5:0] ps;
	reg [sum_MN:0] readi;
	reg [sum_MN:0] i;
	reg [sum_MN:0] j;
	reg [sum_MN:0] k;
	reg [7:0] outi;
	
	
	always @(posedge clk) begin
		if(rst) begin
			ps = 6'd0;
			outi = 8'd0;
			done = 1'b0;
			shift_cnt = 2'd0;
			readi = {sum_MN{1'b0}}; // get data for first matrix and second matrix
			i = {sum_MN{1'b0}}; // index matrix 1
			j = {sum_MN{1'b0}}; // index matrix 3
			k = {sum_MN{1'b0}};
		end 
		else begin
			{m1EN, m2EN, m3EN, m1rEN, m2rEN, m3rEN, m1wEN, m2wEN, m3wEN, mult_ld, mult_rst}=11'b00000000000;
		
			case (ps)
				0: begin 
					ps = start ? 6'd1 : 6'd0;
				end
				
				1: begin 
					m1EN = 1'b1;
					m1wEN = 1'b1;
					addr1 = readi;
					readi = readi + 1; // I dont know it is true or not !!
					if(readi >= (m*n) ) begin
						ps = 6'd2;
						readi = 8'd0;
					end
				end
					
				2: begin 
					m2EN = 1'b1;
					m2wEN = 1'b1;
					addr2 = readi;
					readi = readi + 1; 	// I dont know it is true or not !!
					if(readi >= (m*n) ) begin
						ps = 6'd3;
						readi = 8'd0;
					end
				end
					
				3: begin
					//addr1 = (n * i) + k;
					//addr2 = j + (m * k);
					addr1 = (m * i) + k;
					addr2 = (n * k) + j;
					m1rEN = 1'b1;
					m2rEN = 1'b1;
					m1EN = 1'b1;
					m2EN = 1'b1;
					k = k + 1;
					ps = 6'd4;
				end
				
				4: begin
					mult_ld = 1'b1;
					if(k > m -1) begin
						ps = 6'd5;
						k = {sum_MN{1'd0}};
					end
					else begin
						ps = 6'd3;
					end
				end
					
				5: begin
					mult_rst = 1'b1;
					m3EN = 1;
					m3wEN = 1;
					addr3 = (3 * i) + j;						
					j = j + 1;
					if(j > m-1) begin
						i = i + 1;
						ps = 6'd6;
						j = {sum_MN{1'd0}};
					end 
					else begin
						ps = 6'd3;
					end
				end
				
				6: begin
					if(i > (n*n) -1) begin
						ps = 6'd7;
					end
					else begin
						ps = 6'd3;
					end
				end
					
				7: begin
					shift_cnt = 0;
					addr3 = outi;
					m3EN = 1;
					m3rEN = 1;
					ps = 6'd8;		
				end
					
				8: begin
					if(outi >= 8'd9) begin
						done = 0;
						ps = 6'd9;
					end
					else begin
						done = 1;
						shift_cnt = shift_cnt + 1;
						if(shift_cnt >= 2'd2) begin
							outi = outi + 1;
							ps = 6'd7;
						end
					end
				end

				default ps=0;
			endcase
		end
	end
	

endmodule
