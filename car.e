note
	description: "Summary description for {CAR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	CAR inherit
	CARS_CONSTANTS

feature {ANY}

 gas
 	deferred
end

 accelerate
 	deferred
end

brake
	deferred
end

feature
	car_fuel:INTEGER
	deferred
	end
	car_speed:INTEGER
	deferred
	end
end
