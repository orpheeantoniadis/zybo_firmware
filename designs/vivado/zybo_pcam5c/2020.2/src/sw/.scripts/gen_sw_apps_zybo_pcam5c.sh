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
# Description: Generate Vitis workspace for software applications
#
# Last update: 2021-08-16 12:48:58
#
##################################################################################

XSDK_LIMIT_VERSION="2017.4"

# @brief Compare version strings
# @param $1 The current version to be compared
# @param $2 The version to be compared with
# @return 0 if the current version is greater or equal to the compared version
#         1 otherwise
cmp_version () {
 if [ "$(printf '%s\n' "$1" "$2" | sort -V | head -n1)" = "$2" ]; then 
        return 0
 else
        return 1
 fi
}

if cmp_version "2020.2" $XSDK_LIMIT_VERSION; then
  echo "> Generate Vitis workspace software applications"
  xsct gen_sw_apps_zybo_pcam5c.tcl
else
  echo "> Generate SDK workspace software applications"
  xsdk -batch -source ./gen_sw_apps_zybo_pcam5c.tcl -notrace
fi

echo "> Done"
