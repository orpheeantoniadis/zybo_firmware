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
# Author: Orphee Antoniadis <orphee.antoniadis@hesge.ch>
#
# Project Name: zybo_pcam5c
# Target Device: digilentinc.com:zybo-z7-20:part0:1.0 xc7z020clg400-1
# Tool version: 2020.2
# Description: Export the hardware design to Vitis SDK
#
# Last update: 2021-08-16 12:48:58
#
##################################################################################

source utils.tcl

# Project paths
set PRJ_DIR ".."
set SRC_DIR "${PRJ_DIR}/../src"
set EXPORT_DIR "${SRC_DIR}/sw/hw_export"

# Initialize workspace directories name
set prj_name "zybo_pcam5c"
# Create the export directory if not present
file mkdir ${EXPORT_DIR}
print_status "Initialize workspace directories" "OK"

# Open the project
open_project -verbose ${PRJ_DIR}/${prj_name}/${prj_name}.xpr
print_status "Open project $prj_name" "OK"

# Export the hardware including the bitstream
if {[version -short] < "2019.2"} {
    # Before Vivado 2019.2, export the .hdf
    set IMPL_DIR "${PRJ_DIR}/${prj_name}/${prj_name}.runs/impl_1/"
    file copy -force ${IMPL_DIR}/${prj_name}.sysdef ${EXPORT_DIR}/${prj_name}.hdf
} else {
    # Starting with Vivado 2019.2, export the .xsa
    write_hw_platform -fixed -force -include_bit -file ${EXPORT_DIR}/${prj_name}.xsa
}
print_status "Export hardware to SDK" "OK"

exit
