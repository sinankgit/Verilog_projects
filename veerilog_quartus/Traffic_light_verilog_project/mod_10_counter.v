/* This is a module for a mod-10 counter
   Divides the clock frequency by 10 */

module mod_10_counter(input clk, input reset, output q);

wire [3:0] y;
wire reset_chance;
reg y2_delay;


assign reset_chance = reset|(y[3]&y[1]);

tff_1 tff1(.T(1'b1), .reset_1(reset_chance),.clk(clk), .q(y[0]));
tff_1 tff2(.T(y[0]),.clk(clk), .reset_1(reset_chance), .q(y[1]));
tff_1 tff3(.T(y[1]&y[0]),.clk(clk), .reset_1(reset_chance), .q(y[2]));
tff_1 tff4(.T(y[1]&y[0]&y[2]),.clk(clk), .reset_1(reset_chance), .q(y[3]));

always @(posedge clk, posedge reset) begin
	if (reset)
		y2_delay = 0;
	else
		y2_delay = y[2];
end

assign q = y2_delay|y[2];

endmodule