library ieee;
use ieee.std_logic_1164.all;
entity lightVHD is
end lightVHD;
---
architecture behav of lightVHD is
component light
port(
x1 :in std_logic;
x2 :in std_logic;
f :out std_logic);
end component;
--------
signal ain :std_logic :='0';
signal bin :std_logic :='0';
signal cout :std_logic;
begin
----instantiate
U1 :light port map(x1 => ain,x2 => bin,f => cout);
-----ain stimulus
Process
begin
ain<='0';
wait for 20 ns;
ain<='1';
wait for 20 ns;
end process;
-----bin stimulus
process
begin
bin<='0';
wait for 40 ns;
bin<='1';
wait for 20 ns;
end process;
----
end behav;