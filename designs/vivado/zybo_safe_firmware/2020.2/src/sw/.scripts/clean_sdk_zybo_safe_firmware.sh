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
# Description: Cleanup Vitis SDK workspace directory
#
# Last update: 2021-08-16 17:12:45
#
##################################################################################

echo "> Cleanup SDK workspace directory..."

PRJ_DIR=..

# Clean current directory
rm -rf ./xrc.log/ 2> /dev/null
rm -rf ./.Xil/ 2> /dev/null

# Remove generated workspace directory
rm -rf ${PRJ_DIR}/sdk_workspace/ 2> /dev/null
rm -rf ${PRJ_DIR}/vitis_workspace/ 2> /dev/null

echo "> Done"
