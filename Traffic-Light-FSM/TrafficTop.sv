/*
	Egemen Çelik 2220357034
	ELE432 Homework 1 : Traffic-Light-FSM
	TrafficTop.sv
*/

`timescale 1ns / 1ps

module TrafficTop (
	input logic clk_50MHz,	// 50 MHz clock input
	input logic reset,		// Reset signal
	input logic TAORB,		// Traffic selector input
	output logic [5:0] led	// LED output to represent traffic lights
);

	// Internal signal for half-microsecond clock
	logic clk_halfmicrosec;

	// Instantiate the halfsecond module to generate a half-microsecond clock
	HalfMicroSecond halfmicrosecond_inst (
		.clk_50MHz(clk_50MHz),
		.reset(reset),
		.clk_halfmicrosec(clk_halfmicrosec)
	);

	// Instantiate the Traffic module, using clk_halfmicrosec as the clock
	Traffic traffic_inst (
		.clk(clk_halfmicrosec),
		.reset(reset),
		.TAORB(TAORB),
		.led(led)
	);

endmodule