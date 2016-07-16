note
	description: "Summary description for {SEDAN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SEDAN
	inherit
		CAR

create
	make

feature {NONE} -- Initialization

	make (f:INTEGER)
			-- Initialization for `Current'.
		require
			valid_fuel_range: f <= 50 --should be in this range
		do
			fuel:= f
			speedometer:= 0  --like a static variable
		end

feature -- Access (fields
	fuel: INTEGER
	speedometer:INTEGER
	speed_limit:INTEGER
	once
		Result:= 200 --speed limit for sedans and compact cars
	end
	gas_max:INTEGER
	once
		Result:= 50 --speed limit for sedans and compact cars
	end

feature -- Status report

 get_fuel:INTEGER
 do
 	Result:= fuel
 end

 get_speed:INTEGER
 do
 	Result:= speedometer
 end

feature -- Status setting

set_fuel(f:INTEGER)
require
	valid_fuel_range:f >= 0 OR f <= 50 --should be in this range
do
	fuel:= f
end

feature -- Miscellaneous
refill_fuel(f:INTEGER)
require
	refill_range: f > 0 OR f <= 50
do
	fuel := fuel + f

	ensure
		fuel = old fuel + f
end

feature -- Basic operations

gas
	do
		fuel:= fuel + 1
		check
			max_fuel_reached: fuel >= 0 OR fuel <= 50
		end
		io.put_string ("Gas!")
		io.put_new_line
	end

accelerate
local
	speed:INTEGER
	current_gas_max:INTEGER
	speed_check: INTEGER
do
	current_gas_max:= current.get_fuel --basicall max fuel fro the creation of the car
	fuel:= current.get_fuel - 1
	check
		invalid_fuel: fuel > 0
	end
	speed:= current.get_speed
	speedometer:= speed + 1

	if fuel > gas_max then
		speed_check:= (3 * current_gas_max) - 50 -- i leave it in the hands of the complier
		check
			invalid_speed: speed_check > 0
		end
		io.put_string ("SPEED CHECKING ==>")
		io.put_integer (speed_check)
		io.put_new_line
		if speed_check >= speed_limit then
			io.put_string ("Speeding!")
			io.new_line
			--specific to sedan
			fuel:= current.get_fuel - 1 -- extra gas cost of complaining
			io.put_string ("Why hurry?")
			io.new_line
		else
			io.put_string ("Faster!")
			io.put_new_line
		end
	else
		io.put_string ("Faster!")
		io.put_new_line
	end
end

brake
do
	fuel := fuel - 1;
	speedometer:= current.get_speed - 1
end

invariant
	invariant_clause: True -- Your invariant here

end
