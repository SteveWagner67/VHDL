###############################################
#   Do File for Simulation of the counter #
#-- Author: Steve Wagner
#-- Matrikelnummer: 175309
#-- Datum: 	13/11/2015
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

#-- Clear button after debounce (1 -> button pushed, 0 -> button released)
force clr 0 0, 1 130ns, 0 142ns, 1 178ns, 0 192ns

#-- Start button after debounce (1 -> start, 0 -> stop)
force start 1 0, 0 12ns, 1 150ns

#-- Increment second button after debounce (1 -> button pushed, 0 -> button released)
force incSec 0 0, 1 23ns, 0 44ns, 1 58ns, 0 72ns, 1 98ns, 0 113ns, 1 160ns, 0 172ns

#-- Increment minute button after debounce (1 -> button pushed, 0 -> button released)
force incMin 0 0, 1 21ns, 0 48ns, 1 62ns, 0 80ns, 1 101ns, 0 120ns, 1 167ns, 0 179ns

#-- Single number of the second value coming from the decounter (0-9) (Here begin at 9)
force snSecIn 10#9 0

#-- Tens of the second value coming from the decounter (0-9) (Here begin at 5)
force tSecIn 10#5 0

#-- Single number of the minute value coming from the decounter (0-9) (Here begin at 9)
force snMinIn 10#9 0

#-- Tens of the minute value coming from the decounter (0-9) (Here begin at 9)
force tMinIn 10#9 0

#-- Time over -> when the value of the decounter is 00:00 (1 -> time is over, 0-> time is not over)
#force timeOver 0 0

#-- When the time of the decounter change (coming from the decounter)
#force changeIn 0 0

#-- run the simulation for 300ns
run 300ns



