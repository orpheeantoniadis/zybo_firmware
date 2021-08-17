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
# Project Name: zybo_pcam5c
# Target Device: digilentinc.com:zybo-z7-20:part0:1.0 xc7z020clg400-1
# Tool version: 2020.2
# Description: Load bitstream file
#
# Last update: 2021-08-16 12:48:58
#
##################################################################################

echo "> Load bitstream file..."
vivado -nojournal -nolog -mode tcl -source ./load_bitstream_zybo_pcam5c.tcl -notrace
echo "> Done"

