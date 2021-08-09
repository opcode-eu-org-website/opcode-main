library ieee;
use ieee.std_logic_1164.all;

entity przerzutnik is
	port (
		D,CLK,RST,ENABLE: in std_logic;
		Q: buffer std_logic
	);
end;

architecture logic of przerzutnik is
	begin
		process (CLK, RST)
		begin
			if (RST='0') then
				Q<='0';
			-- reagowanie na opadające (CLK='0') zbocze zegara (CLK'event)
			-- powoduje utworzenie przerzutnika a nie zatrzasku
			-- który uzyskalibyśmy pisząc: if (ENABLE='1') then Q<=D; end if;
			elsif (CLK='0' and CLK'event) then
				if (ENABLE='1') then
				    Q<=D;
				end if;
			end if;
		end process;
end;
