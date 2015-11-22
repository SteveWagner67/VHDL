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
#force startBtn 1 0, 0 1000ns, 1 1001ns
force startBtn 1 0, 0 1000ns, 1 1001ns, 0 2000ns, 1 2025ns, 0 2500ns, 1 2550ns, 0 6000ns, 1 6050ns, 0 6500ns, 1 6525ns, 0 7250ns, 1 7275ns, 0 7700ns, 1 7725ns, 0 9700ns, 1 9725ns

#-- Clear
force clrBtn 1 0, 0 500ns, 1 530ns

#-- Tast to increment the second
force incSecBtn 0 0, 1 18ns, 0 110ns, 1 125ns, 0 187ns, 1 203ns, 0 310ns, 1 340ns, 0 368ns, 1 402ns, 0 452ns, 1 508ns, 0 520ns, 1 565ns, 0 610ns, 1 625ns, 0 687ns, 1 703ns, 0 710ns, 1 740ns, 0 768ns, 1 802ns, 0 852ns, 1 908ns, 0 2200ns, 1 2258ns

#-- Tast to increment the minute
force incMinBtn 0 0

#-- run the simulation for 1000ns
run 10000ns
