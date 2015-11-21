###############################################
#   Do File for Simulation of the timer #
#-- Author: Steve Wagner
#-- Matrikelnummer: 175309
#-- Datum: 	14/11/2015
###############################################

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

#-- Clock period of 10ns with 5ns high and 5ns low
force clk50MHz  1 0, 0 10ns -r 20ns

#-- Start/Stop
force startBtn 1 0, 0 1000ns, 1 1001ns, 0 3000ns, 1 3001ns
#force startBtn 1 0

#-- Clear
force clrBtn 1 0, 0 500ns, 1 530ns

#-- Tast to increment the second
force incSecBtn 0 0, 1 25ns -r 35ns

#-- Tast to increment the minute
force incMinBtn 0 0

#-- run the simulation for 1000ns
run 5000ns
