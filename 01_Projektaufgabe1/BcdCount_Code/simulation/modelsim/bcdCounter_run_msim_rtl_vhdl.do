transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Steve/Desktop/4-Hochschule_Offenburg/Semestre 7/VHDL/Projekt/01_Projektaufgabe1/BcdCounter/bcdCounter.vhd}
vcom -93 -work work {C:/Users/Steve/Desktop/4-Hochschule_Offenburg/Semestre 7/VHDL/Projekt/01_Projektaufgabe1/BcdCounter/bcdDecoder.vhd}

