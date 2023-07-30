/* In this module we are going to detect 010 and 1001 with overlapping
	we are designing a mealy machine. In a mealy FSM ouput depends on both 
	current input and the present state */

module detect_two_sequence(input data_in, input clk, input reset, output data_out);

parameter s0=3'h0, s1 = 3'h1, s2 = 3'h2, s3 = 3'h3, s4 = 3'h4, s5 = 3'h5;

reg [2:0] present_state, next_state;
reg out1, out2;

// Combinational logic for state change
always @(*) begin
	case (present_state)
		s0 : next_state = (data_in)?s3:s1;
		s1 : next_state = (data_in)?s2:s1;
		s2 : next_state = (data_in)?s3:s4;
		s3 : next_state = (data_in)?s3:s4;
		s4 : next_state = (data_in)?s2:s5;
		s5 : next_state = (data_in)?s2:s1;
		default : next_state = s0;
		endcase
end

// This design have a synchronous reset
always @(posedge clk) begin
	if (reset) 
		present_state = s0;
	else 
		present_state = next_state;
end

always @(posedge clk) begin
	out1 = (present_state == s2)&!(data_in);
	out2 = (present_state == s5)&(data_in);
end

assign data_out = out1|out2;

endmodule

