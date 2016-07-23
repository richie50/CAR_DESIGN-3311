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
		add_boolean_case(agent t1)
		add_boolean_case(agent t2)
		add_boolean_case(agent t3)
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
						sedan.brake
						i:= i + 1
					end
				sedan.close_file
				io.put_string ("SEDAN CAR FUEL AND SPEED INFO.....")
				io.put_new_line
				io.put_integer (sedan.get_fuel)
				io.put_new_line
				io.put_integer (sedan.get_speed)
				io.put_new_line
				Result:= sedan.get_fuel >= 0 AND sedan.get_speed >= 0
			end

		t2:BOOLEAN
					local
						compact: COMPACT
						i:INTEGER
						n:INTEGER
				do
					--| Add your code here
					print ("Hello Eiffel World!%N")
					create compact.make
					compact.gas_compact
					from i:= 0
						until i >  35
							loop
								compact.gas_compact
								i:= i + 1
							end

								from i:= 0
									until i >  50
										loop
											compact.accelerate_compact
											compact.accelerate_compact
											compact.accelerate_compact
											compact.gas_compact
											compact.gas_compact
											compact.gas_compact
											compact.gas_compact
											compact.gas_compact
											compact.brake
											i:= i + 1
										end
					compact.close_file
					io.put_string ("COMPACT CAR SPEED AND FUEL INFO.....")
					io.put_new_line
					io.put_integer (compact.get_fuel)
					io.put_new_line
					io.put_integer (compact.get_speed)
					io.put_new_line
					Result:= compact.get_fuel >= 15 AND compact.get_speed >= 0
				end
		t3:BOOLEAN
						local
							sports: SPORTS
							i:INTEGER
							n:INTEGER
					do
						--| Add your code here
						create sports.make
						n:= sports.get_fuel
						from i:= 0
							until i >  35
								loop
									sports.gas_sports
									i:= i + 1
								end
									from i:= 0
										until i >  300
										loop
											sports.accelerate_sports
											sports.accelerate_sports
											sports.accelerate_sports
											sports.gas_sports
											sports.gas_sports
											sports.gas_sports
											sports.accelerate_sports
											sports.accelerate_sports
											sports.gas_sports
											sports.gas_sports
											sports.gas_sports
											sports.accelerate_sports
											sports.accelerate_sports
											sports.accelerate_sports
											sports.accelerate_sports
											sports.brake
											i:= i + 1
										end
						sports.close_file
						io.put_string ("SPORTS CAR SPEED AND FUEL INFO.....")
						io.put_integer (sports.get_speed)
						io.put_new_line
						io.put_integer (sports.get_fuel)
						io.put_new_line
						Result:= sports.get_fuel >= 15 AND sports.get_speed >= 0
					end

end
