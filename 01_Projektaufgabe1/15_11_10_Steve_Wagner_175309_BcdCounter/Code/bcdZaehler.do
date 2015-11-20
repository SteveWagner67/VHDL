###############################################
#   Do File for Simulation of the BCD-Counter #
#-- Author: Steve Wagner
#-- Matrikelnummer: 175309
#-- Datum: 	10/11/2015
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
force clk  0 0, 1 5ns -r 10ns
#-- Reset occured at 275ns till 280ns and at 380ns till 390ns
force rst 1 0ns, 0 275ns, 1 280ns, 0 380ns, 1 390ns
#-- Enable at 1 at 100ns till 410 and at 450ns till the end of the simulation
force en 0 0, 1 100ns, 0 410ns, 1 450ns 


#-- run the simulation for 500ns
run 500ns
