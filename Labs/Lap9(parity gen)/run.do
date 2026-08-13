vlib work
vmap work work
vlog parity.v parity_tb.v
vsim -voptargs=+acc work.parity_tb
#add wave *
#add wave Dut/counter 
#add wave Dut/data_reg 
do wave.do
run -all