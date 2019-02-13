note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_EXCLUSIVE_OR
inherit
	ETF_EXCLUSIVE_OR_INTERFACE
		redefine exclusive_or end
create
	make
feature -- command
	exclusive_or
    	do
			-- perform some update on the model state
			model.excluive_or
			model.pretty_print
			etf_cmd_container.on_change.notify ([Current])
    	end

end
