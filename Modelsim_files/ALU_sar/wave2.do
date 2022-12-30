onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ALUtest/clk
add wave -noupdate -radix decimal /ALUtest/a
add wave -noupdate -radix decimal /ALUtest/b
add wave -noupdate -radix decimal /ALUtest/s
add wave -noupdate -radix binary /ALUtest/op
add wave -noupdate /ALUtest/n
add wave -noupdate /ALUtest/z
add wave -noupdate /ALUtest/v
add wave -noupdate /ALUtest/c
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {658 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 162
configure wave -valuecolwidth 50
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
WaveRestoreZoom {0 ns} {1081 ns}
