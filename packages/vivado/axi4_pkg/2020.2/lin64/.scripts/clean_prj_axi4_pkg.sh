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
# Author: Joachim Schmidt <joachim.schmidt@hesge.ch>
#
# Project Name: axi4_pkg
# Target Device: hepia-cores.ch:scalp_node:part0:0.1 xc7z015clg485-2
# Tool version: 2020.2
# Description: Cleanup project directory
#
# Last update: 2021-01-14 11:10:09
#
##################################################################################

echo "> Cleanup project directory..."

PRJ_DIR=..

# Clean current directory
rm -rf ${PRJ_DIR}/.Xil/ 2> /dev/null

# Remove generated project directory
rm -rf ${PRJ_DIR}/axi4_pkg/ 2> /dev/null

# Clean app directory
rm ${PRJ_DIR}/app/*.h 2> /dev/null
rm ${PRJ_DIR}/app/*.c 2> /dev/null
rm ${PRJ_DIR}/app/*.html 2> /dev/null

echo "> Done"

