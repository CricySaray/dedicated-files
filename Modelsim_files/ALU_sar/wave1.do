onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /ALUtest/clk
add wave -noupdate -radix binary /ALUtest/op
add wave -noupdate -radix decimal /ALUtest/a
add wave -noupdate -radix decimal /ALUtest/b
add wave -noupdate -radix decimal /ALUtest/s
add wave -noupdate -radix binary /ALUtest/n
add wave -noupdate -radix binary /ALUtest/v
add wave -noupdate -radix binary /ALUtest/c
add wave -noupdate -radix binary /ALUtest/z
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {181 ns} 0}
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
WaveRestoreZoom {0 ns} {928 ns}
