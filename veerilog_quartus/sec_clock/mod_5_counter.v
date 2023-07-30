/* This is a module for a mod-5 counter
   Divides the clock frequency by 5 
	will be useful in dividing 50e6 hz clock into 1hz*/

module mod_5_counter(input clk, input reset, output q);

wire [2:0] y;
wire reset_chance;
reg y1_delay;


assign reset_chance = reset|(y[2]&y[0]);

tff_1 u12(.T(1'b1), .reset_1(reset_chance),.clk(clk), .q(y[0]));
tff_1 tff22(.T(y[0]),.clk(clk), .reset_1(reset_chance), .q(y[1]));
tff_1 tff32(.T(y[1]&y[0]),.clk(clk), .reset_1(reset_chance), .q(y[2]));

always @(negedge clk, posedge reset) begin
	if (reset)
		y1_delay = 0;
	else
		y1_delay = y[1];
end

assign q = y1_delay|y[1];

endmodule


