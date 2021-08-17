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
# Description: Generate bitstream file
#
# Last update: 2021-08-16 17:12:45
#
##################################################################################

PRJ_DIR=..

echo "> Generate bitstream file..."
vivado -nojournal -nolog -mode tcl -source ./gen_bitstream_zybo_safe_firmware.tcl -notrace

echo "> Copy bitstream file in current directory..."
mkdir -p ${PRJ_DIR}/bitstream/
cp ${PRJ_DIR}/zybo_safe_firmware/zybo_safe_firmware.runs/impl_1/zybo_safe_firmware.bit ${PRJ_DIR}/bitstream/zybo_safe_firmware.bit

echo "> Done"

