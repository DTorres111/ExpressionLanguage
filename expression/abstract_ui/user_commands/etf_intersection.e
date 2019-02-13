note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_INTERSECTION
inherit
	ETF_INTERSECTION_INTERFACE
		redefine intersection end
create
	make
feature -- command
	intersection
    	do
			-- perform some update on the model state
			model.intersection
			model.pretty_print
			etf_cmd_container.on_change.notify ([Current])
    	end

end
