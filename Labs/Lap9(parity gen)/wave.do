onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /parity_tb/data_in
add wave -noupdate /parity_tb/clk
add wave -noupdate /parity_tb/rst
add wave -noupdate /parity_tb/parity_out
add wave -noupdate -color Magenta /parity_tb/Dut/counter
add wave -noupdate -color Cyan /parity_tb/Dut/data_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {45000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 80
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {213150 ps}
