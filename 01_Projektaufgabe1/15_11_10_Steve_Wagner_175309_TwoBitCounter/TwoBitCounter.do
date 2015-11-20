###################################################
#   Do File for Simulation of the Two-Bit-Counter #
#-- Author: Steve Wagner
#-- Matrikelnummer: 175309
#-- Datum: 	10/11/2015
###################################################

# -- Undock wave Window
view –undock –title {VHDL_Kurs} wave

# -- Restart Simulation 
restart -force -nolist -nowave -nobreak -nolog
onerror {resume}

#--log all waves including the not shown ones
log -r /*

#-- Add the waves needed to be displayed 
add wave /*



#Clock with a period of 10ns - 5ns at 1 and 5ns at 0 - begin at 0
force clk  0 0, 1 5ns -r 10ns
#Reset at 0ns till 10ns
force reset 1 10ns
#Switch of the counter sense at 500ns - up at 0 and down at 1
force up 1 0, 0 500ns
force down 0 0, 1 500ns


#-- run the simulation for 1000ns
run 1000ns
