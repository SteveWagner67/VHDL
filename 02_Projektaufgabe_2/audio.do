###########################################################################################################
#   Do File for Simulation of the audio#
#-- Author: Steve Wagner
#-- Matrikelnummer: 175309
#-- Datum: 	14/11/2015
###########################################################################################################
###########################################################################################################
#
#-- For this simulation, change the value x in the IF-Condition -> if(second < x) in audio.vhd (20 seconds)
#
###########################################################################################################


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

#-- Clock period of 20ns with 10ns high state and 10ns low state
force clk  1 0, 0 10ns -r 20ns

# Clock 1/4Hz for each "bip"
force clkQHz  0 0, 1 25ns -r 50ns

# Signal's frequence the heard the sound
force freqSignal 0 0, 1 11ns -r 22ns

# Time over -> when the value of the time is 00:00 (1-> time over, 0 -> time not over)
force timeOver 1 0

#-- run the simulation for 5000ns
run 5000ns
