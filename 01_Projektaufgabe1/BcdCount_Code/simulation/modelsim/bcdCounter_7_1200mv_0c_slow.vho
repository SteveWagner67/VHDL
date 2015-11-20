-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 15.0.2 Build 153 07/15/2015 SJ Web Edition"

-- DATE "11/10/2015 09:51:21"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	bcdDecoder IS
    PORT (
	rst : IN std_logic;
	clk : IN std_logic;
	en : IN std_logic;
	a_seg : OUT std_logic;
	b_seg : OUT std_logic;
	c_seg : OUT std_logic;
	d_seg : OUT std_logic;
	e_seg : OUT std_logic;
	f_seg : OUT std_logic;
	g_seg : OUT std_logic
	);
END bcdDecoder;

-- Design Ports Information
-- a_seg	=>  Location: PIN_M24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b_seg	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c_seg	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d_seg	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- e_seg	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- f_seg	=>  Location: PIN_U23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_seg	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- en	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF bcdDecoder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_en : std_logic;
SIGNAL ww_a_seg : std_logic;
SIGNAL ww_b_seg : std_logic;
SIGNAL ww_c_seg : std_logic;
SIGNAL ww_d_seg : std_logic;
SIGNAL ww_e_seg : std_logic;
SIGNAL ww_f_seg : std_logic;
SIGNAL ww_g_seg : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \countDec|WideNor0~9clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \a_seg~output_o\ : std_logic;
SIGNAL \b_seg~output_o\ : std_logic;
SIGNAL \c_seg~output_o\ : std_logic;
SIGNAL \d_seg~output_o\ : std_logic;
SIGNAL \e_seg~output_o\ : std_logic;
SIGNAL \f_seg~output_o\ : std_logic;
SIGNAL \g_seg~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \countDec|Add1~0_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \en~input_o\ : std_logic;
SIGNAL \countDec|Add0~0_combout\ : std_logic;
SIGNAL \countDec|countClk~0_combout\ : std_logic;
SIGNAL \countDec|Add0~1\ : std_logic;
SIGNAL \countDec|Add0~2_combout\ : std_logic;
SIGNAL \countDec|Add0~3\ : std_logic;
SIGNAL \countDec|Add0~4_combout\ : std_logic;
SIGNAL \countDec|Add0~5\ : std_logic;
SIGNAL \countDec|Add0~6_combout\ : std_logic;
SIGNAL \countDec|Add0~7\ : std_logic;
SIGNAL \countDec|Add0~8_combout\ : std_logic;
SIGNAL \countDec|Equal0~9_combout\ : std_logic;
SIGNAL \countDec|Add0~9\ : std_logic;
SIGNAL \countDec|Add0~10_combout\ : std_logic;
SIGNAL \countDec|Add0~11\ : std_logic;
SIGNAL \countDec|Add0~12_combout\ : std_logic;
SIGNAL \countDec|Add0~13\ : std_logic;
SIGNAL \countDec|Add0~14_combout\ : std_logic;
SIGNAL \countDec|countClk~12_combout\ : std_logic;
SIGNAL \countDec|Add0~15\ : std_logic;
SIGNAL \countDec|Add0~16_combout\ : std_logic;
SIGNAL \countDec|Equal0~8_combout\ : std_logic;
SIGNAL \countDec|Add0~17\ : std_logic;
SIGNAL \countDec|Add0~18_combout\ : std_logic;
SIGNAL \countDec|Add0~19\ : std_logic;
SIGNAL \countDec|Add0~20_combout\ : std_logic;
SIGNAL \countDec|Add0~21\ : std_logic;
SIGNAL \countDec|Add0~22_combout\ : std_logic;
SIGNAL \countDec|Add0~23\ : std_logic;
SIGNAL \countDec|Add0~24_combout\ : std_logic;
SIGNAL \countDec|countClk~11_combout\ : std_logic;
SIGNAL \countDec|Add0~25\ : std_logic;
SIGNAL \countDec|Add0~26_combout\ : std_logic;
SIGNAL \countDec|countClk~10_combout\ : std_logic;
SIGNAL \countDec|Add0~27\ : std_logic;
SIGNAL \countDec|Add0~28_combout\ : std_logic;
SIGNAL \countDec|countClk~9_combout\ : std_logic;
SIGNAL \countDec|Add0~29\ : std_logic;
SIGNAL \countDec|Add0~30_combout\ : std_logic;
SIGNAL \countDec|countClk~8_combout\ : std_logic;
SIGNAL \countDec|Add0~31\ : std_logic;
SIGNAL \countDec|Add0~32_combout\ : std_logic;
SIGNAL \countDec|Add0~33\ : std_logic;
SIGNAL \countDec|Add0~34_combout\ : std_logic;
SIGNAL \countDec|countClk~7_combout\ : std_logic;
SIGNAL \countDec|Add0~35\ : std_logic;
SIGNAL \countDec|Add0~36_combout\ : std_logic;
SIGNAL \countDec|Add0~37\ : std_logic;
SIGNAL \countDec|Add0~38_combout\ : std_logic;
SIGNAL \countDec|countClk~6_combout\ : std_logic;
SIGNAL \countDec|Add0~39\ : std_logic;
SIGNAL \countDec|Add0~40_combout\ : std_logic;
SIGNAL \countDec|countClk~5_combout\ : std_logic;
SIGNAL \countDec|Add0~41\ : std_logic;
SIGNAL \countDec|Add0~42_combout\ : std_logic;
SIGNAL \countDec|countClk~4_combout\ : std_logic;
SIGNAL \countDec|Add0~43\ : std_logic;
SIGNAL \countDec|Add0~44_combout\ : std_logic;
SIGNAL \countDec|countClk~3_combout\ : std_logic;
SIGNAL \countDec|Add0~45\ : std_logic;
SIGNAL \countDec|Add0~46_combout\ : std_logic;
SIGNAL \countDec|countClk~2_combout\ : std_logic;
SIGNAL \countDec|Add0~47\ : std_logic;
SIGNAL \countDec|Add0~48_combout\ : std_logic;
SIGNAL \countDec|Equal0~2_combout\ : std_logic;
SIGNAL \countDec|Add0~49\ : std_logic;
SIGNAL \countDec|Add0~50_combout\ : std_logic;
SIGNAL \countDec|countClk~1_combout\ : std_logic;
SIGNAL \countDec|Add0~51\ : std_logic;
SIGNAL \countDec|Add0~52_combout\ : std_logic;
SIGNAL \countDec|Add0~53\ : std_logic;
SIGNAL \countDec|Add0~54_combout\ : std_logic;
SIGNAL \countDec|Add0~55\ : std_logic;
SIGNAL \countDec|Add0~56_combout\ : std_logic;
SIGNAL \countDec|Equal0~1_combout\ : std_logic;
SIGNAL \countDec|Equal0~3_combout\ : std_logic;
SIGNAL \countDec|Add0~57\ : std_logic;
SIGNAL \countDec|Add0~58_combout\ : std_logic;
SIGNAL \countDec|Add0~59\ : std_logic;
SIGNAL \countDec|Add0~60_combout\ : std_logic;
SIGNAL \countDec|Add0~61\ : std_logic;
SIGNAL \countDec|Add0~62_combout\ : std_logic;
SIGNAL \countDec|Equal0~0_combout\ : std_logic;
SIGNAL \countDec|Equal0~4_combout\ : std_logic;
SIGNAL \countDec|Equal0~5_combout\ : std_logic;
SIGNAL \countDec|Equal0~6_combout\ : std_logic;
SIGNAL \countDec|Equal0~7_combout\ : std_logic;
SIGNAL \countDec|Equal0~10_combout\ : std_logic;
SIGNAL \countDec|countBcd[31]~0_combout\ : std_logic;
SIGNAL \countDec|Add1~1\ : std_logic;
SIGNAL \countDec|Add1~2_combout\ : std_logic;
SIGNAL \countDec|countBcd~2_combout\ : std_logic;
SIGNAL \countDec|Add1~3\ : std_logic;
SIGNAL \countDec|Add1~4_combout\ : std_logic;
SIGNAL \countDec|Add1~5\ : std_logic;
SIGNAL \countDec|Add1~6_combout\ : std_logic;
SIGNAL \countDec|countBcd~1_combout\ : std_logic;
SIGNAL \countDec|Add1~7\ : std_logic;
SIGNAL \countDec|Add1~8_combout\ : std_logic;
SIGNAL \countDec|Add1~9\ : std_logic;
SIGNAL \countDec|Add1~10_combout\ : std_logic;
SIGNAL \countDec|Add1~11\ : std_logic;
SIGNAL \countDec|Add1~12_combout\ : std_logic;
SIGNAL \countDec|Add1~13\ : std_logic;
SIGNAL \countDec|Add1~14_combout\ : std_logic;
SIGNAL \countDec|Add1~15\ : std_logic;
SIGNAL \countDec|Add1~16_combout\ : std_logic;
SIGNAL \countDec|Add1~17\ : std_logic;
SIGNAL \countDec|Add1~18_combout\ : std_logic;
SIGNAL \countDec|Add1~19\ : std_logic;
SIGNAL \countDec|Add1~20_combout\ : std_logic;
SIGNAL \countDec|Add1~21\ : std_logic;
SIGNAL \countDec|Add1~22_combout\ : std_logic;
SIGNAL \countDec|Add1~23\ : std_logic;
SIGNAL \countDec|Add1~24_combout\ : std_logic;
SIGNAL \countDec|Add1~25\ : std_logic;
SIGNAL \countDec|Add1~26_combout\ : std_logic;
SIGNAL \countDec|Add1~27\ : std_logic;
SIGNAL \countDec|Add1~28_combout\ : std_logic;
SIGNAL \countDec|Add1~29\ : std_logic;
SIGNAL \countDec|Add1~30_combout\ : std_logic;
SIGNAL \countDec|Equal2~5_combout\ : std_logic;
SIGNAL \countDec|Equal2~6_combout\ : std_logic;
SIGNAL \countDec|Equal2~7_combout\ : std_logic;
SIGNAL \countDec|Equal2~8_combout\ : std_logic;
SIGNAL \countDec|Equal10~0_combout\ : std_logic;
SIGNAL \countDec|Add1~31\ : std_logic;
SIGNAL \countDec|Add1~32_combout\ : std_logic;
SIGNAL \countDec|Add1~33\ : std_logic;
SIGNAL \countDec|Add1~34_combout\ : std_logic;
SIGNAL \countDec|Add1~35\ : std_logic;
SIGNAL \countDec|Add1~36_combout\ : std_logic;
SIGNAL \countDec|Add1~37\ : std_logic;
SIGNAL \countDec|Add1~38_combout\ : std_logic;
SIGNAL \countDec|Equal2~3_combout\ : std_logic;
SIGNAL \countDec|Add1~39\ : std_logic;
SIGNAL \countDec|Add1~40_combout\ : std_logic;
SIGNAL \countDec|Add1~41\ : std_logic;
SIGNAL \countDec|Add1~42_combout\ : std_logic;
SIGNAL \countDec|Add1~43\ : std_logic;
SIGNAL \countDec|Add1~44_combout\ : std_logic;
SIGNAL \countDec|Add1~45\ : std_logic;
SIGNAL \countDec|Add1~46_combout\ : std_logic;
SIGNAL \countDec|Equal2~2_combout\ : std_logic;
SIGNAL \countDec|Add1~47\ : std_logic;
SIGNAL \countDec|Add1~48_combout\ : std_logic;
SIGNAL \countDec|Add1~49\ : std_logic;
SIGNAL \countDec|Add1~50_combout\ : std_logic;
SIGNAL \countDec|Add1~51\ : std_logic;
SIGNAL \countDec|Add1~52_combout\ : std_logic;
SIGNAL \countDec|Add1~53\ : std_logic;
SIGNAL \countDec|Add1~54_combout\ : std_logic;
SIGNAL \countDec|Equal2~1_combout\ : std_logic;
SIGNAL \countDec|Add1~55\ : std_logic;
SIGNAL \countDec|Add1~56_combout\ : std_logic;
SIGNAL \countDec|Add1~57\ : std_logic;
SIGNAL \countDec|Add1~58_combout\ : std_logic;
SIGNAL \countDec|Add1~59\ : std_logic;
SIGNAL \countDec|Add1~60_combout\ : std_logic;
SIGNAL \countDec|Add1~61\ : std_logic;
SIGNAL \countDec|Add1~62_combout\ : std_logic;
SIGNAL \countDec|Equal2~0_combout\ : std_logic;
SIGNAL \countDec|Equal2~4_combout\ : std_logic;
SIGNAL \countDec|Equal10~1_combout\ : std_logic;
SIGNAL \countDec|WideNor0~9_combout\ : std_logic;
SIGNAL \countDec|WideNor0~9clkctrl_outclk\ : std_logic;
SIGNAL \countDec|b3_cod~combout\ : std_logic;
SIGNAL \countDec|Equal2~9_combout\ : std_logic;
SIGNAL \countDec|WideNor0~8_combout\ : std_logic;
SIGNAL \countDec|b0_cod~combout\ : std_logic;
SIGNAL \countDec|WideOr5~2_combout\ : std_logic;
SIGNAL \countDec|b2_cod~combout\ : std_logic;
SIGNAL \countDec|WideOr3~2_combout\ : std_logic;
SIGNAL \countDec|b1_cod~combout\ : std_logic;
SIGNAL \comb~8_combout\ : std_logic;
SIGNAL \comb~9_combout\ : std_logic;
SIGNAL \a_seg$latch~combout\ : std_logic;
SIGNAL \comb~18_combout\ : std_logic;
SIGNAL \comb~17_combout\ : std_logic;
SIGNAL \b_seg$latch~combout\ : std_logic;
SIGNAL \c_seg~0_combout\ : std_logic;
SIGNAL \comb~10_combout\ : std_logic;
SIGNAL \c_seg$latch~combout\ : std_logic;
SIGNAL \comb~19_combout\ : std_logic;
SIGNAL \comb~20_combout\ : std_logic;
SIGNAL \d_seg$latch~combout\ : std_logic;
SIGNAL \comb~12_combout\ : std_logic;
SIGNAL \comb~11_combout\ : std_logic;
SIGNAL \e_seg$latch~combout\ : std_logic;
SIGNAL \comb~14_combout\ : std_logic;
SIGNAL \comb~13_combout\ : std_logic;
SIGNAL \f_seg$latch~combout\ : std_logic;
SIGNAL \comb~16_combout\ : std_logic;
SIGNAL \comb~15_combout\ : std_logic;
SIGNAL \g_seg$latch~combout\ : std_logic;
SIGNAL \countDec|countBcd\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \countDec|countClk\ : std_logic_vector(31 DOWNTO 0);

BEGIN

ww_rst <= rst;
ww_clk <= clk;
ww_en <= en;
a_seg <= ww_a_seg;
b_seg <= ww_b_seg;
c_seg <= ww_c_seg;
d_seg <= ww_d_seg;
e_seg <= ww_e_seg;
f_seg <= ww_f_seg;
g_seg <= ww_g_seg;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

\countDec|WideNor0~9clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \countDec|WideNor0~9_combout\);

-- Location: IOOBUF_X115_Y41_N2
\a_seg~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \a_seg$latch~combout\,
	devoe => ww_devoe,
	o => \a_seg~output_o\);

-- Location: IOOBUF_X115_Y30_N9
\b_seg~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \b_seg$latch~combout\,
	devoe => ww_devoe,
	o => \b_seg~output_o\);

-- Location: IOOBUF_X115_Y25_N23
\c_seg~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \c_seg$latch~combout\,
	devoe => ww_devoe,
	o => \c_seg~output_o\);

-- Location: IOOBUF_X115_Y30_N2
\d_seg~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d_seg$latch~combout\,
	devoe => ww_devoe,
	o => \d_seg~output_o\);

-- Location: IOOBUF_X115_Y20_N9
\e_seg~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \e_seg$latch~combout\,
	devoe => ww_devoe,
	o => \e_seg~output_o\);

-- Location: IOOBUF_X115_Y22_N2
\f_seg~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \f_seg$latch~combout\,
	devoe => ww_devoe,
	o => \f_seg~output_o\);

-- Location: IOOBUF_X115_Y28_N9
\g_seg~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \g_seg$latch~combout\,
	devoe => ww_devoe,
	o => \g_seg~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X111_Y20_N0
\countDec|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~0_combout\ = \countDec|countBcd\(0) $ (VCC)
-- \countDec|Add1~1\ = CARRY(\countDec|countBcd\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(0),
	datad => VCC,
	combout => \countDec|Add1~0_combout\,
	cout => \countDec|Add1~1\);

-- Location: IOIBUF_X115_Y40_N8
\rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: IOIBUF_X115_Y17_N1
\en~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_en,
	o => \en~input_o\);

-- Location: LCCOMB_X109_Y21_N0
\countDec|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~0_combout\ = \countDec|countClk\(0) $ (VCC)
-- \countDec|Add0~1\ = CARRY(\countDec|countClk\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countClk\(0),
	datad => VCC,
	combout => \countDec|Add0~0_combout\,
	cout => \countDec|Add0~1\);

-- Location: LCCOMB_X110_Y21_N4
\countDec|countClk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|countClk~0_combout\ = (\countDec|Add0~0_combout\ & !\countDec|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|Add0~0_combout\,
	datac => \countDec|Equal0~10_combout\,
	combout => \countDec|countClk~0_combout\);

-- Location: FF_X110_Y21_N5
\countDec|countClk[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|countClk~0_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(0));

-- Location: LCCOMB_X109_Y21_N2
\countDec|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~2_combout\ = (\countDec|countClk\(1) & (!\countDec|Add0~1\)) # (!\countDec|countClk\(1) & ((\countDec|Add0~1\) # (GND)))
-- \countDec|Add0~3\ = CARRY((!\countDec|Add0~1\) # (!\countDec|countClk\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(1),
	datad => VCC,
	cin => \countDec|Add0~1\,
	combout => \countDec|Add0~2_combout\,
	cout => \countDec|Add0~3\);

-- Location: FF_X109_Y21_N3
\countDec|countClk[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add0~2_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(1));

-- Location: LCCOMB_X109_Y21_N4
\countDec|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~4_combout\ = (\countDec|countClk\(2) & (\countDec|Add0~3\ $ (GND))) # (!\countDec|countClk\(2) & (!\countDec|Add0~3\ & VCC))
-- \countDec|Add0~5\ = CARRY((\countDec|countClk\(2) & !\countDec|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(2),
	datad => VCC,
	cin => \countDec|Add0~3\,
	combout => \countDec|Add0~4_combout\,
	cout => \countDec|Add0~5\);

-- Location: FF_X109_Y21_N5
\countDec|countClk[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add0~4_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(2));

-- Location: LCCOMB_X109_Y21_N6
\countDec|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~6_combout\ = (\countDec|countClk\(3) & (!\countDec|Add0~5\)) # (!\countDec|countClk\(3) & ((\countDec|Add0~5\) # (GND)))
-- \countDec|Add0~7\ = CARRY((!\countDec|Add0~5\) # (!\countDec|countClk\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countClk\(3),
	datad => VCC,
	cin => \countDec|Add0~5\,
	combout => \countDec|Add0~6_combout\,
	cout => \countDec|Add0~7\);

-- Location: FF_X109_Y21_N7
\countDec|countClk[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add0~6_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(3));

-- Location: LCCOMB_X109_Y21_N8
\countDec|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~8_combout\ = (\countDec|countClk\(4) & (\countDec|Add0~7\ $ (GND))) # (!\countDec|countClk\(4) & (!\countDec|Add0~7\ & VCC))
-- \countDec|Add0~9\ = CARRY((\countDec|countClk\(4) & !\countDec|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(4),
	datad => VCC,
	cin => \countDec|Add0~7\,
	combout => \countDec|Add0~8_combout\,
	cout => \countDec|Add0~9\);

-- Location: FF_X109_Y21_N9
\countDec|countClk[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add0~8_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(4));

-- Location: LCCOMB_X110_Y21_N30
\countDec|Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal0~9_combout\ = (!\countDec|countClk\(1) & (!\countDec|countClk\(3) & (!\countDec|countClk\(2) & !\countDec|countClk\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countClk\(1),
	datab => \countDec|countClk\(3),
	datac => \countDec|countClk\(2),
	datad => \countDec|countClk\(4),
	combout => \countDec|Equal0~9_combout\);

-- Location: LCCOMB_X109_Y21_N10
\countDec|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~10_combout\ = (\countDec|countClk\(5) & (!\countDec|Add0~9\)) # (!\countDec|countClk\(5) & ((\countDec|Add0~9\) # (GND)))
-- \countDec|Add0~11\ = CARRY((!\countDec|Add0~9\) # (!\countDec|countClk\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countClk\(5),
	datad => VCC,
	cin => \countDec|Add0~9\,
	combout => \countDec|Add0~10_combout\,
	cout => \countDec|Add0~11\);

-- Location: FF_X109_Y21_N11
\countDec|countClk[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add0~10_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(5));

-- Location: LCCOMB_X109_Y21_N12
\countDec|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~12_combout\ = (\countDec|countClk\(6) & (\countDec|Add0~11\ $ (GND))) # (!\countDec|countClk\(6) & (!\countDec|Add0~11\ & VCC))
-- \countDec|Add0~13\ = CARRY((\countDec|countClk\(6) & !\countDec|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countClk\(6),
	datad => VCC,
	cin => \countDec|Add0~11\,
	combout => \countDec|Add0~12_combout\,
	cout => \countDec|Add0~13\);

-- Location: FF_X109_Y21_N13
\countDec|countClk[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add0~12_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(6));

-- Location: LCCOMB_X109_Y21_N14
\countDec|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~14_combout\ = (\countDec|countClk\(7) & (!\countDec|Add0~13\)) # (!\countDec|countClk\(7) & ((\countDec|Add0~13\) # (GND)))
-- \countDec|Add0~15\ = CARRY((!\countDec|Add0~13\) # (!\countDec|countClk\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(7),
	datad => VCC,
	cin => \countDec|Add0~13\,
	combout => \countDec|Add0~14_combout\,
	cout => \countDec|Add0~15\);

-- Location: LCCOMB_X110_Y20_N14
\countDec|countClk~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|countClk~12_combout\ = (!\countDec|Equal0~10_combout\ & \countDec|Add0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|Equal0~10_combout\,
	datad => \countDec|Add0~14_combout\,
	combout => \countDec|countClk~12_combout\);

-- Location: FF_X110_Y20_N15
\countDec|countClk[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|countClk~12_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(7));

-- Location: LCCOMB_X109_Y21_N16
\countDec|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~16_combout\ = (\countDec|countClk\(8) & (\countDec|Add0~15\ $ (GND))) # (!\countDec|countClk\(8) & (!\countDec|Add0~15\ & VCC))
-- \countDec|Add0~17\ = CARRY((\countDec|countClk\(8) & !\countDec|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(8),
	datad => VCC,
	cin => \countDec|Add0~15\,
	combout => \countDec|Add0~16_combout\,
	cout => \countDec|Add0~17\);

-- Location: FF_X109_Y21_N17
\countDec|countClk[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add0~16_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(8));

-- Location: LCCOMB_X110_Y20_N4
\countDec|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal0~8_combout\ = (!\countDec|countClk\(6) & (\countDec|countClk\(7) & (!\countDec|countClk\(8) & !\countDec|countClk\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countClk\(6),
	datab => \countDec|countClk\(7),
	datac => \countDec|countClk\(8),
	datad => \countDec|countClk\(5),
	combout => \countDec|Equal0~8_combout\);

-- Location: LCCOMB_X109_Y21_N18
\countDec|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~18_combout\ = (\countDec|countClk\(9) & (!\countDec|Add0~17\)) # (!\countDec|countClk\(9) & ((\countDec|Add0~17\) # (GND)))
-- \countDec|Add0~19\ = CARRY((!\countDec|Add0~17\) # (!\countDec|countClk\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(9),
	datad => VCC,
	cin => \countDec|Add0~17\,
	combout => \countDec|Add0~18_combout\,
	cout => \countDec|Add0~19\);

-- Location: FF_X109_Y21_N19
\countDec|countClk[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add0~18_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(9));

-- Location: LCCOMB_X109_Y21_N20
\countDec|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~20_combout\ = (\countDec|countClk\(10) & (\countDec|Add0~19\ $ (GND))) # (!\countDec|countClk\(10) & (!\countDec|Add0~19\ & VCC))
-- \countDec|Add0~21\ = CARRY((\countDec|countClk\(10) & !\countDec|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(10),
	datad => VCC,
	cin => \countDec|Add0~19\,
	combout => \countDec|Add0~20_combout\,
	cout => \countDec|Add0~21\);

-- Location: FF_X109_Y21_N21
\countDec|countClk[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add0~20_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(10));

-- Location: LCCOMB_X109_Y21_N22
\countDec|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~22_combout\ = (\countDec|countClk\(11) & (!\countDec|Add0~21\)) # (!\countDec|countClk\(11) & ((\countDec|Add0~21\) # (GND)))
-- \countDec|Add0~23\ = CARRY((!\countDec|Add0~21\) # (!\countDec|countClk\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countClk\(11),
	datad => VCC,
	cin => \countDec|Add0~21\,
	combout => \countDec|Add0~22_combout\,
	cout => \countDec|Add0~23\);

-- Location: FF_X109_Y21_N23
\countDec|countClk[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add0~22_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(11));

-- Location: LCCOMB_X109_Y21_N24
\countDec|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~24_combout\ = (\countDec|countClk\(12) & (\countDec|Add0~23\ $ (GND))) # (!\countDec|countClk\(12) & (!\countDec|Add0~23\ & VCC))
-- \countDec|Add0~25\ = CARRY((\countDec|countClk\(12) & !\countDec|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(12),
	datad => VCC,
	cin => \countDec|Add0~23\,
	combout => \countDec|Add0~24_combout\,
	cout => \countDec|Add0~25\);

-- Location: LCCOMB_X110_Y21_N10
\countDec|countClk~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|countClk~11_combout\ = (!\countDec|Equal0~10_combout\ & \countDec|Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \countDec|Equal0~10_combout\,
	datad => \countDec|Add0~24_combout\,
	combout => \countDec|countClk~11_combout\);

-- Location: FF_X110_Y21_N11
\countDec|countClk[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|countClk~11_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(12));

-- Location: LCCOMB_X109_Y21_N26
\countDec|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~26_combout\ = (\countDec|countClk\(13) & (!\countDec|Add0~25\)) # (!\countDec|countClk\(13) & ((\countDec|Add0~25\) # (GND)))
-- \countDec|Add0~27\ = CARRY((!\countDec|Add0~25\) # (!\countDec|countClk\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(13),
	datad => VCC,
	cin => \countDec|Add0~25\,
	combout => \countDec|Add0~26_combout\,
	cout => \countDec|Add0~27\);

-- Location: LCCOMB_X110_Y20_N0
\countDec|countClk~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|countClk~10_combout\ = (\countDec|Add0~26_combout\ & !\countDec|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \countDec|Add0~26_combout\,
	datad => \countDec|Equal0~10_combout\,
	combout => \countDec|countClk~10_combout\);

-- Location: FF_X110_Y20_N1
\countDec|countClk[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|countClk~10_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(13));

-- Location: LCCOMB_X109_Y21_N28
\countDec|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~28_combout\ = (\countDec|countClk\(14) & (\countDec|Add0~27\ $ (GND))) # (!\countDec|countClk\(14) & (!\countDec|Add0~27\ & VCC))
-- \countDec|Add0~29\ = CARRY((\countDec|countClk\(14) & !\countDec|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(14),
	datad => VCC,
	cin => \countDec|Add0~27\,
	combout => \countDec|Add0~28_combout\,
	cout => \countDec|Add0~29\);

-- Location: LCCOMB_X110_Y21_N16
\countDec|countClk~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|countClk~9_combout\ = (!\countDec|Equal0~10_combout\ & \countDec|Add0~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \countDec|Equal0~10_combout\,
	datad => \countDec|Add0~28_combout\,
	combout => \countDec|countClk~9_combout\);

-- Location: FF_X110_Y21_N17
\countDec|countClk[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|countClk~9_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(14));

-- Location: LCCOMB_X109_Y21_N30
\countDec|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~30_combout\ = (\countDec|countClk\(15) & (!\countDec|Add0~29\)) # (!\countDec|countClk\(15) & ((\countDec|Add0~29\) # (GND)))
-- \countDec|Add0~31\ = CARRY((!\countDec|Add0~29\) # (!\countDec|countClk\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(15),
	datad => VCC,
	cin => \countDec|Add0~29\,
	combout => \countDec|Add0~30_combout\,
	cout => \countDec|Add0~31\);

-- Location: LCCOMB_X110_Y21_N22
\countDec|countClk~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|countClk~8_combout\ = (!\countDec|Equal0~10_combout\ & \countDec|Add0~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \countDec|Equal0~10_combout\,
	datad => \countDec|Add0~30_combout\,
	combout => \countDec|countClk~8_combout\);

-- Location: FF_X110_Y21_N23
\countDec|countClk[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|countClk~8_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(15));

-- Location: LCCOMB_X109_Y20_N0
\countDec|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~32_combout\ = (\countDec|countClk\(16) & (\countDec|Add0~31\ $ (GND))) # (!\countDec|countClk\(16) & (!\countDec|Add0~31\ & VCC))
-- \countDec|Add0~33\ = CARRY((\countDec|countClk\(16) & !\countDec|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(16),
	datad => VCC,
	cin => \countDec|Add0~31\,
	combout => \countDec|Add0~32_combout\,
	cout => \countDec|Add0~33\);

-- Location: FF_X109_Y20_N1
\countDec|countClk[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add0~32_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(16));

-- Location: LCCOMB_X109_Y20_N2
\countDec|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~34_combout\ = (\countDec|countClk\(17) & (!\countDec|Add0~33\)) # (!\countDec|countClk\(17) & ((\countDec|Add0~33\) # (GND)))
-- \countDec|Add0~35\ = CARRY((!\countDec|Add0~33\) # (!\countDec|countClk\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(17),
	datad => VCC,
	cin => \countDec|Add0~33\,
	combout => \countDec|Add0~34_combout\,
	cout => \countDec|Add0~35\);

-- Location: LCCOMB_X108_Y20_N28
\countDec|countClk~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|countClk~7_combout\ = (!\countDec|Equal0~10_combout\ & \countDec|Add0~34_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \countDec|Equal0~10_combout\,
	datad => \countDec|Add0~34_combout\,
	combout => \countDec|countClk~7_combout\);

-- Location: FF_X108_Y20_N29
\countDec|countClk[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|countClk~7_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(17));

-- Location: LCCOMB_X109_Y20_N4
\countDec|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~36_combout\ = (\countDec|countClk\(18) & (\countDec|Add0~35\ $ (GND))) # (!\countDec|countClk\(18) & (!\countDec|Add0~35\ & VCC))
-- \countDec|Add0~37\ = CARRY((\countDec|countClk\(18) & !\countDec|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(18),
	datad => VCC,
	cin => \countDec|Add0~35\,
	combout => \countDec|Add0~36_combout\,
	cout => \countDec|Add0~37\);

-- Location: FF_X109_Y20_N5
\countDec|countClk[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add0~36_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(18));

-- Location: LCCOMB_X109_Y20_N6
\countDec|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~38_combout\ = (\countDec|countClk\(19) & (!\countDec|Add0~37\)) # (!\countDec|countClk\(19) & ((\countDec|Add0~37\) # (GND)))
-- \countDec|Add0~39\ = CARRY((!\countDec|Add0~37\) # (!\countDec|countClk\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(19),
	datad => VCC,
	cin => \countDec|Add0~37\,
	combout => \countDec|Add0~38_combout\,
	cout => \countDec|Add0~39\);

-- Location: LCCOMB_X108_Y20_N22
\countDec|countClk~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|countClk~6_combout\ = (!\countDec|Equal0~10_combout\ & \countDec|Add0~38_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \countDec|Equal0~10_combout\,
	datad => \countDec|Add0~38_combout\,
	combout => \countDec|countClk~6_combout\);

-- Location: FF_X108_Y20_N23
\countDec|countClk[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|countClk~6_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(19));

-- Location: LCCOMB_X109_Y20_N8
\countDec|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~40_combout\ = (\countDec|countClk\(20) & (\countDec|Add0~39\ $ (GND))) # (!\countDec|countClk\(20) & (!\countDec|Add0~39\ & VCC))
-- \countDec|Add0~41\ = CARRY((\countDec|countClk\(20) & !\countDec|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(20),
	datad => VCC,
	cin => \countDec|Add0~39\,
	combout => \countDec|Add0~40_combout\,
	cout => \countDec|Add0~41\);

-- Location: LCCOMB_X108_Y20_N4
\countDec|countClk~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|countClk~5_combout\ = (\countDec|Add0~40_combout\ & !\countDec|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \countDec|Add0~40_combout\,
	datad => \countDec|Equal0~10_combout\,
	combout => \countDec|countClk~5_combout\);

-- Location: FF_X108_Y20_N5
\countDec|countClk[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|countClk~5_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(20));

-- Location: LCCOMB_X109_Y20_N10
\countDec|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~42_combout\ = (\countDec|countClk\(21) & (!\countDec|Add0~41\)) # (!\countDec|countClk\(21) & ((\countDec|Add0~41\) # (GND)))
-- \countDec|Add0~43\ = CARRY((!\countDec|Add0~41\) # (!\countDec|countClk\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countClk\(21),
	datad => VCC,
	cin => \countDec|Add0~41\,
	combout => \countDec|Add0~42_combout\,
	cout => \countDec|Add0~43\);

-- Location: LCCOMB_X110_Y20_N2
\countDec|countClk~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|countClk~4_combout\ = (!\countDec|Equal0~10_combout\ & \countDec|Add0~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|Equal0~10_combout\,
	datad => \countDec|Add0~42_combout\,
	combout => \countDec|countClk~4_combout\);

-- Location: FF_X110_Y20_N3
\countDec|countClk[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|countClk~4_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(21));

-- Location: LCCOMB_X109_Y20_N12
\countDec|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~44_combout\ = (\countDec|countClk\(22) & (\countDec|Add0~43\ $ (GND))) # (!\countDec|countClk\(22) & (!\countDec|Add0~43\ & VCC))
-- \countDec|Add0~45\ = CARRY((\countDec|countClk\(22) & !\countDec|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(22),
	datad => VCC,
	cin => \countDec|Add0~43\,
	combout => \countDec|Add0~44_combout\,
	cout => \countDec|Add0~45\);

-- Location: LCCOMB_X110_Y20_N8
\countDec|countClk~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|countClk~3_combout\ = (!\countDec|Equal0~10_combout\ & \countDec|Add0~44_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|Equal0~10_combout\,
	datad => \countDec|Add0~44_combout\,
	combout => \countDec|countClk~3_combout\);

-- Location: FF_X110_Y20_N9
\countDec|countClk[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|countClk~3_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(22));

-- Location: LCCOMB_X109_Y20_N14
\countDec|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~46_combout\ = (\countDec|countClk\(23) & (!\countDec|Add0~45\)) # (!\countDec|countClk\(23) & ((\countDec|Add0~45\) # (GND)))
-- \countDec|Add0~47\ = CARRY((!\countDec|Add0~45\) # (!\countDec|countClk\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(23),
	datad => VCC,
	cin => \countDec|Add0~45\,
	combout => \countDec|Add0~46_combout\,
	cout => \countDec|Add0~47\);

-- Location: LCCOMB_X110_Y20_N10
\countDec|countClk~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|countClk~2_combout\ = (!\countDec|Equal0~10_combout\ & \countDec|Add0~46_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|Equal0~10_combout\,
	datad => \countDec|Add0~46_combout\,
	combout => \countDec|countClk~2_combout\);

-- Location: FF_X110_Y20_N11
\countDec|countClk[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|countClk~2_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(23));

-- Location: LCCOMB_X109_Y20_N16
\countDec|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~48_combout\ = (\countDec|countClk\(24) & (\countDec|Add0~47\ $ (GND))) # (!\countDec|countClk\(24) & (!\countDec|Add0~47\ & VCC))
-- \countDec|Add0~49\ = CARRY((\countDec|countClk\(24) & !\countDec|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(24),
	datad => VCC,
	cin => \countDec|Add0~47\,
	combout => \countDec|Add0~48_combout\,
	cout => \countDec|Add0~49\);

-- Location: FF_X109_Y20_N17
\countDec|countClk[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add0~48_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(24));

-- Location: LCCOMB_X110_Y20_N12
\countDec|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal0~2_combout\ = (\countDec|countClk\(23) & (\countDec|countClk\(22) & (!\countDec|countClk\(24) & \countDec|countClk\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countClk\(23),
	datab => \countDec|countClk\(22),
	datac => \countDec|countClk\(24),
	datad => \countDec|countClk\(21),
	combout => \countDec|Equal0~2_combout\);

-- Location: LCCOMB_X109_Y20_N18
\countDec|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~50_combout\ = (\countDec|countClk\(25) & (!\countDec|Add0~49\)) # (!\countDec|countClk\(25) & ((\countDec|Add0~49\) # (GND)))
-- \countDec|Add0~51\ = CARRY((!\countDec|Add0~49\) # (!\countDec|countClk\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(25),
	datad => VCC,
	cin => \countDec|Add0~49\,
	combout => \countDec|Add0~50_combout\,
	cout => \countDec|Add0~51\);

-- Location: LCCOMB_X110_Y20_N22
\countDec|countClk~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|countClk~1_combout\ = (!\countDec|Equal0~10_combout\ & \countDec|Add0~50_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|Equal0~10_combout\,
	datad => \countDec|Add0~50_combout\,
	combout => \countDec|countClk~1_combout\);

-- Location: FF_X110_Y20_N23
\countDec|countClk[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|countClk~1_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(25));

-- Location: LCCOMB_X109_Y20_N20
\countDec|Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~52_combout\ = (\countDec|countClk\(26) & (\countDec|Add0~51\ $ (GND))) # (!\countDec|countClk\(26) & (!\countDec|Add0~51\ & VCC))
-- \countDec|Add0~53\ = CARRY((\countDec|countClk\(26) & !\countDec|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(26),
	datad => VCC,
	cin => \countDec|Add0~51\,
	combout => \countDec|Add0~52_combout\,
	cout => \countDec|Add0~53\);

-- Location: FF_X109_Y20_N21
\countDec|countClk[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add0~52_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(26));

-- Location: LCCOMB_X109_Y20_N22
\countDec|Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~54_combout\ = (\countDec|countClk\(27) & (!\countDec|Add0~53\)) # (!\countDec|countClk\(27) & ((\countDec|Add0~53\) # (GND)))
-- \countDec|Add0~55\ = CARRY((!\countDec|Add0~53\) # (!\countDec|countClk\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countClk\(27),
	datad => VCC,
	cin => \countDec|Add0~53\,
	combout => \countDec|Add0~54_combout\,
	cout => \countDec|Add0~55\);

-- Location: FF_X109_Y20_N23
\countDec|countClk[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add0~54_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(27));

-- Location: LCCOMB_X109_Y20_N24
\countDec|Add0~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~56_combout\ = (\countDec|countClk\(28) & (\countDec|Add0~55\ $ (GND))) # (!\countDec|countClk\(28) & (!\countDec|Add0~55\ & VCC))
-- \countDec|Add0~57\ = CARRY((\countDec|countClk\(28) & !\countDec|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(28),
	datad => VCC,
	cin => \countDec|Add0~55\,
	combout => \countDec|Add0~56_combout\,
	cout => \countDec|Add0~57\);

-- Location: FF_X109_Y20_N25
\countDec|countClk[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add0~56_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(28));

-- Location: LCCOMB_X110_Y20_N28
\countDec|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal0~1_combout\ = (\countDec|countClk\(25) & (!\countDec|countClk\(27) & (!\countDec|countClk\(28) & !\countDec|countClk\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countClk\(25),
	datab => \countDec|countClk\(27),
	datac => \countDec|countClk\(28),
	datad => \countDec|countClk\(26),
	combout => \countDec|Equal0~1_combout\);

-- Location: LCCOMB_X108_Y20_N14
\countDec|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal0~3_combout\ = (\countDec|countClk\(19) & (\countDec|countClk\(17) & (\countDec|countClk\(20) & !\countDec|countClk\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countClk\(19),
	datab => \countDec|countClk\(17),
	datac => \countDec|countClk\(20),
	datad => \countDec|countClk\(18),
	combout => \countDec|Equal0~3_combout\);

-- Location: LCCOMB_X109_Y20_N26
\countDec|Add0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~58_combout\ = (\countDec|countClk\(29) & (!\countDec|Add0~57\)) # (!\countDec|countClk\(29) & ((\countDec|Add0~57\) # (GND)))
-- \countDec|Add0~59\ = CARRY((!\countDec|Add0~57\) # (!\countDec|countClk\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countClk\(29),
	datad => VCC,
	cin => \countDec|Add0~57\,
	combout => \countDec|Add0~58_combout\,
	cout => \countDec|Add0~59\);

-- Location: FF_X109_Y20_N27
\countDec|countClk[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add0~58_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(29));

-- Location: LCCOMB_X109_Y20_N28
\countDec|Add0~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~60_combout\ = (\countDec|countClk\(30) & (\countDec|Add0~59\ $ (GND))) # (!\countDec|countClk\(30) & (!\countDec|Add0~59\ & VCC))
-- \countDec|Add0~61\ = CARRY((\countDec|countClk\(30) & !\countDec|Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(30),
	datad => VCC,
	cin => \countDec|Add0~59\,
	combout => \countDec|Add0~60_combout\,
	cout => \countDec|Add0~61\);

-- Location: FF_X109_Y20_N29
\countDec|countClk[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add0~60_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(30));

-- Location: LCCOMB_X109_Y20_N30
\countDec|Add0~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add0~62_combout\ = \countDec|countClk\(31) $ (\countDec|Add0~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countClk\(31),
	cin => \countDec|Add0~61\,
	combout => \countDec|Add0~62_combout\);

-- Location: FF_X109_Y20_N31
\countDec|countClk[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add0~62_combout\,
	clrn => \rst~input_o\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countClk\(31));

-- Location: LCCOMB_X110_Y20_N24
\countDec|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal0~0_combout\ = (!\countDec|countClk\(29) & (!\countDec|countClk\(31) & (!\countDec|countClk\(0) & !\countDec|countClk\(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countClk\(29),
	datab => \countDec|countClk\(31),
	datac => \countDec|countClk\(0),
	datad => \countDec|countClk\(30),
	combout => \countDec|Equal0~0_combout\);

-- Location: LCCOMB_X110_Y20_N30
\countDec|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal0~4_combout\ = (\countDec|Equal0~2_combout\ & (\countDec|Equal0~1_combout\ & (\countDec|Equal0~3_combout\ & \countDec|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|Equal0~2_combout\,
	datab => \countDec|Equal0~1_combout\,
	datac => \countDec|Equal0~3_combout\,
	datad => \countDec|Equal0~0_combout\,
	combout => \countDec|Equal0~4_combout\);

-- Location: LCCOMB_X110_Y20_N26
\countDec|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal0~5_combout\ = (\countDec|countClk\(14) & (\countDec|countClk\(13) & (!\countDec|countClk\(16) & \countDec|countClk\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countClk\(14),
	datab => \countDec|countClk\(13),
	datac => \countDec|countClk\(16),
	datad => \countDec|countClk\(15),
	combout => \countDec|Equal0~5_combout\);

-- Location: LCCOMB_X110_Y21_N28
\countDec|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal0~6_combout\ = (!\countDec|countClk\(9) & !\countDec|countClk\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countClk\(9),
	datad => \countDec|countClk\(10),
	combout => \countDec|Equal0~6_combout\);

-- Location: LCCOMB_X110_Y20_N20
\countDec|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal0~7_combout\ = (\countDec|countClk\(12) & (!\countDec|countClk\(11) & (\countDec|Equal0~5_combout\ & \countDec|Equal0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countClk\(12),
	datab => \countDec|countClk\(11),
	datac => \countDec|Equal0~5_combout\,
	datad => \countDec|Equal0~6_combout\,
	combout => \countDec|Equal0~7_combout\);

-- Location: LCCOMB_X110_Y20_N6
\countDec|Equal0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal0~10_combout\ = (\countDec|Equal0~9_combout\ & (\countDec|Equal0~8_combout\ & (\countDec|Equal0~4_combout\ & \countDec|Equal0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|Equal0~9_combout\,
	datab => \countDec|Equal0~8_combout\,
	datac => \countDec|Equal0~4_combout\,
	datad => \countDec|Equal0~7_combout\,
	combout => \countDec|Equal0~10_combout\);

-- Location: LCCOMB_X110_Y20_N16
\countDec|countBcd[31]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|countBcd[31]~0_combout\ = (\en~input_o\ & \countDec|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \en~input_o\,
	datad => \countDec|Equal0~10_combout\,
	combout => \countDec|countBcd[31]~0_combout\);

-- Location: FF_X111_Y20_N1
\countDec|countBcd[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add1~0_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(0));

-- Location: LCCOMB_X111_Y20_N2
\countDec|Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~2_combout\ = (\countDec|countBcd\(1) & (!\countDec|Add1~1\)) # (!\countDec|countBcd\(1) & ((\countDec|Add1~1\) # (GND)))
-- \countDec|Add1~3\ = CARRY((!\countDec|Add1~1\) # (!\countDec|countBcd\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(1),
	datad => VCC,
	cin => \countDec|Add1~1\,
	combout => \countDec|Add1~2_combout\,
	cout => \countDec|Add1~3\);

-- Location: LCCOMB_X112_Y20_N6
\countDec|countBcd~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|countBcd~2_combout\ = (\countDec|Add1~2_combout\ & ((!\countDec|Equal10~1_combout\) # (!\countDec|countBcd\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(0),
	datab => \countDec|Equal10~1_combout\,
	datad => \countDec|Add1~2_combout\,
	combout => \countDec|countBcd~2_combout\);

-- Location: FF_X112_Y20_N7
\countDec|countBcd[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|countBcd~2_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(1));

-- Location: LCCOMB_X111_Y20_N4
\countDec|Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~4_combout\ = (\countDec|countBcd\(2) & (\countDec|Add1~3\ $ (GND))) # (!\countDec|countBcd\(2) & (!\countDec|Add1~3\ & VCC))
-- \countDec|Add1~5\ = CARRY((\countDec|countBcd\(2) & !\countDec|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(2),
	datad => VCC,
	cin => \countDec|Add1~3\,
	combout => \countDec|Add1~4_combout\,
	cout => \countDec|Add1~5\);

-- Location: FF_X111_Y20_N5
\countDec|countBcd[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~4_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(2));

-- Location: LCCOMB_X111_Y20_N6
\countDec|Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~6_combout\ = (\countDec|countBcd\(3) & (!\countDec|Add1~5\)) # (!\countDec|countBcd\(3) & ((\countDec|Add1~5\) # (GND)))
-- \countDec|Add1~7\ = CARRY((!\countDec|Add1~5\) # (!\countDec|countBcd\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(3),
	datad => VCC,
	cin => \countDec|Add1~5\,
	combout => \countDec|Add1~6_combout\,
	cout => \countDec|Add1~7\);

-- Location: LCCOMB_X112_Y20_N22
\countDec|countBcd~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|countBcd~1_combout\ = (\countDec|Add1~6_combout\ & ((!\countDec|Equal10~1_combout\) # (!\countDec|countBcd\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(0),
	datab => \countDec|Equal10~1_combout\,
	datad => \countDec|Add1~6_combout\,
	combout => \countDec|countBcd~1_combout\);

-- Location: FF_X112_Y20_N23
\countDec|countBcd[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|countBcd~1_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(3));

-- Location: LCCOMB_X111_Y20_N8
\countDec|Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~8_combout\ = (\countDec|countBcd\(4) & (\countDec|Add1~7\ $ (GND))) # (!\countDec|countBcd\(4) & (!\countDec|Add1~7\ & VCC))
-- \countDec|Add1~9\ = CARRY((\countDec|countBcd\(4) & !\countDec|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(4),
	datad => VCC,
	cin => \countDec|Add1~7\,
	combout => \countDec|Add1~8_combout\,
	cout => \countDec|Add1~9\);

-- Location: FF_X111_Y20_N9
\countDec|countBcd[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~8_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(4));

-- Location: LCCOMB_X111_Y20_N10
\countDec|Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~10_combout\ = (\countDec|countBcd\(5) & (!\countDec|Add1~9\)) # (!\countDec|countBcd\(5) & ((\countDec|Add1~9\) # (GND)))
-- \countDec|Add1~11\ = CARRY((!\countDec|Add1~9\) # (!\countDec|countBcd\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(5),
	datad => VCC,
	cin => \countDec|Add1~9\,
	combout => \countDec|Add1~10_combout\,
	cout => \countDec|Add1~11\);

-- Location: FF_X111_Y20_N11
\countDec|countBcd[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~10_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(5));

-- Location: LCCOMB_X111_Y20_N12
\countDec|Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~12_combout\ = (\countDec|countBcd\(6) & (\countDec|Add1~11\ $ (GND))) # (!\countDec|countBcd\(6) & (!\countDec|Add1~11\ & VCC))
-- \countDec|Add1~13\ = CARRY((\countDec|countBcd\(6) & !\countDec|Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(6),
	datad => VCC,
	cin => \countDec|Add1~11\,
	combout => \countDec|Add1~12_combout\,
	cout => \countDec|Add1~13\);

-- Location: FF_X111_Y20_N13
\countDec|countBcd[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~12_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(6));

-- Location: LCCOMB_X111_Y20_N14
\countDec|Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~14_combout\ = (\countDec|countBcd\(7) & (!\countDec|Add1~13\)) # (!\countDec|countBcd\(7) & ((\countDec|Add1~13\) # (GND)))
-- \countDec|Add1~15\ = CARRY((!\countDec|Add1~13\) # (!\countDec|countBcd\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(7),
	datad => VCC,
	cin => \countDec|Add1~13\,
	combout => \countDec|Add1~14_combout\,
	cout => \countDec|Add1~15\);

-- Location: FF_X111_Y20_N15
\countDec|countBcd[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~14_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(7));

-- Location: LCCOMB_X111_Y20_N16
\countDec|Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~16_combout\ = (\countDec|countBcd\(8) & (\countDec|Add1~15\ $ (GND))) # (!\countDec|countBcd\(8) & (!\countDec|Add1~15\ & VCC))
-- \countDec|Add1~17\ = CARRY((\countDec|countBcd\(8) & !\countDec|Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(8),
	datad => VCC,
	cin => \countDec|Add1~15\,
	combout => \countDec|Add1~16_combout\,
	cout => \countDec|Add1~17\);

-- Location: FF_X111_Y20_N17
\countDec|countBcd[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~16_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(8));

-- Location: LCCOMB_X111_Y20_N18
\countDec|Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~18_combout\ = (\countDec|countBcd\(9) & (!\countDec|Add1~17\)) # (!\countDec|countBcd\(9) & ((\countDec|Add1~17\) # (GND)))
-- \countDec|Add1~19\ = CARRY((!\countDec|Add1~17\) # (!\countDec|countBcd\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(9),
	datad => VCC,
	cin => \countDec|Add1~17\,
	combout => \countDec|Add1~18_combout\,
	cout => \countDec|Add1~19\);

-- Location: FF_X111_Y20_N19
\countDec|countBcd[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~18_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(9));

-- Location: LCCOMB_X111_Y20_N20
\countDec|Add1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~20_combout\ = (\countDec|countBcd\(10) & (\countDec|Add1~19\ $ (GND))) # (!\countDec|countBcd\(10) & (!\countDec|Add1~19\ & VCC))
-- \countDec|Add1~21\ = CARRY((\countDec|countBcd\(10) & !\countDec|Add1~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(10),
	datad => VCC,
	cin => \countDec|Add1~19\,
	combout => \countDec|Add1~20_combout\,
	cout => \countDec|Add1~21\);

-- Location: FF_X111_Y20_N21
\countDec|countBcd[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \countDec|Add1~20_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(10));

-- Location: LCCOMB_X111_Y20_N22
\countDec|Add1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~22_combout\ = (\countDec|countBcd\(11) & (!\countDec|Add1~21\)) # (!\countDec|countBcd\(11) & ((\countDec|Add1~21\) # (GND)))
-- \countDec|Add1~23\ = CARRY((!\countDec|Add1~21\) # (!\countDec|countBcd\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(11),
	datad => VCC,
	cin => \countDec|Add1~21\,
	combout => \countDec|Add1~22_combout\,
	cout => \countDec|Add1~23\);

-- Location: FF_X111_Y20_N23
\countDec|countBcd[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~22_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(11));

-- Location: LCCOMB_X111_Y20_N24
\countDec|Add1~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~24_combout\ = (\countDec|countBcd\(12) & (\countDec|Add1~23\ $ (GND))) # (!\countDec|countBcd\(12) & (!\countDec|Add1~23\ & VCC))
-- \countDec|Add1~25\ = CARRY((\countDec|countBcd\(12) & !\countDec|Add1~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(12),
	datad => VCC,
	cin => \countDec|Add1~23\,
	combout => \countDec|Add1~24_combout\,
	cout => \countDec|Add1~25\);

-- Location: FF_X111_Y20_N25
\countDec|countBcd[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~24_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(12));

-- Location: LCCOMB_X111_Y20_N26
\countDec|Add1~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~26_combout\ = (\countDec|countBcd\(13) & (!\countDec|Add1~25\)) # (!\countDec|countBcd\(13) & ((\countDec|Add1~25\) # (GND)))
-- \countDec|Add1~27\ = CARRY((!\countDec|Add1~25\) # (!\countDec|countBcd\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(13),
	datad => VCC,
	cin => \countDec|Add1~25\,
	combout => \countDec|Add1~26_combout\,
	cout => \countDec|Add1~27\);

-- Location: FF_X111_Y20_N27
\countDec|countBcd[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~26_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(13));

-- Location: LCCOMB_X111_Y20_N28
\countDec|Add1~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~28_combout\ = (\countDec|countBcd\(14) & (\countDec|Add1~27\ $ (GND))) # (!\countDec|countBcd\(14) & (!\countDec|Add1~27\ & VCC))
-- \countDec|Add1~29\ = CARRY((\countDec|countBcd\(14) & !\countDec|Add1~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(14),
	datad => VCC,
	cin => \countDec|Add1~27\,
	combout => \countDec|Add1~28_combout\,
	cout => \countDec|Add1~29\);

-- Location: FF_X111_Y20_N29
\countDec|countBcd[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~28_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(14));

-- Location: LCCOMB_X111_Y20_N30
\countDec|Add1~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~30_combout\ = (\countDec|countBcd\(15) & (!\countDec|Add1~29\)) # (!\countDec|countBcd\(15) & ((\countDec|Add1~29\) # (GND)))
-- \countDec|Add1~31\ = CARRY((!\countDec|Add1~29\) # (!\countDec|countBcd\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(15),
	datad => VCC,
	cin => \countDec|Add1~29\,
	combout => \countDec|Add1~30_combout\,
	cout => \countDec|Add1~31\);

-- Location: FF_X111_Y20_N31
\countDec|countBcd[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~30_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(15));

-- Location: LCCOMB_X112_Y20_N12
\countDec|Equal2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal2~5_combout\ = (!\countDec|countBcd\(13) & (!\countDec|countBcd\(12) & (!\countDec|countBcd\(15) & !\countDec|countBcd\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(13),
	datab => \countDec|countBcd\(12),
	datac => \countDec|countBcd\(15),
	datad => \countDec|countBcd\(14),
	combout => \countDec|Equal2~5_combout\);

-- Location: LCCOMB_X112_Y20_N26
\countDec|Equal2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal2~6_combout\ = (!\countDec|countBcd\(8) & (!\countDec|countBcd\(11) & (!\countDec|countBcd\(10) & !\countDec|countBcd\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(8),
	datab => \countDec|countBcd\(11),
	datac => \countDec|countBcd\(10),
	datad => \countDec|countBcd\(9),
	combout => \countDec|Equal2~6_combout\);

-- Location: LCCOMB_X112_Y20_N10
\countDec|Equal2~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal2~7_combout\ = (!\countDec|countBcd\(4) & (!\countDec|countBcd\(7) & (!\countDec|countBcd\(5) & !\countDec|countBcd\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(4),
	datab => \countDec|countBcd\(7),
	datac => \countDec|countBcd\(5),
	datad => \countDec|countBcd\(6),
	combout => \countDec|Equal2~7_combout\);

-- Location: LCCOMB_X112_Y20_N24
\countDec|Equal2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal2~8_combout\ = (\countDec|Equal2~5_combout\ & (\countDec|Equal2~6_combout\ & \countDec|Equal2~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|Equal2~5_combout\,
	datac => \countDec|Equal2~6_combout\,
	datad => \countDec|Equal2~7_combout\,
	combout => \countDec|Equal2~8_combout\);

-- Location: LCCOMB_X112_Y20_N8
\countDec|Equal10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal10~0_combout\ = (!\countDec|countBcd\(2) & (\countDec|countBcd\(3) & !\countDec|countBcd\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(2),
	datac => \countDec|countBcd\(3),
	datad => \countDec|countBcd\(1),
	combout => \countDec|Equal10~0_combout\);

-- Location: LCCOMB_X111_Y19_N0
\countDec|Add1~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~32_combout\ = (\countDec|countBcd\(16) & (\countDec|Add1~31\ $ (GND))) # (!\countDec|countBcd\(16) & (!\countDec|Add1~31\ & VCC))
-- \countDec|Add1~33\ = CARRY((\countDec|countBcd\(16) & !\countDec|Add1~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(16),
	datad => VCC,
	cin => \countDec|Add1~31\,
	combout => \countDec|Add1~32_combout\,
	cout => \countDec|Add1~33\);

-- Location: FF_X111_Y19_N1
\countDec|countBcd[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~32_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(16));

-- Location: LCCOMB_X111_Y19_N2
\countDec|Add1~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~34_combout\ = (\countDec|countBcd\(17) & (!\countDec|Add1~33\)) # (!\countDec|countBcd\(17) & ((\countDec|Add1~33\) # (GND)))
-- \countDec|Add1~35\ = CARRY((!\countDec|Add1~33\) # (!\countDec|countBcd\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(17),
	datad => VCC,
	cin => \countDec|Add1~33\,
	combout => \countDec|Add1~34_combout\,
	cout => \countDec|Add1~35\);

-- Location: FF_X111_Y19_N3
\countDec|countBcd[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~34_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(17));

-- Location: LCCOMB_X111_Y19_N4
\countDec|Add1~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~36_combout\ = (\countDec|countBcd\(18) & (\countDec|Add1~35\ $ (GND))) # (!\countDec|countBcd\(18) & (!\countDec|Add1~35\ & VCC))
-- \countDec|Add1~37\ = CARRY((\countDec|countBcd\(18) & !\countDec|Add1~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(18),
	datad => VCC,
	cin => \countDec|Add1~35\,
	combout => \countDec|Add1~36_combout\,
	cout => \countDec|Add1~37\);

-- Location: FF_X111_Y19_N5
\countDec|countBcd[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~36_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(18));

-- Location: LCCOMB_X111_Y19_N6
\countDec|Add1~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~38_combout\ = (\countDec|countBcd\(19) & (!\countDec|Add1~37\)) # (!\countDec|countBcd\(19) & ((\countDec|Add1~37\) # (GND)))
-- \countDec|Add1~39\ = CARRY((!\countDec|Add1~37\) # (!\countDec|countBcd\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(19),
	datad => VCC,
	cin => \countDec|Add1~37\,
	combout => \countDec|Add1~38_combout\,
	cout => \countDec|Add1~39\);

-- Location: FF_X111_Y19_N7
\countDec|countBcd[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~38_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(19));

-- Location: LCCOMB_X112_Y19_N10
\countDec|Equal2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal2~3_combout\ = (!\countDec|countBcd\(18) & (!\countDec|countBcd\(19) & (!\countDec|countBcd\(16) & !\countDec|countBcd\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(18),
	datab => \countDec|countBcd\(19),
	datac => \countDec|countBcd\(16),
	datad => \countDec|countBcd\(17),
	combout => \countDec|Equal2~3_combout\);

-- Location: LCCOMB_X111_Y19_N8
\countDec|Add1~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~40_combout\ = (\countDec|countBcd\(20) & (\countDec|Add1~39\ $ (GND))) # (!\countDec|countBcd\(20) & (!\countDec|Add1~39\ & VCC))
-- \countDec|Add1~41\ = CARRY((\countDec|countBcd\(20) & !\countDec|Add1~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(20),
	datad => VCC,
	cin => \countDec|Add1~39\,
	combout => \countDec|Add1~40_combout\,
	cout => \countDec|Add1~41\);

-- Location: FF_X111_Y19_N9
\countDec|countBcd[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~40_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(20));

-- Location: LCCOMB_X111_Y19_N10
\countDec|Add1~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~42_combout\ = (\countDec|countBcd\(21) & (!\countDec|Add1~41\)) # (!\countDec|countBcd\(21) & ((\countDec|Add1~41\) # (GND)))
-- \countDec|Add1~43\ = CARRY((!\countDec|Add1~41\) # (!\countDec|countBcd\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(21),
	datad => VCC,
	cin => \countDec|Add1~41\,
	combout => \countDec|Add1~42_combout\,
	cout => \countDec|Add1~43\);

-- Location: FF_X111_Y19_N11
\countDec|countBcd[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~42_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(21));

-- Location: LCCOMB_X111_Y19_N12
\countDec|Add1~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~44_combout\ = (\countDec|countBcd\(22) & (\countDec|Add1~43\ $ (GND))) # (!\countDec|countBcd\(22) & (!\countDec|Add1~43\ & VCC))
-- \countDec|Add1~45\ = CARRY((\countDec|countBcd\(22) & !\countDec|Add1~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(22),
	datad => VCC,
	cin => \countDec|Add1~43\,
	combout => \countDec|Add1~44_combout\,
	cout => \countDec|Add1~45\);

-- Location: FF_X111_Y19_N13
\countDec|countBcd[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~44_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(22));

-- Location: LCCOMB_X111_Y19_N14
\countDec|Add1~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~46_combout\ = (\countDec|countBcd\(23) & (!\countDec|Add1~45\)) # (!\countDec|countBcd\(23) & ((\countDec|Add1~45\) # (GND)))
-- \countDec|Add1~47\ = CARRY((!\countDec|Add1~45\) # (!\countDec|countBcd\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(23),
	datad => VCC,
	cin => \countDec|Add1~45\,
	combout => \countDec|Add1~46_combout\,
	cout => \countDec|Add1~47\);

-- Location: FF_X111_Y19_N15
\countDec|countBcd[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~46_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(23));

-- Location: LCCOMB_X112_Y19_N4
\countDec|Equal2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal2~2_combout\ = (!\countDec|countBcd\(23) & (!\countDec|countBcd\(21) & (!\countDec|countBcd\(22) & !\countDec|countBcd\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(23),
	datab => \countDec|countBcd\(21),
	datac => \countDec|countBcd\(22),
	datad => \countDec|countBcd\(20),
	combout => \countDec|Equal2~2_combout\);

-- Location: LCCOMB_X111_Y19_N16
\countDec|Add1~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~48_combout\ = (\countDec|countBcd\(24) & (\countDec|Add1~47\ $ (GND))) # (!\countDec|countBcd\(24) & (!\countDec|Add1~47\ & VCC))
-- \countDec|Add1~49\ = CARRY((\countDec|countBcd\(24) & !\countDec|Add1~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(24),
	datad => VCC,
	cin => \countDec|Add1~47\,
	combout => \countDec|Add1~48_combout\,
	cout => \countDec|Add1~49\);

-- Location: FF_X111_Y19_N17
\countDec|countBcd[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~48_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(24));

-- Location: LCCOMB_X111_Y19_N18
\countDec|Add1~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~50_combout\ = (\countDec|countBcd\(25) & (!\countDec|Add1~49\)) # (!\countDec|countBcd\(25) & ((\countDec|Add1~49\) # (GND)))
-- \countDec|Add1~51\ = CARRY((!\countDec|Add1~49\) # (!\countDec|countBcd\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(25),
	datad => VCC,
	cin => \countDec|Add1~49\,
	combout => \countDec|Add1~50_combout\,
	cout => \countDec|Add1~51\);

-- Location: FF_X111_Y19_N19
\countDec|countBcd[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~50_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(25));

-- Location: LCCOMB_X111_Y19_N20
\countDec|Add1~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~52_combout\ = (\countDec|countBcd\(26) & (\countDec|Add1~51\ $ (GND))) # (!\countDec|countBcd\(26) & (!\countDec|Add1~51\ & VCC))
-- \countDec|Add1~53\ = CARRY((\countDec|countBcd\(26) & !\countDec|Add1~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(26),
	datad => VCC,
	cin => \countDec|Add1~51\,
	combout => \countDec|Add1~52_combout\,
	cout => \countDec|Add1~53\);

-- Location: FF_X111_Y19_N21
\countDec|countBcd[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~52_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(26));

-- Location: LCCOMB_X111_Y19_N22
\countDec|Add1~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~54_combout\ = (\countDec|countBcd\(27) & (!\countDec|Add1~53\)) # (!\countDec|countBcd\(27) & ((\countDec|Add1~53\) # (GND)))
-- \countDec|Add1~55\ = CARRY((!\countDec|Add1~53\) # (!\countDec|countBcd\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(27),
	datad => VCC,
	cin => \countDec|Add1~53\,
	combout => \countDec|Add1~54_combout\,
	cout => \countDec|Add1~55\);

-- Location: FF_X111_Y19_N23
\countDec|countBcd[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~54_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(27));

-- Location: LCCOMB_X112_Y19_N22
\countDec|Equal2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal2~1_combout\ = (!\countDec|countBcd\(24) & (!\countDec|countBcd\(26) & (!\countDec|countBcd\(25) & !\countDec|countBcd\(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(24),
	datab => \countDec|countBcd\(26),
	datac => \countDec|countBcd\(25),
	datad => \countDec|countBcd\(27),
	combout => \countDec|Equal2~1_combout\);

-- Location: LCCOMB_X111_Y19_N24
\countDec|Add1~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~56_combout\ = (\countDec|countBcd\(28) & (\countDec|Add1~55\ $ (GND))) # (!\countDec|countBcd\(28) & (!\countDec|Add1~55\ & VCC))
-- \countDec|Add1~57\ = CARRY((\countDec|countBcd\(28) & !\countDec|Add1~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(28),
	datad => VCC,
	cin => \countDec|Add1~55\,
	combout => \countDec|Add1~56_combout\,
	cout => \countDec|Add1~57\);

-- Location: FF_X111_Y19_N25
\countDec|countBcd[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~56_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(28));

-- Location: LCCOMB_X111_Y19_N26
\countDec|Add1~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~58_combout\ = (\countDec|countBcd\(29) & (!\countDec|Add1~57\)) # (!\countDec|countBcd\(29) & ((\countDec|Add1~57\) # (GND)))
-- \countDec|Add1~59\ = CARRY((!\countDec|Add1~57\) # (!\countDec|countBcd\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(29),
	datad => VCC,
	cin => \countDec|Add1~57\,
	combout => \countDec|Add1~58_combout\,
	cout => \countDec|Add1~59\);

-- Location: FF_X111_Y19_N27
\countDec|countBcd[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~58_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(29));

-- Location: LCCOMB_X111_Y19_N28
\countDec|Add1~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~60_combout\ = (\countDec|countBcd\(30) & (\countDec|Add1~59\ $ (GND))) # (!\countDec|countBcd\(30) & (!\countDec|Add1~59\ & VCC))
-- \countDec|Add1~61\ = CARRY((\countDec|countBcd\(30) & !\countDec|Add1~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \countDec|countBcd\(30),
	datad => VCC,
	cin => \countDec|Add1~59\,
	combout => \countDec|Add1~60_combout\,
	cout => \countDec|Add1~61\);

-- Location: FF_X111_Y19_N29
\countDec|countBcd[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~60_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(30));

-- Location: LCCOMB_X111_Y19_N30
\countDec|Add1~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Add1~62_combout\ = \countDec|countBcd\(31) $ (\countDec|Add1~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(31),
	cin => \countDec|Add1~61\,
	combout => \countDec|Add1~62_combout\);

-- Location: FF_X111_Y19_N31
\countDec|countBcd[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \countDec|Add1~62_combout\,
	clrn => \rst~input_o\,
	ena => \countDec|countBcd[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \countDec|countBcd\(31));

-- Location: LCCOMB_X112_Y19_N28
\countDec|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal2~0_combout\ = (!\countDec|countBcd\(29) & (!\countDec|countBcd\(31) & (!\countDec|countBcd\(28) & !\countDec|countBcd\(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(29),
	datab => \countDec|countBcd\(31),
	datac => \countDec|countBcd\(28),
	datad => \countDec|countBcd\(30),
	combout => \countDec|Equal2~0_combout\);

-- Location: LCCOMB_X112_Y19_N0
\countDec|Equal2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal2~4_combout\ = (\countDec|Equal2~3_combout\ & (\countDec|Equal2~2_combout\ & (\countDec|Equal2~1_combout\ & \countDec|Equal2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|Equal2~3_combout\,
	datab => \countDec|Equal2~2_combout\,
	datac => \countDec|Equal2~1_combout\,
	datad => \countDec|Equal2~0_combout\,
	combout => \countDec|Equal2~4_combout\);

-- Location: LCCOMB_X112_Y20_N16
\countDec|Equal10~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal10~1_combout\ = (\countDec|Equal2~8_combout\ & (\countDec|Equal10~0_combout\ & \countDec|Equal2~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \countDec|Equal2~8_combout\,
	datac => \countDec|Equal10~0_combout\,
	datad => \countDec|Equal2~4_combout\,
	combout => \countDec|Equal10~1_combout\);

-- Location: LCCOMB_X112_Y20_N0
\countDec|WideNor0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|WideNor0~9_combout\ = (\countDec|Equal2~8_combout\ & (\countDec|Equal2~4_combout\ & ((\countDec|Equal10~0_combout\) # (!\countDec|countBcd\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|Equal10~0_combout\,
	datab => \countDec|Equal2~8_combout\,
	datac => \countDec|countBcd\(3),
	datad => \countDec|Equal2~4_combout\,
	combout => \countDec|WideNor0~9_combout\);

-- Location: CLKCTRL_G8
\countDec|WideNor0~9clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \countDec|WideNor0~9clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \countDec|WideNor0~9clkctrl_outclk\);

-- Location: LCCOMB_X113_Y20_N4
\countDec|b3_cod\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|b3_cod~combout\ = (GLOBAL(\countDec|WideNor0~9clkctrl_outclk\) & (\countDec|Equal10~1_combout\)) # (!GLOBAL(\countDec|WideNor0~9clkctrl_outclk\) & ((\countDec|b3_cod~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \countDec|Equal10~1_combout\,
	datac => \countDec|b3_cod~combout\,
	datad => \countDec|WideNor0~9clkctrl_outclk\,
	combout => \countDec|b3_cod~combout\);

-- Location: LCCOMB_X112_Y20_N4
\countDec|Equal2~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|Equal2~9_combout\ = (!\countDec|countBcd\(3) & (\countDec|Equal2~8_combout\ & \countDec|Equal2~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(3),
	datac => \countDec|Equal2~8_combout\,
	datad => \countDec|Equal2~4_combout\,
	combout => \countDec|Equal2~9_combout\);

-- Location: LCCOMB_X112_Y20_N28
\countDec|WideNor0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|WideNor0~8_combout\ = ((!\countDec|Equal10~1_combout\ & !\countDec|Equal2~9_combout\)) # (!\countDec|countBcd\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|Equal10~1_combout\,
	datac => \countDec|Equal2~9_combout\,
	datad => \countDec|countBcd\(0),
	combout => \countDec|WideNor0~8_combout\);

-- Location: LCCOMB_X112_Y20_N18
\countDec|b0_cod\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|b0_cod~combout\ = (GLOBAL(\countDec|WideNor0~9clkctrl_outclk\) & ((!\countDec|WideNor0~8_combout\))) # (!GLOBAL(\countDec|WideNor0~9clkctrl_outclk\) & (\countDec|b0_cod~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \countDec|b0_cod~combout\,
	datac => \countDec|WideNor0~8_combout\,
	datad => \countDec|WideNor0~9clkctrl_outclk\,
	combout => \countDec|b0_cod~combout\);

-- Location: LCCOMB_X112_Y20_N2
\countDec|WideOr5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|WideOr5~2_combout\ = (!\countDec|countBcd\(3) & (\countDec|countBcd\(2) & (\countDec|Equal2~8_combout\ & \countDec|Equal2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(3),
	datab => \countDec|countBcd\(2),
	datac => \countDec|Equal2~8_combout\,
	datad => \countDec|Equal2~4_combout\,
	combout => \countDec|WideOr5~2_combout\);

-- Location: LCCOMB_X112_Y20_N14
\countDec|b2_cod\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|b2_cod~combout\ = (GLOBAL(\countDec|WideNor0~9clkctrl_outclk\) & ((\countDec|WideOr5~2_combout\))) # (!GLOBAL(\countDec|WideNor0~9clkctrl_outclk\) & (\countDec|b2_cod~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \countDec|b2_cod~combout\,
	datac => \countDec|WideOr5~2_combout\,
	datad => \countDec|WideNor0~9clkctrl_outclk\,
	combout => \countDec|b2_cod~combout\);

-- Location: LCCOMB_X112_Y20_N30
\countDec|WideOr3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|WideOr3~2_combout\ = (\countDec|countBcd\(1) & (!\countDec|countBcd\(3) & (\countDec|Equal2~8_combout\ & \countDec|Equal2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|countBcd\(1),
	datab => \countDec|countBcd\(3),
	datac => \countDec|Equal2~8_combout\,
	datad => \countDec|Equal2~4_combout\,
	combout => \countDec|WideOr3~2_combout\);

-- Location: LCCOMB_X112_Y20_N20
\countDec|b1_cod\ : cycloneive_lcell_comb
-- Equation(s):
-- \countDec|b1_cod~combout\ = (GLOBAL(\countDec|WideNor0~9clkctrl_outclk\) & (\countDec|WideOr3~2_combout\)) # (!GLOBAL(\countDec|WideNor0~9clkctrl_outclk\) & ((\countDec|b1_cod~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \countDec|WideOr3~2_combout\,
	datac => \countDec|WideNor0~9clkctrl_outclk\,
	datad => \countDec|b1_cod~combout\,
	combout => \countDec|b1_cod~combout\);

-- Location: LCCOMB_X112_Y19_N26
\comb~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~8_combout\ = (\countDec|b1_cod~combout\ & (!\countDec|b3_cod~combout\)) # (!\countDec|b1_cod~combout\ & (\countDec|b2_cod~combout\ $ (((\countDec|b3_cod~combout\) # (!\countDec|b0_cod~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|b3_cod~combout\,
	datab => \countDec|b0_cod~combout\,
	datac => \countDec|b2_cod~combout\,
	datad => \countDec|b1_cod~combout\,
	combout => \comb~8_combout\);

-- Location: LCCOMB_X112_Y19_N8
\comb~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~9_combout\ = (!\countDec|b3_cod~combout\ & (!\countDec|b1_cod~combout\ & (\countDec|b0_cod~combout\ $ (\countDec|b2_cod~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|b3_cod~combout\,
	datab => \countDec|b0_cod~combout\,
	datac => \countDec|b2_cod~combout\,
	datad => \countDec|b1_cod~combout\,
	combout => \comb~9_combout\);

-- Location: LCCOMB_X112_Y19_N20
\a_seg$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \a_seg$latch~combout\ = (!\comb~8_combout\ & ((\comb~9_combout\) # (\a_seg$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comb~8_combout\,
	datac => \comb~9_combout\,
	datad => \a_seg$latch~combout\,
	combout => \a_seg$latch~combout\);

-- Location: LCCOMB_X113_Y20_N18
\comb~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~18_combout\ = (\countDec|b2_cod~combout\ & (!\countDec|b3_cod~combout\ & (\countDec|b1_cod~combout\ $ (\countDec|b0_cod~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|b1_cod~combout\,
	datab => \countDec|b0_cod~combout\,
	datac => \countDec|b2_cod~combout\,
	datad => \countDec|b3_cod~combout\,
	combout => \comb~18_combout\);

-- Location: LCCOMB_X113_Y20_N24
\comb~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~17_combout\ = (\countDec|b2_cod~combout\ & (!\countDec|b3_cod~combout\ & (\countDec|b1_cod~combout\ $ (!\countDec|b0_cod~combout\)))) # (!\countDec|b2_cod~combout\ & (((!\countDec|b3_cod~combout\)) # (!\countDec|b1_cod~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010110011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|b1_cod~combout\,
	datab => \countDec|b0_cod~combout\,
	datac => \countDec|b2_cod~combout\,
	datad => \countDec|b3_cod~combout\,
	combout => \comb~17_combout\);

-- Location: LCCOMB_X114_Y20_N16
\b_seg$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \b_seg$latch~combout\ = (!\comb~17_combout\ & ((\comb~18_combout\) # (\b_seg$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \comb~18_combout\,
	datac => \comb~17_combout\,
	datad => \b_seg$latch~combout\,
	combout => \b_seg$latch~combout\);

-- Location: LCCOMB_X112_Y19_N18
\c_seg~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_seg~0_combout\ = (!\countDec|b3_cod~combout\ & (!\countDec|b0_cod~combout\ & (!\countDec|b2_cod~combout\ & \countDec|b1_cod~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|b3_cod~combout\,
	datab => \countDec|b0_cod~combout\,
	datac => \countDec|b2_cod~combout\,
	datad => \countDec|b1_cod~combout\,
	combout => \c_seg~0_combout\);

-- Location: LCCOMB_X112_Y19_N14
\comb~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~10_combout\ = (\countDec|b2_cod~combout\ & (!\countDec|b3_cod~combout\)) # (!\countDec|b2_cod~combout\ & (((!\countDec|b3_cod~combout\ & \countDec|b0_cod~combout\)) # (!\countDec|b1_cod~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|b3_cod~combout\,
	datab => \countDec|b0_cod~combout\,
	datac => \countDec|b2_cod~combout\,
	datad => \countDec|b1_cod~combout\,
	combout => \comb~10_combout\);

-- Location: LCCOMB_X112_Y19_N16
\c_seg$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_seg$latch~combout\ = (!\comb~10_combout\ & ((\c_seg~0_combout\) # (\c_seg$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \c_seg~0_combout\,
	datac => \comb~10_combout\,
	datad => \c_seg$latch~combout\,
	combout => \c_seg$latch~combout\);

-- Location: LCCOMB_X113_Y20_N28
\comb~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~19_combout\ = (\countDec|b1_cod~combout\ & (!\countDec|b3_cod~combout\ & ((!\countDec|b2_cod~combout\) # (!\countDec|b0_cod~combout\)))) # (!\countDec|b1_cod~combout\ & (\countDec|b2_cod~combout\ $ (((\countDec|b3_cod~combout\) # 
-- (!\countDec|b0_cod~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|b1_cod~combout\,
	datab => \countDec|b0_cod~combout\,
	datac => \countDec|b2_cod~combout\,
	datad => \countDec|b3_cod~combout\,
	combout => \comb~19_combout\);

-- Location: LCCOMB_X113_Y20_N26
\comb~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~20_combout\ = (!\countDec|b3_cod~combout\ & ((\countDec|b1_cod~combout\ & (\countDec|b0_cod~combout\ & \countDec|b2_cod~combout\)) # (!\countDec|b1_cod~combout\ & (\countDec|b0_cod~combout\ $ (\countDec|b2_cod~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|b1_cod~combout\,
	datab => \countDec|b0_cod~combout\,
	datac => \countDec|b2_cod~combout\,
	datad => \countDec|b3_cod~combout\,
	combout => \comb~20_combout\);

-- Location: LCCOMB_X114_Y20_N18
\d_seg$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \d_seg$latch~combout\ = (!\comb~19_combout\ & ((\comb~20_combout\) # (\d_seg$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \comb~19_combout\,
	datac => \comb~20_combout\,
	datad => \d_seg$latch~combout\,
	combout => \d_seg$latch~combout\);

-- Location: LCCOMB_X112_Y19_N30
\comb~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~12_combout\ = (\countDec|b1_cod~combout\ & (!\countDec|b3_cod~combout\ & (\countDec|b0_cod~combout\))) # (!\countDec|b1_cod~combout\ & ((\countDec|b2_cod~combout\ & (!\countDec|b3_cod~combout\)) # (!\countDec|b2_cod~combout\ & 
-- ((\countDec|b0_cod~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|b3_cod~combout\,
	datab => \countDec|b0_cod~combout\,
	datac => \countDec|b2_cod~combout\,
	datad => \countDec|b1_cod~combout\,
	combout => \comb~12_combout\);

-- Location: LCCOMB_X112_Y19_N12
\comb~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~11_combout\ = (!\countDec|b0_cod~combout\ & ((\countDec|b1_cod~combout\ & (!\countDec|b3_cod~combout\)) # (!\countDec|b1_cod~combout\ & ((!\countDec|b2_cod~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|b3_cod~combout\,
	datab => \countDec|b0_cod~combout\,
	datac => \countDec|b2_cod~combout\,
	datad => \countDec|b1_cod~combout\,
	combout => \comb~11_combout\);

-- Location: LCCOMB_X112_Y19_N2
\e_seg$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \e_seg$latch~combout\ = (!\comb~11_combout\ & ((\comb~12_combout\) # (\e_seg$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comb~12_combout\,
	datac => \comb~11_combout\,
	datad => \e_seg$latch~combout\,
	combout => \e_seg$latch~combout\);

-- Location: LCCOMB_X113_Y20_N14
\comb~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~14_combout\ = (!\countDec|b3_cod~combout\ & ((\countDec|b1_cod~combout\ & ((\countDec|b0_cod~combout\) # (!\countDec|b2_cod~combout\))) # (!\countDec|b1_cod~combout\ & (\countDec|b0_cod~combout\ & !\countDec|b2_cod~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|b1_cod~combout\,
	datab => \countDec|b0_cod~combout\,
	datac => \countDec|b2_cod~combout\,
	datad => \countDec|b3_cod~combout\,
	combout => \comb~14_combout\);

-- Location: LCCOMB_X113_Y20_N20
\comb~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~13_combout\ = (\countDec|b0_cod~combout\ & (!\countDec|b1_cod~combout\ & (\countDec|b2_cod~combout\ $ (\countDec|b3_cod~combout\)))) # (!\countDec|b0_cod~combout\ & ((\countDec|b2_cod~combout\ & ((!\countDec|b3_cod~combout\))) # 
-- (!\countDec|b2_cod~combout\ & (!\countDec|b1_cod~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|b1_cod~combout\,
	datab => \countDec|b0_cod~combout\,
	datac => \countDec|b2_cod~combout\,
	datad => \countDec|b3_cod~combout\,
	combout => \comb~13_combout\);

-- Location: LCCOMB_X114_Y20_N28
\f_seg$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \f_seg$latch~combout\ = (!\comb~13_combout\ & ((\comb~14_combout\) # (\f_seg$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comb~14_combout\,
	datac => \comb~13_combout\,
	datad => \f_seg$latch~combout\,
	combout => \f_seg$latch~combout\);

-- Location: LCCOMB_X113_Y20_N22
\comb~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~16_combout\ = (!\countDec|b3_cod~combout\ & ((\countDec|b1_cod~combout\ & (\countDec|b0_cod~combout\ & \countDec|b2_cod~combout\)) # (!\countDec|b1_cod~combout\ & ((!\countDec|b2_cod~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|b1_cod~combout\,
	datab => \countDec|b0_cod~combout\,
	datac => \countDec|b2_cod~combout\,
	datad => \countDec|b3_cod~combout\,
	combout => \comb~16_combout\);

-- Location: LCCOMB_X113_Y20_N16
\comb~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~15_combout\ = (\countDec|b1_cod~combout\ & (!\countDec|b3_cod~combout\ & ((!\countDec|b2_cod~combout\) # (!\countDec|b0_cod~combout\)))) # (!\countDec|b1_cod~combout\ & ((\countDec|b2_cod~combout\ $ (\countDec|b3_cod~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \countDec|b1_cod~combout\,
	datab => \countDec|b0_cod~combout\,
	datac => \countDec|b2_cod~combout\,
	datad => \countDec|b3_cod~combout\,
	combout => \comb~15_combout\);

-- Location: LCCOMB_X114_Y20_N10
\g_seg$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \g_seg$latch~combout\ = (!\comb~15_combout\ & ((\comb~16_combout\) # (\g_seg$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \comb~16_combout\,
	datac => \comb~15_combout\,
	datad => \g_seg$latch~combout\,
	combout => \g_seg$latch~combout\);

ww_a_seg <= \a_seg~output_o\;

ww_b_seg <= \b_seg~output_o\;

ww_c_seg <= \c_seg~output_o\;

ww_d_seg <= \d_seg~output_o\;

ww_e_seg <= \e_seg~output_o\;

ww_f_seg <= \f_seg~output_o\;

ww_g_seg <= \g_seg~output_o\;
END structure;


