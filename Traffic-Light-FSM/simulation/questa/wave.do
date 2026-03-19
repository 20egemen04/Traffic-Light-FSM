onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Traffic_TB/clk_50MHz
add wave -noupdate -label clk_1MHz /Traffic_TB/uut/clk_halfmicrosec
add wave -noupdate /Traffic_TB/reset
add wave -noupdate /Traffic_TB/TAORB
add wave -noupdate -label timer /Traffic_TB/uut/traffic_inst/timer
add wave -noupdate -label state_reg /Traffic_TB/uut/traffic_inst/state_reg
add wave -noupdate -radix binary -radixshowbase 0 /Traffic_TB/led
add wave -noupdate -label state_next /Traffic_TB/uut/traffic_inst/state_next
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {25000000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {26775 ns}
