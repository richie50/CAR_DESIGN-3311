note
	description: "Summary description for {COMPACT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COMPACT
	inherit
		ANY
		CAR
			rename gas as gas_compact , accelerate as accelerate_compact
			redefine gas_compact, accelerate_compact end
create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do
			create output_file.make_open_write ("compact_output.txt") -- test output file
			gas:= current.car_fuel
			speed:= current.car_speed
			ensure
			valid_fuel_range:gas >= 15 AND gas <= 50 --should be in this range
		end

feature -- Access (fields
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

feature -- Status setting

get_speed:INTEGER
do
	Result:= speed
end

feature -- Implementation
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

feature -- Miscellaneous
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

gas_compact
	do
		gas:= gas + 1
		check
			max_fuel_reached: gas >= 0 OR gas <= 50
		end
		io.put_string ("Gas!")
		output_file.put_string ("Gas!%N")
		io.put_new_line
		io.put_string ("Well, I have to work hard again")
		output_file.put_string("Well, I have to work hard again%N")
		io.put_new_line
	end

accelerate_compact
local
	speed_1:INTEGER
	current_gas_max:INTEGER
	speed_check: INTEGER -- formula for determining overspeeding
do
	current_gas_max:= current.get_fuel --basically max fuel fro the creation of the car
	if current_gas_max >= gas_max then
		gas:= current.get_fuel - 1
		check
			invalid_fuel: fuel > 0
		end
		speed_1:= current.get_speed
		speed := speed + 1
		io.put_string ("Faster!")
		output_file.put_string ("Faster!%N")
		io.put_new_line
		speed_check:= (3 * current.get_fuel) - 50 -- i leave it in the hands of the complier
		check
			--valid_speed_check: speed >= 0 AND speed_check >= speed_limit
		end
		io.put_string ("SPEED CHECKING ==>")
		io.put_integer (speed_check)
		io.put_new_line
		if speed >= speed_check then
			io.put_string ("Speeding!")
			output_file.put_string ("Speeding%N")
			io.new_line
		else
			io.put_string ("Faster!")
			output_file.put_string ("Faster!%N")
			io.put_new_line
		end
	else
		--less than 15
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
	invariant_clause:gas >= 15 OR speed >= 0-- Your invariant here

end
