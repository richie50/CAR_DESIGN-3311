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
 	Result:= message
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

gas_compact:STRING
do
	Result:="Increase by ...."
end

accelerate_compact:STRING
do
	Result:= "accelerating . . . . "
end

invariant
	invariant_clause: True -- Your invariant here

end
