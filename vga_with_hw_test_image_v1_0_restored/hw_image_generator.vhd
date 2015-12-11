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
package int_array_pkg is 
	type integer_array is array (0 to 63) of integer range 0 to 2;
		type count_array is array (0 to 7, 0 to 7) of integer range 0 to 2;
end package int_array_pkg;	
	
LIBRARY ieee;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.int_array_pkg.all;

ENTITY hw_image_generator IS
	GENERIC(
	MIN_COUNT : natural := 0;
		MAX_COUNT : natural := 255;

	
	--blue gameboard
	constant gbRed  : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
	constant gbGreen  : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000" ;
	constant gbBlue  : STD_LOGIC_VECTOR(7 DOWNTO 0) := "11111101";
	
	--linen backgound --218,251, 254
	  constant gb2Red:STD_LOGIC_VECTOR(7 DOWNTO 0) := "11111010";
     constant gb2Green:STD_LOGIC_VECTOR(7 DOWNTO 0) := "11110000";
     constant gb2Blue:STD_LOGIC_VECTOR(7 DOWNTO 0) := "11100110";
	
	--red chip
	constant p1Red  : STD_LOGIC_VECTOR(7 DOWNTO 0) := "11111111";
	constant p1Green  : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
	constant p1Blue  : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
	
	--yellow chip
	constant p2Red  : STD_LOGIC_VECTOR(7 DOWNTO 0) := "11111111";
	constant p2Green  : STD_LOGIC_VECTOR(7 DOWNTO 0) := "11111111";
	constant p2Blue  : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
	
	--dark red selector
	constant p1RedSel  : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01111111";
	constant p1GreenSel  : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
	constant p1BlueSel  : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
	
	--dark yellow selector
	constant p2RedSel  : STD_LOGIC_VECTOR(7 DOWNTO 0) := "10111011";
	constant p2GreenSel  : STD_LOGIC_VECTOR(7 DOWNTO 0) := "10111011";
	constant p2BlueSel  : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000"
	
	

	--constant y1 :Integer:= 510;
	--constant	y2 :Integer:= 570
	);   --column that first color will persist until
	PORT(
	reset : in STD_LOGIC;
	   playerturn : IN std_LOGIC;
		sbutton: IN STD_LOGIC;
	   count : STD_LOGIC_VECTOR(5 DOWNTO 0);
		
		
--  	button2 : IN  std_LOGIC;
--		button3 : IN  std_LOGIC;
--		button4 : IN  std_LOGIC;
		disp_ena		:	IN		STD_LOGIC;	--display enable ('1' = display time, '0' = blanking time)
		column		:	IN		INTEGER;		--row pixel coordinate
		row		   :	IN		INTEGER;		--column pixel coordinate
		red			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --red magnitude output to DAC
		green			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --green magnitude output to DAC
		blue			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0') --blue magnitude output to DAC
		
		
		);
END hw_image_generator;

ARCHITECTURE behavior OF hw_image_generator IS

--signal playerturn : STD_LOGIC;
--signal count2 : integer_array;
signal count1 : STD_LOGIC_VECTOR(63 DOWNTO 0):=(OTHERS => '0');
 signal count3 :   count_array;

begin 
	PROCESS(disp_ena, row, column,count,playerturn,sbutton,count3)
	BEGIN

	
	if(reset = '1') theN
	for I in 0 to 7 loop
	for J in 0 to 7 loop
	count3(I,J) <= 0;
	end loop;
	end loop;
	end if;
	
	IF(disp_ena = '1') THEN		--display time		
 
	--if(row < pixels_y AND column < pixels_x)then
		--start switch on
		IF( ((row > (115)) AND (row < (155))) OR ((column > (220)) AND (column < (260)))) THEN
		  --and ((x2-(counter*100) >= row and  x1-(counter*100) <=row) or (y2+(counter*100) >= column and y1+(counter*100) <=column))
	  
				red <= "00000000";
				green	<= "00000000";
				blue <= "11111101";
				
					ELSE			
					
			red <= gb2Red;
			green <= gb2Green;
			blue <= gb2Blue;
			
			
			end if;
				  IF( ((row > 250) AND (row < 290)) or ((column > 460) AND (column < 500))) THEN
		  --and ((x2-(counter*100) >= row and  x1-(counter*100) <=row) or (y2+(counter*100) >= column and y1+(counter*100) <=column))
	  
			red <= "00000000";
				green	<= "00000000";
				blue <= "11111101";
				
			
			end if;
				
				  IF( ((row > 385) AND (row < 425)) or ( (column > 700) AND (column < 740))) THEN
		  --and ((x2-(counter*100) >= row and  x1-(counter*100) <=row) or (y2+(counter*100) >= column and y1+(counter*100) <=column))
	  
		red <= "00000000";
				green	<= "00000000";
				blue <= "11111101";
				
				end if;
				   IF( ((row > 520) AND (row < 560)) or ( (column > (940)) AND (column < 980))) THEN
		  --and ((x2-(counter*100) >= row and  x1-(counter*100) <=row) or (y2+(counter*100) >= column and y1+(counter*100) <=column))
	  
			red <= "00000000";
				green	<= "00000000";
				blue <= "11111101";
				
				end if;
				  IF( ((row > 655) AND (row < 695)) or ( (column > 1180) AND (column < 1220))) THEN
		  --and ((x2-(counter*100) >= row and  x1-(counter*100) <=row) or (y2+(counter*100) >= column and y1+(counter*100) <=column))
	  
			red <= "00000000";
				green	<= "00000000";
				blue <= "11111101";
				
				end if;
				  IF( ((row > 790) AND (row < 830)) or ( (column > 1420) AND (column < 1460))) THEN
		  --and ((x2-(counter*100) >= row and  x1-(counter*100) <=row) or (y2+(counter*100) >= column and y1+(counter*100) <=column))
	  
			red <= "00000000";
				green	<= "00000000";
				blue <= "11111101";
				
				end if;
				   IF( ((row > 925) AND (row < 965)) or ( (column > 1660) AND (column < 1700))) THEN
		  --and ((x2-(counter*100) >= row and  x1-(counter*100) <=row) or (y2+(counter*100) >= column and y1+(counter*100) <=column))
	  
		red <= "00000000";
				green	<= "00000000";
				blue <= "11111101";
end if;
				--draw box
--				  IF( ((row > 20) AND (row < 115)) and ( (column > 20) AND (column < 200))) THEN
--		  --and ((x2-(counter*100) >= row and  x1-(counter*100) <=row) or (y2+(counter*100) >= column and y1+(counter*100) <=column))
--	  
--		red <= (OTHERS => '1');
--				green	<= (OTHERS => '0');
--				blue <= (OTHERS => '0');
--				
--				End if;
				
					--if switch = '0' then
					

--------------------------					
for rowCount in 0 to 7 loop
	for colCount in 0 to 7 loop


	if(((row >(20+(rowCount)*135)) AND (row <  (115+(rowCount)*135))) and ( (column > (35+(colCount)*240)) AND (column < (215+(colCount)*240))))theN
	
	if(count3(rowCount,colCount)=1)then 
red <=p1Red;
blue<= p1Blue;
green<=p1Green;
      
elsif (count3(rowCount,colCount)=2)then

red <=p2Red;
blue<= p2Blue;
green<=p2Green;
	
	else
	red<=gb2Red;
	blue<=gb2Blue;
	green<=gb2Green;
	
	end if;

  if (count = (8*(rowCount))+colCount) then
  	------       
if(((row >(30+(rowCount)*135)) AND (row < (105+(rowCount)*135))) and ( (column > (20+(colCount)*240)) AND (column < (200+(colCount)*240)))) then		
     	 if (sbutton = '1' and playerturn='0') then--start saving
       	  count3(rowCount,colCount) <= 1;
      	
   --
       	  elsif(sbutton = '1' and playerturn='1') then
	          count3(rowCount,colCount)<= 2;
			
           elsif( sbutton='0' and (playerturn='0' or playerturn='1')) then
 			   count3(rowCount,colCount)<=count3(rowCount,colCount);
			
			  else 
			   count3(rowCount,colCount)<=count3(rowCount,colCount);
				
   	        end if;--end saving
				  
     
				 
				 if(playerturn='0') then

              red <= p1RedSel;  
	           green<= p1GreenSel; 
	           blue <= p1BlueSel; 
  
    	         else
	            red<= p2RedSel;  
	             green<= p2GreenSel; 
	            blue <= p2BlueSel;
	 
        	    end if;
end if;--end selector dim
       	 end if;--end count=
  
     end if;--end dim1
	
--case  count3(rowCount, colCount)is
--when 0=>
--
--      red <= gb2Red;  
--	 green <= gb2Green; 
--	 blue <= gb2Blue; 
--
--when 1=> 
--
--red <= p1Red;  
--	 green <= p1Green; 
--	 blue <= p1Blue; 
--when 2=>	
--					
--	red <= p2Red;  
--	 green <= p2Green; 
--	 blue <= p2Blue; 
--	end case; 
	
	
end loop;
end loop;
-----------------	



	
	ELSE 
		red <= (OTHERS => '0');
		green	<= (OTHERS => '0');
		blue <= (OTHERS => '0');
		
  END IF;
	END PROCESS;
END behavior;