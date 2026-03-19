/*
	Egemen Çelik 2220357034
	ELE432 Homework 1 : Traffic-Light-FSM
	Traffic.sv
*/

`timescale 1ns / 1ps

module Traffic
(
	input logic clk,     		// Clock signal
	input logic reset,			// Reset signal
	input logic TAORB,   		// Traffic on A (1) or on B (0)
	output logic [5:0] led		// Light bits
);

	// State encoding
	typedef enum logic [1:0]
	{
		GREENRED = 2'b00,  // Green for A, Red for B
		YELLOWRED = 2'b01, // Yellow for A, Red for B
		REDGREEN = 2'b10,  // Red for A, Green for B
		REDYELLOW = 2'b11  // Red for A, Yellow for B
	} state_t;
	
	// State variables
	state_t state_reg, state_next;
	logic [2:0] timer; // 3 bits for 5 unit times.
	
	// Sequential logic for state transition
	always_ff @(posedge clk or posedge reset) begin
		if (reset) begin
			state_reg <= GREENRED;	// Reset to initial state
			timer <= 0;					// Reset timer
		end else begin
			if (state_reg[0] == 1)			// Count timer up if in YELLOWRED or REDYELLOW
				timer <= timer + 3'b1;
				
			state_reg <= state_next;		// Update current state
			
			if (state_reg != state_next)	// Reset timer if the state changes
				timer <= 0;
		end
	end
	
	// Combinational logic for state transition and LED control
	always_comb begin
		// Default assignments
		state_next = state_reg;
		led = 6'b001100; // Default state: Green for A, Red for B
		
		case (state_reg)
			GREENRED: begin
				led = 6'b001100; // Green for A, Red for B
				if (!TAORB) begin
					state_next = YELLOWRED;
				end
				else begin
					state_next = GREENRED;
				end
			end
			YELLOWRED: begin
				led = 6'b010100; // Yellow for A, Red for B
				if (timer < 4) begin
					state_next = YELLOWRED; // Stay until timer condition is met
				end
				else begin
					state_next = REDGREEN;	// Transition after 5 units
				end
			end
			REDGREEN: begin
				led = 6'b100001; // Red for A, Green for B
				if (TAORB) begin
					state_next = REDYELLOW;
				end
				else begin
					state_next = REDGREEN;
				end
			end
			REDYELLOW: begin
				led = 6'b100010; // Red for A, Yellow for B
				if (timer < 4) begin
					state_next = REDYELLOW; // Stay until timer condition is met
				end
				else begin
					state_next = GREENRED;	// Transition after 5 units
				end
			end
			default: state_next = GREENRED; // Default state in case of invalid behavior
		endcase
	end
endmodule