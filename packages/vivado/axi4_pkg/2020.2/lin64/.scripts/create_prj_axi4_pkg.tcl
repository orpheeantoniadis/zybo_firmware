##################################################################################
#                                 _             _
#                                | |_  ___ _ __(_)__ _
#                                | ' \/ -_) '_ \ / _` |
#                                |_||_\___| .__/_\__,_|
#                                         |_|
#
##################################################################################
#
# Company: hepia
# Author: Joachim Schmidt <joachim.schmidt@hesge.ch>
#
# Project Name: axi4_pkg
# Target Device: hepia-cores.ch:scalp_node:part0:0.1 xc7z015clg485-2
# Tool version: 2020.2
# Description: TCL script for re-creating Vivado project 'axi4_pkg'
#
# Last update: 2021-01-14 11:10:09
#
##################################################################################

# Include files
source utils.tcl

set PRJ_DIR ".."
set prj_name "axi4_pkg"
set PKG_DIR "${PRJ_DIR}/../../../../../packages"
set SOC_DIR "${PRJ_DIR}/../../../../../soc/"

# Set project type
set PRJ_TYPE "COMP_PRJ_TYPE"

# Create a variable to store the start time
set start_time [clock format [clock seconds] -format {%b. %d, %Y %I:%M:%S %p}]

# Set the original project directory path for adding/importing sources in the new project
set src_dir "${PRJ_DIR}/../src"
set ip_dir "${PRJ_DIR}/../../../../../packages/hw"
set comp_dir "${ip_dir}/$prj_name"
set comp_src_dir "${comp_dir}/src"
set pkg_src_dir "${PKG_DIR}/hw"
set soc_src_dir "${SOC_DIR}/hw"
print_status "Set directory paths" "OK"

# Create the project
create_project $prj_name ${PRJ_DIR}/$prj_name -part xc7z015clg485-2
set_property board_part hepia-cores.ch:scalp_node:part0:0.1 [current_project]
set_property target_language VHDL [current_project]
print_status "Create project" "OK"

# Map the IP Repository so that custom IP is included
set_property ip_repo_paths $ip_dir [current_fileset]
update_ip_catalog

#----------------------------------------------------------------
# Add project sources
#----------------------------------------------------------------

if {$PRJ_TYPE == "DESIGN_PRJ_TYPE"} {
	# add HDL sources
	set vhdl_src_file_list [findFiles $src_dir/hdl *.vhd]
	set verilog_src_file_list [findFiles $src_dir/hdl *.v]
	set hdl_src_file_list [list {*}$vhdl_src_file_list {*}$verilog_src_file_list]
	add_files -norecurse $hdl_src_file_list    
	# add the constraints file (XDC)
	add_files -fileset constrs_1 -norecurse  $src_dir/constrs/${prj_name}.xdc
	set_property is_enabled true [get_files $src_dir/constrs/${prj_name}.xdc]

	# add IPs source file
  
} elseif {$PRJ_TYPE == "COMP_PRJ_TYPE"} {
	# components sources are stored in an external directory
	# add the project component
	set vhdl_src_file_list [findFiles $comp_src_dir/hdl *.vhd]
	set verilog_src_file_list [findFiles $comp_src_dir/hdl *.v]
	set hdl_src_file_list [list {*}$vhdl_src_file_list {*}$verilog_src_file_list]
	add_files -norecurse $hdl_src_file_list
	# add IPs source file
  
	# add IP-XACT source file
	#add_files -norecurse $comp_dir/component.xml
}
print_status "Add project sources" "OK"

foreach j $vhdl_src_file_list {
    set_property file_type {VHDL 2008} [get_files  $j]
    print_status "VHDL 2008 mode configured for the file $j" "OK"
}
print_status "VHDL 2008 mode configured for project sources" "OK"

#----------------------------------------------------------------
# Add constraints files
#----------------------------------------------------------------


# Set packages libraries if any
#set_property library library_name [get_files  $src_dir/hdl/package_name.vhd]
#update_compile_order -fileset sources_1

# Create the IP Integrator portion of the design
#create_bd_design "axi_design"
#update_compile_order -fileset sources_1

# launch the TCL script to generate the IPI design
source $src_dir/ipi_tcl/${prj_name}_ipi.tcl
print_status "Add IPI design" "OK"

# Set the top level design
set_property top $prj_name [current_fileset]
update_compile_order -fileset sources_1

# Add testbench sources
if {$PRJ_TYPE == "DESIGN_PRJ_TYPE"} {
	set vhdl_sim_file_list [findFiles $src_dir/sim *.vhd]
	set verilog_sim_file_list [findFiles $src_dir/sim *.v]
} elseif {$PRJ_TYPE == "COMP_PRJ_TYPE"} {
	set vhdl_sim_file_list [findFiles $comp_src_dir/sim *.vhd]
	set verilog_sim_file_list [findFiles $comp_src_dir/sim *.v]
}
set hdl_sim_file_list [list {*}$vhdl_sim_file_list {*}$verilog_sim_file_list]
add_files -fileset sim_1 -norecurse $hdl_sim_file_list
update_compile_order -fileset sim_1
print_status "Add testbench sources" "OK"

foreach j $vhdl_sim_file_list {
    set_property file_type {VHDL 2008} [get_files  $j]
    print_status "VHDL 2008 mode configured for the file $j" "OK"
}
print_status "VHDL 2008 mode configured for testbench sources" "OK"

# Add packages sources


# Add SoC wrapper sources files


# Set the completion time
set end_time [clock format [clock seconds] -format {%b. %d, %Y %I:%M:%S %p}]

# Display the start and end time to the screen
puts $start_time
puts $end_time

exit
