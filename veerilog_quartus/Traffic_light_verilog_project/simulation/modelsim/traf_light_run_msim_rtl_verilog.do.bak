transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/digital_design_course_iit_bombay/verilog/Traffic_light {C:/digital_design_course_iit_bombay/verilog/Traffic_light/tff_1.v}
vlog -vlog01compat -work work +incdir+C:/digital_design_course_iit_bombay/verilog/Traffic_light {C:/digital_design_course_iit_bombay/verilog/Traffic_light/one_sec_clk.v}
vlog -vlog01compat -work work +incdir+C:/digital_design_course_iit_bombay/verilog/Traffic_light {C:/digital_design_course_iit_bombay/verilog/Traffic_light/mod_10_counter.v}
vlog -vlog01compat -work work +incdir+C:/digital_design_course_iit_bombay/verilog/Traffic_light {C:/digital_design_course_iit_bombay/verilog/Traffic_light/mod_5_counter.v}
vlog -vlog01compat -work work +incdir+C:/digital_design_course_iit_bombay/verilog/Traffic_light {C:/digital_design_course_iit_bombay/verilog/Traffic_light/traf_light.v}
vlog -vlog01compat -work work +incdir+C:/digital_design_course_iit_bombay/verilog/Traffic_light {C:/digital_design_course_iit_bombay/verilog/Traffic_light/encoder_4_2.v}

vlog -vlog01compat -work work +incdir+C:/digital_design_course_iit_bombay/verilog/Traffic_light {C:/digital_design_course_iit_bombay/verilog/Traffic_light/testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L maxv_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
