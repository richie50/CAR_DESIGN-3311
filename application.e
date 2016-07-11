note
	description: "CAR_DESIGN application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
			local
				sedan: SEDAN
				sports: SPORTS
				compact: COMPACT
				temp:STRING
		do
			--| Add your code here
			print ("Hello Eiffel World!%N")
			create sedan.make (0, "lets get this");
			temp:=  sedan.accelerate
			create sports.make (0, "BRUH")
			io.put_string (temp)
			io.put_new_line
			temp:=  sedan.gas
			io.put_string (temp)
			io.put_new_line


		end

end
