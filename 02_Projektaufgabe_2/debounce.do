########################################################################################################################################
#   Do File for Simulation of the debounce #
#-- Author: Steve Wagner
#-- Matrikelnummer: 175309
#-- Datum: 	14/11/2015
########################################################################################################################################
#
#-- For this simulation,  the value of the countClk in the If-Condition (value = (time in ns) / 20ns) in debounce.vhd should be changed
#
########################################################################################################################################

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


#-- Button to debounce (0 -> button pushed, 1 -> button released)
force button 1 0, 0 100ns, 1 300ns, 0 500ns, 1 900ns


#-- run the simulation for 1000ns
run 1000ns
