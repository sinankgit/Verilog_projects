module traf_light(input clk, input reset,
						output North_1, output North_0,
						output East_1, output East_0,
						output West_1, output West_0,
						output South_1, output South_0);

parameter North_green = 3'h0, N_E_yellow =3'h1 , East_green = 3'h2, E_S_yellow = 3'h3;
parameter South_green = 3'h4, S_W_yellow = 3'h5, West_green = 3'h6, W_N_yellow = 3'h7;	
	
reg [2:0] present_state, next_state;

reg [2:0] North_out;
reg [2:0] South_out;
reg [2:0] East_out;
reg [2:0] West_out;

reg [2:0] count;
reg next_yellow, reached_five;

localparam green = 3'b001;
localparam yellow = 3'b010;
localparam red = 3'b100;

wire sec_clock;

// Generates a one second clock from a 50Mhz clock
one_sec_clk sec_clk_1(.clk(clk), .reset(reset), .sec_clk(sec_clock));

always @(posedge sec_clock, posedge reset) begin
	if (reset) begin
		count <= 3'b0;
		reached_five <= 1'b0;
		end
	else if (next_yellow) begin
		count <= count + 1'b1;
		// we have put the couter as 3 as there is an offset of two clock cycles in changing the reached_five value
		if (count == 3'h3) begin
			count <= 3'b0;
			reached_five <= 1'b1;
			end
		end
	else begin
		count <= 3'b0;
		reached_five <= 1'b0;
		end
end

always @(posedge sec_clock, posedge reset) begin
	// on reset it goes to north green light
	if (reset)
		present_state <= North_green;
	// if the next state is yellow then we need to wait for five seconds in the green light
	else if (next_yellow) begin
		if (reached_five)
			present_state <= next_state;
		end
	else
		present_state <= next_state;
end	

always @(*) begin
	case (present_state) 
		North_green : begin 
								next_yellow = 1'b1;
								next_state = N_E_yellow;
								North_out = green;
								East_out = red;
								South_out = red;
								West_out = red;
							end
		N_E_yellow : begin
								next_state = East_green;
								next_yellow = 1'b0;
								North_out = yellow;
								East_out = yellow;
								South_out = red;
								West_out = red;
						 end
		East_green : begin
								next_state = E_S_yellow;
								next_yellow = 1'b1;
								East_out = green;
								North_out = red;
								South_out = red;
								West_out = red;
						 end
		E_S_yellow : begin 
								next_state = South_green;
								next_yellow = 1'b0;
								East_out = yellow;
								South_out = yellow;
								West_out = red;
								North_out = red;
						 end
		South_green : begin 
								next_state = S_W_yellow;
								next_yellow = 1'b1;
								South_out = green;
								North_out = red;
								East_out = red;
								West_out = red;
						  end
		S_W_yellow : begin	
								next_state = West_green;
								next_yellow = 1'b0;
								South_out = yellow;
								West_out = yellow;
								North_out = red;
								East_out = red;
						 end
		West_green : begin 
								next_state = W_N_yellow;
								next_yellow = 1'b1;
								West_out = green;
								North_out = red;
								East_out = red;
								South_out = red;
						 end
		W_N_yellow : begin
								next_state = North_green;
								next_yellow = 1'b0;
								West_out = yellow;
								North_out = yellow;
								East_out = red;
								South_out = red;
						end
		endcase
end		

encoder_4_2 north_encoder(.data_in({North_out, 1'b0}), .data_out({North_1, North_0}));
encoder_4_2 East_encoder(.data_in({East_out, 1'b0}), .data_out({East_1, East_0}));
encoder_4_2 South_encoder(.data_in({South_out, 1'b0}), .data_out({South_1, South_0}));
encoder_4_2 West_encoder(.data_in({West_out, 1'b0}), .data_out({West_1, West_0}));


						
endmodule
