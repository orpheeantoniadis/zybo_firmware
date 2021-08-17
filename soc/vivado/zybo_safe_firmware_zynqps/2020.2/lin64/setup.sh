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
# Project Name: zybo_safe_firmware_zynqps
# Target Device: digilentinc.com:zybo-z7-20:part0:1.0 xc7z020clg400-1
# Tool version: 2020.2
# Description: TCL script creating aliases for Vivado project management scripts
#
# Last update: 2021-08-16 17:12:41
#
##################################################################################

# Create aliases
alias create_project='cd .scripts && ./create_prj_zybo_safe_firmware_zynqps.sh && cd ..'
alias clean_project='cd .scripts && ./clean_prj_zybo_safe_firmware_zynqps.sh && cd ..'
alias export_hw='cd .scripts && ./export_hw_zybo_safe_firmware_zynqps.sh && cd ..'
alias gen_bitstream='cd .scripts && ./gen_bitstream_zybo_safe_firmware_zynqps.sh && cd ..'
alias load_bitstream='cd .scripts && ./load_bitstream_zybo_safe_firmware_zynqps.sh && cd ..'
alias open_gui='cd .scripts && ./open_prj_zybo_safe_firmware_zynqps.sh && cd ..'
