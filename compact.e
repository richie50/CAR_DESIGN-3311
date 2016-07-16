note
	description: "Summary description for {COMPACT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COMPACT
	inherit
		CAR
			rename gas as gas_compact , accelerate as accelerate_compact
			redefine gas_compact, accelerate_compact end
create
	make

feature {NONE} -- Initialization

feature {NONE} -- Initialization

	make (f:INTEGER)
			-- Initialization for `Current'.
		require
			valid_fuel_range:f >= 0 OR f <= 50 --should be in this range
		do
			fuel:= f
			speedometer:= 0
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

feature -- Status setting

set_fuel(f:INTEGER)
require
	valid_fuel_range:f >= 0 OR f <= 50 --should be in this range
do
	fuel:= f
end

get_speed:INTEGER
do
	Result:= speedometer
end

feature {NONE} -- Implementation

feature -- Miscellaneous

feature -- Basic operations

gas_compact
	do
		fuel:= fuel + 1
		check
			max_fuel_reached: fuel >= 0 OR fuel <= 50
		end
		io.put_string ("Gas!")
		io.put_new_line
		io.put_string ("Well, I have to work hard again")
		io.put_new_line
	end

accelerate_compact

local
	speed:INTEGER
	current_gas_max:INTEGER
	speed_check: INTEGER
do
	current_gas_max:= current.get_fuel --basically max fuel fro the creation of the car
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
