note
	description: "Summary description for {SPORTS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SPORTS

inherit
	CAR
		rename gas as gas_sports , accelerate as accelerate_sports
		redefine gas_sports, accelerate_sports end
create
	make
feature {NONE} -- Initialization

	make (f:INTEGER)
			-- Initialization for `Current'.
		require
			valid_fuel_range: f <= 300 --should be in this range --testing change this pre condition
		do
			fuel:= f
			speedometer:= 0
		end

feature -- Access (fields
	fuel: INTEGER
	speedometer: INTEGER
	speed_limit:INTEGER
	once
		Result:= 300 --speed limit for sports car
	end
	gas_max:INTEGER
	once
		Result:= 15 --speed limit for sedans and compact cars
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

feature {NONE} -- Implementation

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

gas_sports
	do
		fuel:= fuel + 1
		check
			max_fuel_reached: fuel >= 0 OR fuel <= 50
		end
		io.put_string ("Gas!")
		io.put_new_line
	end

accelerate_sports
local
	speed:INTEGER
	current_gas_max:INTEGER
	speed_check: INTEGER
do
	current_gas_max:= current.get_fuel --basicall max fuel fro the creation of the car , must be greater than 15
	check
		--invalid_fuel: current_gas_max > 0
	end
	if current_gas_max > gas_max then
		fuel:= (current.get_fuel - 1) - 2 --specfic to sports cars --ask the prof , confused
		speed:= current.get_speed
		speedometer:= (speed + 1) + 1  --specific to sports cars
		io.put_string ("Faster!")
		io.put_new_line
		io.put_string ("It really feels good!")
		io.put_new_line
		speed_check:= 3 * current.get_fuel - 50 -- i leave it in the hands of the complier
		check
			invalid_speed: speed_check > 0
		end
		io.put_string ("SPEED CHECKING ............")
		io.put_integer (speed_check)
		io.put_new_line
		if speed_check >= speed_limit then
			io.put_string ("Speeding!")
			io.new_line
			--specific to sedan
			fuel:= current.get_fuel - 1 -- extra gas cost of complaining
			io.put_string ("This feels amazing better than having sex!!!!!WOOOOOOOOOHHHH!!!")
			io.new_line
		else
			io.put_string ("Faster!")
			io.put_new_line
			io.put_string ("It really feels good!")
			io.put_new_line
		end
	else
		-- nothing gas_max has to be greater than 15
		io.put_string ("Minimum gas quantity should be greater than 15")
		io.put_new_line
	end
end

brake
do
	fuel := fuel - 1;
	speedometer:= current.get_speed - 1
end

invariant
	invariant_clause: fuel >= 0 OR speedometer >= 0 -- Your invariant here

end
