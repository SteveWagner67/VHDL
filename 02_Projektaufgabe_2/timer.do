#############################################################################################################################################
#   Do File for Simulation of the timer #
#-- Author: Steve Wagner
#-- Matrikelnummer: 175309
#-- Datum: 	14/11/2015
#############################################################################################################################################
#############################################################################################################################################
#
#-- For this simulation should the time of clock1Hz (500ns), clockQHz (250ns) and freqSignal (50ns) be changed in timer.vhd (end of the file)
#-- the value of the countClk in the If-Condition (value = (time in ns) / 20ns) in debounce.vhd should be changed too (value = 2 -> 40ns)
#
#############################################################################################################################################
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

#-- Clock period of 20ns with 10ns high and 10ns low state
force clk50MHz  1 0, 0 10ns -r 20ns

#-- Clear button without debounce (0 -> pushed, 1-> released)
force clrBtn 1 0, 0 1250ns, 1 1300ns

#-- Start button without debounce (0 -> pushed, 1-> released)
force startBtn 1 0, 0 1500ns, 1 1550ns, 0 2000ns, 1 2250ns, 0 2520ns, 1 2600ns, 0 7200ns, 1 7250ns

#-- Increment second button without debounce (0 -> pushed, 1-> released)
force incSecBtn 1 0, 0 44ns -r 90ns -cancel 950ns
force incSecBtn 1 1000ns, 0 1358ns, 1 1402ns, 0 1458ns, 1 1502ns
force incSecBtn 0 2358ns, 1 2402ns, 0 2454ns, 1 2498ns, 0 7400ns, 1 7450ns

#-- Increment minute button without debounce (0 -> pushed, 1-> released)
force incMinBtn 1 0, 0 52 ns -r 97ns -cancel 1100ns
force incMinBtn 1 1150ns, 0 7300ns, 1 7350ns



#-- run the simulation for 8000ns
run 8000ns
