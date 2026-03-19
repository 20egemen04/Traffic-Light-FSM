This is for ELE432 Assignment 1 Warm-Up – Traffic Light Controller FSM (with Delay). The whole Quartus project folder and the files necessary only for grading are both included.

**Student info:**
**Name:** &ensp;Egemen Çelik\
**Student ID:** &emsp;&emsp;&emsp;&emsp;&ensp;2220357034<br><br>

&emsp;&emsp;The FSM Behavior given in the homework document didn't state what the state transitions for the TAORB changing while in S(1) or S(3) would be. I chose to check only one variable on every state as it would be more efficient and the modified behavior would make more sense in the real world.

**Modified State Transition Diagram:**<br><img width="651" height="621" alt="Traffic-Light-FSM_modified drawio" src="https://github.com/user-attachments/assets/6428de51-bf93-4934-8f3c-b8fb1b97f188" /><br><br>

**Test Bench Waveform:**<br><img width="3508" height="832" alt="wave_color" src="https://github.com/user-attachments/assets/776c533b-c133-4923-bafc-e77a794b0d25" /><br><br>

**Files included in the “For grading” folder:**
<br>• This document
<br>• Modified State Transition Diagram image
<br>• Test Bench Waveform image
<br>• Transcript Output from Questa
<br>• System Verilog files:<br>&emsp;1) Traffic.sv : Logic for the traffic light
<br>&emsp;2) HalfMicroSecond.sv : 50MHz to 1MHz clock converter
<br>&emsp;3) TrafficTop.sv : Top level file including both Traffic and HalfMicroSecond
instances
<br>&emsp;4) Traffic_TB.sv : Testbench file for operating under normal conditions.
