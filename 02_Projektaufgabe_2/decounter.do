###############################################
#   Do File for Simulation of the decounter #
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

#-- Clock 1Hz for the decounting
force clk1Hz 1 0, 0 15ns -r 30ns

#-- Start button after debounce (1 -> start, 0 -> stop)
force start 0 0, 1 50ns, 0 1500ns, 1 2000ns 

#-- Single number of the second value coming from the counter (Here - begin at 1)
force snSecIn 10#1 0

#-- Tens of the second value coming from the counter (Here - begin at 1)
force tSecIn 10#1 0

#-- Single number of the minute value coming from the counter (Here - begin at 1)
force snMinIn 10#1 0

#-- Tens of the minute value coming from the counter (Here - begin at 0)
force tMinIn 10#0 0

#-- When the time of the counter has been changed (coming from the counter)
force changeIn 1 0, 0 50ns


#-- run the simulation for 15000ns
run 15000ns
