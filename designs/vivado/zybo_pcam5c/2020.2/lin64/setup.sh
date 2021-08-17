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
# Description: TCL script creating aliases for Vivado project management scripts
#
# Last update: 2021-08-16 12:48:58
#
##################################################################################

# Create aliases
alias create_project='cd .scripts && ./create_prj_zybo_pcam5c.sh && cd ..'
alias clean_project='cd .scripts && ./clean_prj_zybo_pcam5c.sh && cd ..'
alias export_hw='cd .scripts && ./export_hw_zybo_pcam5c.sh && cd ..'
alias gen_bitstream='cd .scripts && ./gen_bitstream_zybo_pcam5c.sh && cd ..'
alias load_bitstream='cd .scripts && ./load_bitstream_zybo_pcam5c.sh && cd ..'
alias open_gui='cd .scripts && ./open_prj_zybo_pcam5c.sh && cd ..'
