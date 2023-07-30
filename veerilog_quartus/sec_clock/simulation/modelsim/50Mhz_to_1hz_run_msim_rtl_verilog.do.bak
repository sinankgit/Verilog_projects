transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/digital_design_course_iit_bombay/verilog/50mhz_to_1hz {C:/digital_design_course_iit_bombay/verilog/50mhz_to_1hz/tff_1.v}
vlog -vlog01compat -work work +incdir+C:/digital_design_course_iit_bombay/verilog/50mhz_to_1hz {C:/digital_design_course_iit_bombay/verilog/50mhz_to_1hz/mod_10_counter.v}
vlog -vlog01compat -work work +incdir+C:/digital_design_course_iit_bombay/verilog/50mhz_to_1hz {C:/digital_design_course_iit_bombay/verilog/50mhz_to_1hz/mod_5_counter.v}
vlog -vlog01compat -work work +incdir+C:/digital_design_course_iit_bombay/verilog/50mhz_to_1hz {C:/digital_design_course_iit_bombay/verilog/50mhz_to_1hz/one_sec_clk.v}

vlog -vlog01compat -work work +incdir+C:/digital_design_course_iit_bombay/verilog/50mhz_to_1hz {C:/digital_design_course_iit_bombay/verilog/50mhz_to_1hz/testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
