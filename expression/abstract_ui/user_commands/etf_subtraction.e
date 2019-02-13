note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_SUBTRACTION
inherit
	ETF_SUBTRACTION_INTERFACE
		redefine subtraction end
create
	make
feature -- command
	subtraction
    	do
			-- perform some update on the model state
			model.subtraction
			model.pretty_print
			etf_cmd_container.on_change.notify ([Current])
    	end

end
