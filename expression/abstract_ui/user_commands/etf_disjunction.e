note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_DISJUNCTION
inherit
	ETF_DISJUNCTION_INTERFACE
		redefine disjunction end
create
	make
feature -- command
	disjunction
    	do
			-- perform some update on the model state
			model.disjunction
			model.pretty_print
			etf_cmd_container.on_change.notify ([Current])
    	end

end
