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

	make
			-- Initialization for `Current'.
		do
			create car_info
			gas:= car_info.fuel
			speed:= car_info.speedometer
			ensure
					valid_fuel_range: gas <= 300 --should be in this range --testing change this pre condition
		end

feature -- Access (fields
	gas: INTEGER
	speed: INTEGER
	car_info:CARS_CONSTANTS
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
 	Result:= gas
 end

get_speed:INTEGER
do
	Result:= speed
end

feature -- Status setting

feature {NONE} -- Implementation

feature -- Miscellaneous
refill_fuel(f:INTEGER)
require
	refill_range: f > 0 OR f <= 50
do
	gas := gas + f

	ensure
		gas = old gas + f
end
feature -- Basic operations

gas_sports
	do
		gas:= gas + 1
		check
			max_fuel_reached: gas >= 0 OR gas <= 50
		end
		io.put_string ("Gas!")
		io.put_new_line
	end

accelerate_sports
local
	speed_1:INTEGER
	current_gas_max:INTEGER
	speed_check: INTEGER
do
	current_gas_max:= current.get_fuel --basicall max fuel fro the creation of the car , must be greater than 15
	check
		--invalid_fuel: current_gas_max > 0
	end
	if current_gas_max >= gas_max then
		gas:= (current.get_fuel - 1) - 2 --specfic to sports cars --ask the prof , confused
		speed_1:= current.get_speed
		speed:= (speed_1 + 1) + 1  --specific to sports cars
		io.put_string ("Faster!")
		io.put_new_line
		io.put_string ("It really feels good!")
		io.put_new_line
		speed_check:= 3 * current.get_fuel - 50 -- i leave it in the hands of the complier
		check
			--invalid_speed: speed_check > 0
		end
		io.put_string ("SPEED CHECKING ............")
		io.put_integer (speed_check)
		io.put_new_line
		if speed_check >= speed_limit then
			io.put_string ("Speeding!")
			io.new_line
			--specific to sedan
			gas:= current.get_fuel - 1 -- extra gas cost of complaining
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
	gas := gas - 1;
	speed:= current.get_speed - 1
end

invariant
	invariant_clause: gas >= 0 OR speed >= 0 -- Your invariant here

end
