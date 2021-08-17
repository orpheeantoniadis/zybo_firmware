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
# Project Name: zybo_pcam5c_zynqps
# Target Device: digilentinc.com:zybo-z7-20:part0:1.0 xc7z020clg400-1
# Tool version: 2020.2
# Description: Open Vivado project GUI
#
# Last update: 2021-08-10 12:21:11
#
##################################################################################

echo "> Open Vivado GUI..."
vivado -nojournal -nolog -notrace ../zybo_pcam5c_zynqps/zybo_pcam5c_zynqps.xpr
