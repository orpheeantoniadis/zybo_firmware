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
# Description: TCL script creating aliases for Vivado project management scripts
#
# Last update: 2021-01-14 11:10:09
#
##################################################################################

# Create aliases
alias create_project='cd .scripts && ./create_prj_axi4_pkg.sh && cd ..'
alias clean_project='cd .scripts && ./clean_prj_axi4_pkg.sh && cd ..'
alias export_hw='cd .scripts && ./export_hw_axi4_pkg.sh && cd ..'
alias gen_bitstream='cd .scripts && ./gen_bitstream_axi4_pkg.sh && cd ..'
alias load_bitstream='cd .scripts && ./load_bitstream_axi4_pkg.sh && cd ..'
alias gen_sw_apps='cd .scripts && ./gen_sw_apps_axi4_pkg.sh && cd ..'
alias load_sw_app='cd .scripts && ./load_sw_app_axi4_pkg.sh && cd ..'
alias open_gui='cd .scripts && ./open_prj_axi4_pkg.sh && cd ..'
