note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADDITION
inherit
	ETF_ADDITION_INTERFACE
		redefine addition end
create
	make
feature -- command
	addition
    	do
			-- perform some update on the model state
			model.addition
			model.pretty_print
			etf_cmd_container.on_change.notify ([Current])
    	end

end
