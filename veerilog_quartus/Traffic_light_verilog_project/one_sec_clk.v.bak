/* Derives a 1hz clock from a 50Mhz lcock */

module one_sec_clk(input clk, input reset, output sec_clk);

wire[6:0] out_clk_1;

mod_10_counter dividerby10_1(.clk(clk), .reset(reset), .q(out_clk_1[0]));

genvar i;
generate
for (i =1; i < 7; i = i + 1) begin : loop_1
	mod_10_counter dividerby10_1(.clk(out_clk_1[i-1]), .reset(reset), .q(out_clk_1[i]));
	end
endgenerate

mod_5_counter divideby5_1(.clk(out_clk_1[6], .reset(reset), .q(sec_cllk));

endmodule