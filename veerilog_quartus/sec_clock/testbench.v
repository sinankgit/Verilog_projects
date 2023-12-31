`timescale 1ns/1ns

module testbench();

reg clk = 1'b0;
reg reset = 1'b1;
wire out;

one_sec_clk DUT(.clk(clk) , .reset(reset), .sec_clk(out));

initial #20 reset = 1'b0;

always #10 clk = ~clk;

endmodule