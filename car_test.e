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
		--add_boolean_case(agent t2)
		--add_boolean_case(agent t3)
		--add_violation_case(agent v1)
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
			create sedan.make
			--give it liltle bit more gas
			n:= sedan.get_fuel
			io.put_integer (n)
			io.put_new_line
			from i:= 0
				until i >  50
				loop
					i:= i + 1
					sedan.gas_sedan
				end
				from i:= 0
					until i >  100
					loop
					sedan.accelerate
					i:= i + 1
					sedan.gas_sedan
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
				create sedan.make
				sedan.gas_sedan
				from i:= 0
					until i >  35
					loop
						sedan.gas_sedan
						i:= i + 1
					end
				n:= sedan.get_fuel
				io.put_string ("Curent gas .....  ")
				io.put_integer (n)
				io.put_new_line
				from i:= 0
					until i > 65
					loop
						sedan.accelerate
						sedan.gas_sedan
						sedan.accelerate
						sedan.gas_sedan
						sedan.accelerate
						sedan.gas_sedan
						sedan.gas_sedan
						sedan.gas_sedan
						i:= i + 1
					end
				sedan.brake
				io.put_string ("SEDAN CAR FUEL AND SPEED INFO.....")
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
					create compact.make
					compact.gas_compact
					compact.brake
					from i:= 0
						until i >  35
							loop
								compact.gas_compact
								i:= i + 1
							end

								from i:= 0
									until i >  100
										loop
											compact.accelerate_compact
											compact.gas_compact
											i:= i + 1
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
						create sports.make
						sports.accelerate_sports
						n:= sports.get_fuel
						from i:= 0
							until i >  35
								loop
									sports.gas_sports
									i:= i + 1
								end
									from i:= 0
										until i >  100
										loop
											sports.accelerate_sports
											sports.gas_sports
											sports.gas_sports
											sports.gas_sports
											i:= i + 1
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
