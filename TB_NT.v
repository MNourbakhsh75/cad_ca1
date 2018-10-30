//`timescale 1ns / 1ps
module ATB;
	reg clk = 1;
	reg rst = 1;
	reg start = 0;
	wire m1EN, m2EN, m3EN, m1rEN, m2rEN, m3rEN, m1wEN, m2wEN, m3wEN;
	wire mult_ld;
	wire [1:0] shift_cnt;
	wire mult_rst;
	wire [7:0] addr1, addr2, addr3;
	wire done; 
	controller #(4,3) _cont(
		start,
		rst, clk,
		m1EN, m2EN, m3EN, m1rEN, m2rEN, m3rEN, m1wEN, m2wEN, m3wEN,
		mult_ld,
		shift_cnt,
		mult_rst,
		addr1, addr2, addr3,
		done
    );
	always #20 clk=~clk;
	
	initial begin
		#80
		rst = 0;
		#40
		start = 1;
		#40
		start = 0; 
		#6500
		$stop;
	end

endmodule
