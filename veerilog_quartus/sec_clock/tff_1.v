module tff_1(input T,input reset_1, input clk, output reg q);

always @(posedge clk, posedge reset_1) begin
	if (reset_1)
		q <= 1'b0;
	else begin
		if (T)
			q <= !q;
		end
	end
endmodule
