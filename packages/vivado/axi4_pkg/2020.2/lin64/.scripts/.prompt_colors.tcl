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
# Description: Console color print utility
#
# Last update: 2021-01-14 11:10:09
#
##################################################################################

# Text attributes
set RESET [exec tput sgr0]
set BOLD [exec tput bold]
set ITALIC [exec tput sitm]
set BLINK [exec tput blink]
set HIGHL [exec tput smso]

# Text colors
set RED [exec tput setaf 1]
set GREEN [exec tput setaf 2]
set YELLOW [exec tput setaf 3]
set BLUE [exec tput setaf 4]
set MAGENTA [exec tput setaf 5]
set CYAN [exec tput setaf 6]
set WHITE [exec tput setaf 7]

