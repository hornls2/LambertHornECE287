--------------------------------------------------------------------------------
--
--   FileName:         hw_image_generator.vhd
--   Dependencies:     none
--   Design Software:  Quartus II 64-bit Version 12.1 Build 177 SJ Full Version
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 05/10/2013 Scott Larson
--     Initial Public Release
--    
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY hw_image_generator IS
	GENERIC(
	constant	pixels_y :	INTEGER := 1920;    --row that first color will persist until
	constant	pixels_x	:	INTEGER := 1920;	
		pixels_y1 :	INTEGER := 1920; 
		pixels_x2 :	INTEGER := 1920;
	--constant x1 :Integer:= 0;
	constant	x2 :Integer:= 980;
	constant y1 :Integer:= 510;
	constant	y2 :Integer:= 570);   --column that first color will persist until
	PORT(
	   switch : IN  std_LOGIC;
		disp_ena		:	IN		STD_LOGIC;	--display enable ('1' = display time, '0' = blanking time)
		column			:	IN		INTEGER;		--row pixel coordinate
		row		:	IN		INTEGER;		--column pixel coordinate
		red			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --red magnitude output to DAC
		green			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --green magnitude output to DAC
		blue			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0'); --blue magnitude output to DAC
		h_count1 :IN Integer);
END hw_image_generator;

ARCHITECTURE behavior OF hw_image_generator IS

signal clk_r : STD_LOGIC_VECTOR(4 downto 0) :=(others => '0');
signal x1 :Integer:= 0;

begin
process(h_count1)
 begin 
 
 if h_count1 mod 100 = 0 then 
 if x1 >= 1920 then 
 x1 <= x1 + 1;
 else 
 --x1<= (others=> '0'); 
 --x1 <= x1 xor '1'; 
 
  x1 <= 0;
 end if; 
 end if;
 end process;
 
	PROCESS(disp_ena, row, column)
	BEGIN

	IF(disp_ena = '1') THEN		--display time		
		
 if (switch='1') then
 if(column <900 and row<900)then
	--if(row < pixels_y AND column < pixels_x)then
		--start switch on
		
		  IF(   ((row > (115)) AND (row < (155))) OR ((column > (115)) AND (column < (150)))) THEN--220 260
		  --and ((x2-(counter*100) >= row and  x1-(counter*100) <=row) or (y2+(counter*100) >= column and y1+(counter*100) <=column))
	  
		red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
				
					ELSE								
			red <= (OTHERS => '0');
			green <= (OTHERS => '1');
			blue <= (OTHERS => '1');
			
			
			end if;
				  IF( ((row > 250) AND (row < 290)) or ((column > 250) AND (column < 290))) THEN --460 500
		  --and ((x2-(counter*100) >= row and  x1-(counter*100) <=row) or (y2+(counter*100) >= column and y1+(counter*100) <=column))
	  
		red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
				
			
			end if;
				
				  IF( ((row > 385) AND (row < 425)) or ( (column > 385) AND (column < 425))) THEN--700 740
		  --and ((x2-(counter*100) >= row and  x1-(counter*100) <=row) or (y2+(counter*100) >= column and y1+(counter*100) <=column))
	  
		red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
				end if;
				   IF( ((row > 520) AND (row < 560)) or ( (column > (520)) AND (column < 560))) THEN--940 980
		  --and ((x2-(counter*100) >= row and  x1-(counter*100) <=row) or (y2+(counter*100) >= column and y1+(counter*100) <=column))
	  
		red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
				end if;
				  IF( ((row > 655) AND (row < 695)) or ( (column > 655) AND (column < 695))) THEN--1180 1220
		  --and ((x2-(counter*100) >= row and  x1-(counter*100) <=row) or (y2+(counter*100) >= column and y1+(counter*100) <=column))
	  
		red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
				end if;
				  IF( ((row > 790) AND (row < 830)) or ( (column > 790) AND (column < 830))) THEN--790 830
		  --and ((x2-(counter*100) >= row and  x1-(counter*100) <=row) or (y2+(counter*100) >= column and y1+(counter*100) <=column))
	  
		red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
				end if;
				   IF( ((row > 925) AND (row < 965)) or ( (column > 925) AND (column < 965))) THEN--1660 1700
		  --and ((x2-(counter*100) >= row and  x1-(counter*100) <=row) or (y2+(counter*100) >= column and y1+(counter*100) <=column))
	  
		red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
				end if;
				end if;
		
--		ELSE								
--			red <= (OTHERS => '0');
--			green <= (OTHERS => '1');
--			blue <= (OTHERS => '1');
--			
--			end if;
			
			
		--	end loop;
--			 IF( row < pixels_y AND column < pixels_x and ((x2-100) >= row and  (x1-100) <=row) and (y2 >= column and y1 <=column)) THEN
--		  red <= (OTHERS => '0');
--				green	<= (OTHERS => '1');
--				blue <= (OTHERS => '0');	 
--		end if;
		
		
		--end switch on
	else

			IF(row < pixels_y AND column < pixels_x and ((x1 - 10) >= row and (x1 + 10) <= row) and (y2 >= column and y1 <=column)) THEN
			
				red <= (OTHERS => '1');
				green	<= (OTHERS => '0');
				blue <= (OTHERS => '1');
			ELSE
				red <= (OTHERS => '1');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
		
       	end if;
	end if;
	
	ELSE 
		red <= (OTHERS => '0');
		green	<= (OTHERS => '0');
		blue <= (OTHERS => '0');
		
  END IF;
	END PROCESS;
END behavior;