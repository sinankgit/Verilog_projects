/* In this module we will serially take the data and checks for a pattern (1010)
	we are designing a moore machine with non overlapping configuration*/
module sequence_1010_detect(input data_in,input clk, input areset, output data_out);
	
	parameter s0 = 3'h0, s1 = 3'h1, s2 = 3'h2, s3 = 3'h3, s4 = 3'h4;
	reg [2:0] present_state, next_state;
	
	always @(*) begin
		case (present_state) 
			s0 : next_state = data_in?s1:s0;
			s1 : next_state = data_in?s1:s2;
			s2 : next_state = data_in?s3:s0;
			s3 : next_state = data_in?s1:s4;
			s4 : next_state = data_in?s1:s0;
			default : next_state = s0;
		endcase
	end
	
	always @(posedge clk, posedge areset) begin
		if (areset)
			present_state = s0;
		else
			present_state = next_state;
	end
	
	assign data_out = (present_state == s4);
	
endmodule