/*
	Egemen Çelik 2220357034
	ELE432 Homework 1 : Traffic-Light-FSM
	HalfMicroSecond.sv
	For testing purposes
*/

`timescale 1ns / 1ps

module HalfMicroSecond (
	 input logic clk_50MHz,
	 input logic reset,
	 output logic clk_halfmicrosec
);

	logic [4:0] r_count = 0;
	logic r_half = 0;

	always_ff @(posedge clk_50MHz or posedge reset) begin
		if (reset) begin
			r_count <= 5'b0;
			r_half <= 1'b0;
		end else begin
			if (r_count == 24) begin
				r_count <= 5'b0;
				r_half <= ~r_half;
			end else begin
				r_count <= r_count + 5'b1;
			end
		end
	end

	assign clk_halfmicrosec = r_half;

endmodule