note
	description: "CAR_DESIGN application root class"
	date: "$Date$"
	revision: "$Revision$"


class
	APPLICATION inherit ES_SUITE

create
	make

feature {NONE} -- Initialization

	make
			-- Run tests
		do
			add_test (create {CAR_TEST}.make)
			show_errors
			--show_browser
			run_espec
		end


end

