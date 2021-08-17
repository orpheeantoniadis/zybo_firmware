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
# Project Name: zybo_safe_firmware
# Target Device: digilentinc.com:zybo-z7-20:part0:1.0 xc7z020clg400-1
# Tool version: 2020.2
# Description: Export the hardware design to SDK
#
# Last update: 2021-08-16 17:12:45
#
##################################################################################

echo "> Export the hardware design to SDK"

vivado -nojournal -nolog -mode tcl -source ./export_hw_zybo_safe_firmware.tcl -notrace

echo "> Done"

