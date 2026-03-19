/*
	Egemen Çelik 2220357034
	ELE432 Homework 1 : Traffic-Light-FSM
	Traffic_TB.sv
*/

`timescale 1ns / 1ps

module Traffic_TB;

	// Inputs
	logic clk_50MHz;
	logic reset;
	logic TAORB;  // Example input to trigger state changes
	
	// Outputs
	logic [5:0] led;  // Assuming states are represented with 2 bits
	
	// Instantiate the TrafficTop module 
	TrafficTop uut (
		.clk_50MHz(clk_50MHz),
		.reset(reset),
		.TAORB(TAORB),
		.led(led)  // Replace with your actual output signals
	);

	// Clock generation
	always begin
		#10 clk_50MHz = ~clk_50MHz;  // 50MHz clock, period = 20ns
	end

	// Testbench logic
	initial begin
		// Initialize inputs
		clk_50MHz = 0;
		reset = 1;
		TAORB = 1;
		
		// Wait 100ns for reset to finish
		#500;
		reset = 0;
		
		// Wait 1us (1 clock cycle) to observe S(0)
		#5000;
		
		// Change TAORB to observe S(1)
		TAORB = 0;
		
		// Wait long enough for it to change to S(2) and stay there for a while
		#10000;
		
		// Change TAORB to observe S(3)
		TAORB = 1;
		
		// Wait long enough for it to change to S(0) and stay there for a while
		#10000;
		
		// End the simulation
		$display("Simulation complete.");
		$stop;
	end

	// Monitor the current state and input signals. "do wave.do" to add other waves or add manually"
	initial begin
		// synthesis translate_off
		$monitor("Time=%0t | clk_50MHz=%b | clk_1MHz=%b | reset=%b | TAORB=%b | timer=%d | state=%b | led=%b | next=%b", 
		$time, clk_50MHz, uut.halfmicrosecond_inst.clk_halfmicrosec, reset, TAORB, uut.traffic_inst.timer,
		uut.traffic_inst.state_reg, led, uut.traffic_inst.state_next);
		// synthesis translate_on
	end

endmodule