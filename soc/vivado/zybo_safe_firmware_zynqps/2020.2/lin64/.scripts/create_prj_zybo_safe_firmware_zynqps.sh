#!/bin/sh

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
# Description: Create Vivado project
#
# Last update: 2021-08-16 17:12:41
#
##################################################################################

echo "> Create Vivado project..."
vivado -nojournal -nolog -mode tcl -source create_prj_zybo_safe_firmware_zynqps.tcl -notrace
echo "> Done"

