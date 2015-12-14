###################################################################################################
#   Do File for Simulation of the frequence divider#
#-- Author: Steve Wagner
#-- Matrikelnummer: 175309
#-- Datum: 	13/11/2015
###################################################################################################

# -- Undock wave Window
view –undock –title {VHDL_Kurs} wave

# -- Restart Simulation 
restart -force -nolist -nowave -nobreak -nolog
onerror {resume}

#--log all waves including the not shown ones
log -r /*

#-- add all the waves /*
add wave /*

#--------------------FORCE SIGNALS ---------

#-- Clock period of 20ns with 10ns high and 10ns low
force clk50M  1 0, 0 10ns -r 20ns

#-- Correspond to the state of a button (0 -> button pushed, 1 -> button released) to active or not the output clock (here always active)
force en 1 0

#-- Time wishes in the output (INTEGER)
force periodns 10#500

#-- run the simulation for 15000ns
run 1000ns
