note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MULTIPLICATION
inherit
	ETF_MULTIPLICATION_INTERFACE
		redefine multiplication end
create
	make
feature -- command
	multiplication
    	do
			-- perform some update on the model state
			model.multiplication
			model.pretty_print
			etf_cmd_container.on_change.notify ([Current])
    	end

end
