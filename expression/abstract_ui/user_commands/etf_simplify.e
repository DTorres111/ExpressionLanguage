note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_SIMPLIFY
inherit
	ETF_SIMPLIFY_INTERFACE
		redefine simplify end
create
	make
feature -- command
	simplify
    	do
			-- perform some update on the model state
			model.simplify
			model.pretty_print
			etf_cmd_container.on_change.notify ([Current])
    	end

end
