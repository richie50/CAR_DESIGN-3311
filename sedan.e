note
	description: "Summary description for {SEDAN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SEDAN
	inherit
		CAR
		rename gas as gas_sedan redefine gas_sedan
		end
create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do
			create output_file.make_open_write("sedan_output.txt")
			gas:= current.car_fuel
			speed:= current.car_speed  --like a static variable
			ensure
					valid_fuel_range:gas >= 0 AND gas <= 50 --should be in this range
		end

feature -- Access (fields)
	gas: INTEGER
	speed:INTEGER
	speed_limit:INTEGER
	once
		Result:= 200 --speed limit for sedans and compact cars
	end
	gas_max:INTEGER
	once
		Result:= 15 --speed limit for sedans and compact cars
	end

feature -- Status report

 get_fuel:INTEGER
 do
 	Result:= gas
 end

 get_speed:INTEGER
 do
 	Result:= speed
 end

feature -- Status setting

feature  -- Implementation
car_fuel:INTEGER
	local
		car_info: CARS_CONSTANTS
	do
		create car_info
		result:= car_info.fuel
	end

car_speed:INTEGER
	local
		car_info: CARS_CONSTANTS
	do
		create car_info
		result:= car_info.speedometer
	end
close_file
do
	output_file.close
end

refill_fuel(f:INTEGER)
require
	refill_range: f > 0 OR f <= 50
do
	gas := gas + f

	ensure
		gas = old gas + f
end

feature -- Basic operations

gas_sedan
	do
		gas:= gas + 1
		io.put_string ("Gas!")
		output_file.put_string ("Gas!%N")
		io.put_new_line
		check
			max_fuel_reached: gas >= 0 OR gas <= 50
		end
	end

accelerate
local
	speed_1:INTEGER
	current_gas_max:INTEGER
	speed_check: INTEGER
do
	current_gas_max:= current.get_fuel --basicall max fuel fro the creation of the car
	if current_gas_max >= gas_max then
		gas:= current.get_fuel - 1
		check
			invalid_fuel: fuel > 0
		end
		speed_1:= current.get_speed
		speed:= speed + 1
		check
			--valid_speed_check: speed >= 0 AND speed >= speed_limit , to make the program execute with no exceptions raised , we left this a comment
		end
		io.put_string ("Faster!")
		output_file.put_string ("Faster!%N")
		io.put_new_line
		speed_check:= (3 * current.get_fuel) - 50
		--debug
			--io.put_string ("SPEED CHECKING ==>")
			--io.put_integer (speed_check)
			--io.put_new_line
		if speed >= speed_check then
			io.put_string ("Speeding!")
			output_file.put_string ("Speeding!%N")
			io.new_line
			--specific to sedan
			gas:= current.get_fuel - 1 -- extra gas cost of complaining
			io.put_string ("Why hurry?")
			output_file.put_string ("Why hurry?%N")
			io.new_line
		else
			io.put_string ("Faster!")
			output_file.put_string ("Faster!%N")
			io.put_new_line
		end
	else
		-- current gas maxless than 15
		io.put_string ("Minimum gas quantity should be greater than 15")
		io.put_new_line
	end
end

brake
do
	gas := gas - 1;
	speed:= current.get_speed - 1
end

feature
	output_file: PLAIN_TEXT_FILE

invariant
	invariant_clause:gas >= 15 OR speed >= 0 -- Your invariant here

end
