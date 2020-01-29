-- fsm.vhd: Finite State Machine
-- Author(s): David Oravec (xorave05)
--
library ieee;
use ieee.std_logic_1164.all;
-- ----------------------------------------------------------------------------
--                        Entity declaration
-- ----------------------------------------------------------------------------
entity fsm is
port(
   CLK         : in  std_logic;
   RESET       : in  std_logic;

   -- Input signals
   KEY         : in  std_logic_vector(15 downto 0);
   CNT_OF      : in  std_logic;

   -- Output signals
   FSM_CNT_CE  : out std_logic;
   FSM_MX_MEM  : out std_logic;
   FSM_MX_LCD  : out std_logic;
   FSM_LCD_WR  : out std_logic;
   FSM_LCD_CLR : out std_logic
);
end entity fsm;

-- ----------------------------------------------------------------------------
--                      Architecture declaration
-- ----------------------------------------------------------------------------
architecture behavioral of fsm is
   type t_state is (TEST_1, TEST_2, TEST_3_A, TEST_3_B, TEST_4_A, TEST_4_B, TEST_5_A, TEST_5_B, TEST_6_A, TEST_6_B,
  		    TEST_7_A, TEST_7_B, TEST_8_A, TEST_8_B, TEST_9_A, TEST_9_B, TEST_10_A, TEST_10_B, TEST_11_A, 
		    PRINT_MESSAGE_OK, PRINT_MESSAGE_FAIL, TEST_WAIT, FAIL, FINISH);
   signal present_state, next_state : t_state;

begin
-- -------------------------------------------------------
sync_logic : process(RESET, CLK)
begin
   if (RESET = '1') then
      present_state <= TEST_1;
   elsif (CLK'event AND CLK = '1') then
      present_state <= next_state;
   end if;
end process sync_logic;

-- -------------------------------------------------------
next_state_logic : process(present_state, KEY, CNT_OF)
begin
   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_1 =>
      next_state <= TEST_1;
      if (KEY(1) = '1') then
		next_state <=TEST_2;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		
      	elsif (KEY(15) = '1') then
        	 next_state <= PRINT_MESSAGE_FAIL; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_2 =>
      next_state <= TEST_2;
      if (KEY(5) = '1') then
		next_state <=TEST_3_A;
	elsif (KEY(6) = '1') then
		next_state <= TEST_3_B;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		
      	elsif (KEY(15) = '1') then
        	 next_state <= PRINT_MESSAGE_FAIL; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_3_A =>
      next_state <= TEST_3_A;
      if (KEY(1) = '1') then
		next_state <=TEST_4_A;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		
      	elsif (KEY(15) = '1') then
        	 next_state <= PRINT_MESSAGE_FAIL; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_4_A =>
      next_state <= TEST_4_A;
      if (KEY(4) = '1') then
		next_state <=TEST_5_A;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		
      	elsif (KEY(15) = '1') then
        	 next_state <= PRINT_MESSAGE_FAIL; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_5_A =>
      next_state <= TEST_5_A;
      if (KEY(6) = '1') then
		next_state <=TEST_6_A;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		
      	elsif (KEY(15) = '1') then
        	 next_state <= PRINT_MESSAGE_FAIL; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_6_A =>
      next_state <= TEST_6_A;
      if (KEY(4) = '1') then
		next_state <=TEST_7_A;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		
      	elsif (KEY(15) = '1') then
        	 next_state <= PRINT_MESSAGE_FAIL; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_7_A =>
      next_state <= TEST_7_A;
      if (KEY(5) = '1') then
		next_state <=TEST_8_A;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		
      	elsif (KEY(15) = '1') then
        	 next_state <= PRINT_MESSAGE_FAIL; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_8_A =>
      next_state <= TEST_8_A;
      if (KEY(3) = '1') then
		next_state <=TEST_9_A;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		
      	elsif (KEY(15) = '1') then
        	 next_state <= PRINT_MESSAGE_FAIL; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_9_A =>
      next_state <= TEST_9_A;
      if (KEY(2) = '1') then
		next_state <=TEST_10_A;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		
      	elsif (KEY(15) = '1') then
        	 next_state <= PRINT_MESSAGE_FAIL; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_10_A =>
      next_state <= TEST_10_A;
      if (KEY(3) = '1') then
		next_state <=TEST_11_A;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		
      	elsif (KEY(15) = '1') then
        	 next_state <= PRINT_MESSAGE_FAIL; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_11_A =>
      next_state <= TEST_11_A;
      if (KEY(2) = '1') then
		next_state <=TEST_WAIT;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		
      	elsif (KEY(15) = '1') then
        	 next_state <= PRINT_MESSAGE_FAIL; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_3_B =>
      next_state <= TEST_3_B;
      if (KEY(8) = '1') then
		next_state <=TEST_4_B;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		
      	elsif (KEY(15) = '1') then
        	 next_state <= PRINT_MESSAGE_FAIL; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_4_B =>
      next_state <= TEST_4_B;
      if (KEY(2) = '1') then
		next_state <=TEST_5_B;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		
      	elsif (KEY(15) = '1') then
        	 next_state <= PRINT_MESSAGE_FAIL; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_5_B =>
      next_state <= TEST_5_B;
      if (KEY(9) = '1') then
		next_state <=TEST_6_B;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		
      	elsif (KEY(15) = '1') then
        	 next_state <= PRINT_MESSAGE_FAIL; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_6_B =>
      next_state <= TEST_6_B;
      if (KEY(3) = '1') then
		next_state <=TEST_7_B;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		
      	elsif (KEY(15) = '1') then
        	 next_state <= PRINT_MESSAGE_FAIL; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_7_B =>
      next_state <= TEST_7_B;
      if (KEY(9) = '1') then
		next_state <=TEST_8_B;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		
      	elsif (KEY(15) = '1') then
        	 next_state <= PRINT_MESSAGE_FAIL; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_8_B =>
      next_state <= TEST_8_B;
      if (KEY(2) = '1') then
		next_state <=TEST_9_B;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		
      	elsif (KEY(15) = '1') then
        	 next_state <= PRINT_MESSAGE_FAIL; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_9_B =>
      next_state <= TEST_9_B;
      if (KEY(4) = '1') then
		next_state <=TEST_10_B;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		
      	elsif (KEY(15) = '1') then
        	 next_state <= PRINT_MESSAGE_FAIL; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_10_B =>
      next_state <= TEST_10_B;
      if (KEY(8) = '1') then
		next_state <=TEST_WAIT;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		
      	elsif (KEY(15) = '1') then
        	 next_state <= PRINT_MESSAGE_FAIL; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_WAIT =>
      next_state <= TEST_WAIT;
      if (KEY(15) = '1') then
		next_state <=PRINT_MESSAGE_OK;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= FAIL;		 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FAIL =>
      next_state <= FAIL;
      if (KEY(15) = '1') then
      next_state <=PRINT_MESSAGE_FAIL;      
   end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_MESSAGE_FAIL =>
      next_state <= PRINT_MESSAGE_FAIL;
      if (CNT_OF = '1') then
         next_state <= FINISH;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_MESSAGE_OK =>
      next_state <= PRINT_MESSAGE_OK;
      if (CNT_OF = '1') then
         next_state <= FINISH;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      next_state <= FINISH;
      if (KEY(15) = '1') then
         next_state <= TEST_1; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
      next_state <= TEST_1;
   end case;
end process next_state_logic;

-- -------------------------------------------------------
output_logic : process(present_state, KEY)
begin
   FSM_CNT_CE     <= '0';
   FSM_MX_MEM     <= '0';
   FSM_MX_LCD     <= '0';
   FSM_LCD_WR     <= '0';
   FSM_LCD_CLR    <= '0';

   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_MESSAGE_FAIL =>
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';
      FSM_MX_MEM     <= '0';
   -- - - - - - - - - - - - - - - - - - - - - - -
   
   when PRINT_MESSAGE_OK =>
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';
      FSM_MX_MEM     <= '1';
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others => 
	if (KEY(14 downto 0) /= "000000000000000") then
			FSM_LCD_WR     <= '1';
      	    elsif (KEY(15) = '1') then
         		FSM_LCD_CLR    <= '1';
      end if;	   
   end case;
end process output_logic;

end architecture behavioral;

