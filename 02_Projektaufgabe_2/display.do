###############################################
#   Do File for Simulation of the display #
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

#-- Clock period of 20ns with 10ns high and 10ns low
force clk  1 0, 0 10ns -r 20ns

#-- Integer corresponding to the value to display (0-9)
force nb 10#0 0, 10#1 100ns, 10#2 200ns, 10#3 300ns, 10#4 400ns, 10#5 500ns, 10#6 600ns, 10#7 700ns, 10#8 800ns, 10#9 900ns 

#-- run the simulation for 1000ns
run 1000ns
