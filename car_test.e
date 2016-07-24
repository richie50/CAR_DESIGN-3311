note
	description: "Summary description for {CAR_TEST}."
	author: "RICHMOND FRIMPONG , SYED RAHMAN"
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
	end

feature -- tests	
	-- Run application.
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
					until i > 400
						loop
							sedan.accelerate
							sedan.accelerate
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
				comment("SEDAN CAR TEST")
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
									until i >  400
										loop
											compact.accelerate_compact
											compact.accelerate_compact
											compact.accelerate_compact
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
					comment("COMPACT CAR TEST")
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
						from i:= 0
							until i >  50
								loop
									sports.gas_sports
									i:= i + 1
								end
									from i:= 0
										until i > 530
										loop
											sports.accelerate_sports
											sports.gas_sports
											sports.gas_sports
											--sports.brake
											i:= i + 1
										end
						sports.close_file
						io.put_string ("SPORTS CAR SPEED AND FUEL INFO.....")
						io.put_integer (sports.get_speed)
						io.put_new_line
						io.put_integer (sports.get_fuel)
						io.put_new_line
						comment("SPORTS CAR TEST")
						Result:= sports.get_fuel >= 15 AND sports.get_speed >= 0
					end

end
