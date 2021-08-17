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
# Description: Create Vivado project
#
# Last update: 2021-01-14 11:10:09
#
##################################################################################

echo "> Create Vivado project..."
vivado -nojournal -nolog -mode tcl -source create_prj_axi4_pkg.tcl -notrace
echo "> Done"

