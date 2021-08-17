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
# Description: TCL script creating aliases for Vitis workspace management scripts
#
# Last update: 2021-08-16 12:48:58
#
##################################################################################

# Create aliases
alias gen_sw_apps='cd .scripts && ./gen_sw_apps_zybo_pcam5c.sh && cd ..'
# TODO: Not supported yet
#alias load_sw_app='cd .scripts && ./load_sw_app_zybo_pcam5c.sh && cd ..'
alias open_sdk='cd .scripts && ./open_sdk_zybo_pcam5c.sh && cd ..'
alias clean_sdk='cd .scripts && ./clean_sdk_zybo_pcam5c.sh && cd ..'
