# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {HDL-1065} -limit 10000
create_project -in_memory -part xcku115-flvf1924-2-e

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/ruanyuan/CLOUD/fpga_cloud/0509/fpga-cloud/baidu_hw_design_toolkit/build/projDir/myProj.cache/wt [current_project]
set_property parent.project_path /home/ruanyuan/CLOUD/fpga_cloud/0509/fpga-cloud/baidu_hw_design_toolkit/build/projDir/myProj.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths /home/ruanyuan/CLOUD/fpga_cloud/0509/fpga-cloud/baidu_hw_design_toolkit/usr_files/usr_ip_resposity [current_project]
set_property ip_output_repo /home/ruanyuan/CLOUD/fpga_cloud/0509/fpga-cloud/baidu_hw_design_toolkit/build/projDir/myProj.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog /home/ruanyuan/CLOUD/fpga_cloud/0509/fpga-cloud/baidu_hw_design_toolkit/common_files/hdl/usr_ddr4_define.vh
read_verilog -library xil_defaultlib {
  /home/ruanyuan/CLOUD/fpga_cloud/0509/fpga-cloud/baidu_hw_design_toolkit/usr_files/usr_rtl/usr_counter.v
  /home/ruanyuan/CLOUD/fpga_cloud/0509/fpga-cloud/baidu_hw_design_toolkit/common_files/hdl/rp_bd_wrapper.v
}
read_ip -quiet /home/ruanyuan/CLOUD/fpga_cloud/0509/fpga-cloud/baidu_hw_design_toolkit/build/projDir/myProj.srcs/sources_1/ip/pr_region_dbg_bridge/pr_region_dbg_bridge.xci
set_property is_locked true [get_files /home/ruanyuan/CLOUD/fpga_cloud/0509/fpga-cloud/baidu_hw_design_toolkit/build/projDir/myProj.srcs/sources_1/ip/pr_region_dbg_bridge/pr_region_dbg_bridge.xci]

add_files /home/ruanyuan/CLOUD/fpga_cloud/0509/fpga-cloud/baidu_hw_design_toolkit/build/projDir/myProj.srcs/sources_1/bd/rp_bd/rp_bd.bd
set_property is_locked true [get_files /home/ruanyuan/CLOUD/fpga_cloud/0509/fpga-cloud/baidu_hw_design_toolkit/build/projDir/myProj.srcs/sources_1/bd/rp_bd/rp_bd.bd]

foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/ruanyuan/CLOUD/fpga_cloud/0509/fpga-cloud/baidu_hw_design_toolkit/common_files/constraints/rp_bd_wrapper_ooc.xdc

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top rp_bd_wrapper -part xcku115-flvf1924-2-e -mode out_of_context

rename_ref -prefix_all rp_bd_wrapper_

write_checkpoint -force -noxdef rp_bd_wrapper.dcp

catch { report_utilization -file rp_bd_wrapper_utilization_synth.rpt -pb rp_bd_wrapper_utilization_synth.pb }
