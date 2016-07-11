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

	make (f:INTEGER; msg: STRING)
			-- Initialization for `Current'.
		require
			valid_fuel_range:f >= 0 OR f <= 50 --should be in this range
		do
			fuel:= f
			message:= msg
		end

feature -- Access (fields
	fuel: INTEGER
	message: STRING

feature -- Status report

 get_fuel:INTEGER
 do
 	Result:= fuel
 end

 get_message:STRING
 do
 	Result:=message
 end
feature -- Status setting

set_fuel(f:INTEGER)
require
	valid_fuel_range:f >= 0 OR f <= 50 --should be in this range
do
	fuel:= f
end

set_message(msg:STRING)

do
	message:= msg
end

feature {NONE} -- Implementation

feature -- Miscellaneous

feature -- Basic operations

gas_sports:STRING
do
	Result:="Increase by ...."
end

 accelerate_sports:STRING
do
	Result:= "accelerating . . . . "
end

invariant
	invariant_clause: True -- Your invariant here

end
