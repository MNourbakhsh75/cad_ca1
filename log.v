module log(input[3:0] m , n ,output[7:0] mn,w);
	
	assign mn = m * n;
	assign w = $clog2(mn);
	
endmodule


module tb;
	reg [3:0] m, n;
	wire [7:0] mn,w;
	log _log(m,n,mn,w);
	
	initial begin
	m = 4'd4;
	n = 4'd4;
	#300
	$stop;

	end

endmodule