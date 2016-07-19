note
	description: "Summary description for {CAR_TEST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CAR_TEST
	inherit
		ES_TEST
	create
	make
--$ISE_PRECOMP
feature
	make
	do
		create output_file.make_open_write ("output.txt") -- test output file
		add_boolean_case(agent t1)
		add_boolean_case(agent t2)
		add_boolean_case(agent t3)
		add_violation_case(agent v1)
	end

feature -- tests	
	-- Run application.
	v1
			local
				sedan: SEDAN
				sports: SPORTS
				compact: COMPACT
				i:INTEGER
				n:INTEGER
		do
			--| Add your code here
			create sedan.make (100)
			--give it liltle bit more gas
			n:= sedan.get_fuel
			from i:= 0
				until i >  n
				loop
					sedan.accelerate
					i:= i + 1
					sedan.gas
				end

		end

		t1:BOOLEAN
				local
					sedan: SEDAN
					sports: SPORTS
					compact: COMPACT
					i:INTEGER
					n:INTEGER
			do
				--| Add your code here
				print ("Hello Eiffel World!%N")
				create sedan.make (49)
				sedan.gas
				n:= sedan.get_fuel
				sedan.brake
				from i:= 0
					until i >  n
					loop
						sedan.accelerate
						i:= i + 1
						--sedan.refill_fuel (i)
						sedan.gas
					end
				io.put_string ("SEDAN CAR SPEED AND FUEL INFO.....")
				io.put_new_line
				io.put_integer (sedan.get_fuel)
				io.put_new_line
				io.put_integer (sedan.get_speed)
				io.put_new_line
				Result:= true
			end

		t2:BOOLEAN
					local
						sedan: SEDAN
						sports: SPORTS
						compact: COMPACT
						i:INTEGER
						n:INTEGER
				do
					--| Add your code here
					print ("Hello Eiffel World!%N")
					create compact.make (49)
					compact.gas_compact
					n:= compact.get_fuel
					compact.brake
					from i:= 0
						until i >  n
						loop
							compact.accelerate_compact
							i:= i + 1
							--sedan.refill_fuel (i)
							compact.gas_compact
						end
					io.put_string ("COMPACT CAR SPEED AND FUEL INFO.....")
					io.put_new_line
					io.put_integer (compact.get_fuel)
					io.put_new_line
					io.put_integer (compact.get_speed)
					io.put_new_line
					Result:= true
				end
		t3:BOOLEAN
						local
							sedan: SEDAN
							sports: SPORTS
							compact: COMPACT
							i:INTEGER
							n:INTEGER
					do
						--| Add your code here
						print ("Hello Eiffel World!%N")
						create sports.make (299)
						sports.accelerate_sports
						n:= sports.get_fuel
						sports.brake
						from i:= 0
							until i >  n
							loop
								sports.accelerate_sports
								i:= i + 1
								--sedan.refill_fuel (i)
								sports.gas_sports
								sports.gas_sports
								sports.gas_sports
								sports.gas_sports
							end
						io.put_string ("SPORTS CAR SPEED AND FUEL INFO.....")
						io.put_new_line
						output_file.put (sports.get_fuel.to_character_8)
						io.put_new_line
						output_file.put (sports.get_speed.to_character_8)
						io.put_new_line
						output_file.close
						Result:= true
					end
feature
	output_file: PLAIN_TEXT_FILE

end
