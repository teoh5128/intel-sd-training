set target_library [list /nfs/png/disks/png_mip_gen6p9ddr_0032/huifente/sd_training/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.db /nfs/png/disks/png_mip_gen6p9ddr_0032/huifente/sd_training/sky130RTLDesignAndSynthesisWorkshop/lib/avsddac.db /nfs/png/disks/png_mip_gen6p9ddr_0032/huifente/sd_training/sky130RTLDesignAndSynthesisWorkshop/lib/avsdpll.db]
set link_library [list /nfs/png/disks/png_mip_gen6p9ddr_0032/huifente/sd_training/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.db /nfs/png/disks/png_mip_gen6p9ddr_0032/huifente/sd_training/sky130RTLDesignAndSynthesisWorkshop/lib/avsddac.db /nfs/png/disks/png_mip_gen6p9ddr_0032/huifente/sd_training/sky130RTLDesignAndSynthesisWorkshop/lib/avsdpll.db]
set symbol_library ""

read_file -format verilog {/nfs/png/disks/png_mip_gen6p9ddr_0032/huifente/sd_training/sky130RTLDesignAndSynthesisWorkshop/VSDBabySoC/src/module/vsdbabysoc.v}
read_verilog /nfs/png/disks/png_mip_gen6p9ddr_0032/huifente/sd_training/sky130RTLDesignAndSynthesisWorkshop/VSDBabySoC_ICC2/rvmyth.v
read_verilog /nfs/png/disks/png_mip_gen6p9ddr_0032/huifente/sd_training/sky130RTLDesignAndSynthesisWorkshop/VSDBabySoC_ICC2/clk_gate.v

#read_lib -lib /home/devipriya/VSDBabySoC/src/module/avsdpll.lib
#read_lib -lib /home/devipriya/VSDBabySoC/src/module/avsddac.lib

analyze -library WORK -format verilog {/nfs/png/disks/png_mip_gen6p9ddr_0032/huifente/sd_training/sky130RTLDesignAndSynthesisWorkshop/VSDBabySoC/src/module/vsdbabysoc.v}
elaborate vsdbabysoc -architecture verilog -library WORK
#nalyze {}

set_units -time ns
create_clock [get_pins {pll/CLK}] -name clk -period 10
set_max_area 8000;
set_max_fanout 5 vsdbabysoc;
set_max_transition 10 vsdbabysoc
#set_min_delay -max 10 -clock[get_clk myclk] [get_ports OUT]
set_max_delay 10 -from dac/OUT -to [get_ports OUT]

#set_input_delay[expr 0.34][all_inputs]

set_clock_latency -source 2 [get_clocks clk];
set_clock_latency 1 [get_clocks clk];
set_clock_uncertainty -setup 0.5 [get_clocks clk];
set_clock_uncertainty -hold 0.5 [get_clocks clk];

set_input_delay -max 4 -clock [get_clocks clk] [get_ports VCO_IN];
set_input_delay -max 4 -clock [get_clocks clk] [get_ports ENb_CP];
set_input_delay -min 1 -clock [get_clocks clk] [get_ports VCO_IN];
set_input_delay -min 1 -clock [get_clocks clk] [get_ports ENb_CP];

set_input_transition -max 0.4 [get_ports ENb_CP];
set_input_transition -max 0.4 [get_ports VCO_IN];
set_input_transition -min 0.1 [get_ports ENb_CP];
set_input_transition -min 0.1 [get_ports VCO_IN];

set_load -max 0.5 [get_ports OUT];
set_load -min 0.5 [get_ports OUT];

check_design

compile_ultra

file mkdir report
write -hierarchy -format verilog -output /nfs/png/disks/png_mip_gen6p9ddr_0032/huifente/sd_training/sky130RTLDesignAndSynthesisWorkshop/report/vsdbabysoc_gtlvl.v
write_sdc -nosplit -version 2.0  /nfs/png/disks/png_mip_gen6p9ddr_0032/huifente/sd_training/sky130RTLDesignAndSynthesisWorkshop/report/vsdbabysoc.sdc
report_area -hierarchy > /nfs/png/disks/png_mip_gen6p9ddr_0032/huifente/sd_training/sky130RTLDesignAndSynthesisWorkshop/VSDBabySoC/src/module/report/vsdbabysoc.area
report_timing > /nfs/png/disks/png_mip_gen6p9ddr_0032/huifente/sd_training/sky130RTLDesignAndSynthesisWorkshop/VSDBabySoC/src/module/report/vsdbabysoc.timing
report_power -hierarchy > /nfs/png/disks/png_mip_gen6p9ddr_0032/huifente/sd_training/sky130RTLDesignAndSynthesisWorkshop/VSDBabySoC/src/module/report/vsdbabysoc.power

gui_start

