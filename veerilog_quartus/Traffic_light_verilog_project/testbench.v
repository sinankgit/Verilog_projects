`timescale 1ns/1ns
module testbench();

reg reset = 1'b1;
reg clock = 1'b0;

wire [1:0] North_out, South_out, East_out, West_out;

traf_light DUT(.clk(clock), .reset(reset), .North_1(North_out[1]), .North_0(North_out[0]),
					.East_1(East_out[1]), .East_0(East_out[0]),
					.South_1(South_out[1]), .South_0(South_out[0]),
					.West_1(West_out[1]), .West_0(West_out[0]));

initial begin
	#50e6 reset = 1'b0;
end

always #10 clock = ~clock;

endmodule