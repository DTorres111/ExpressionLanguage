note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_DIFFERENCE
inherit
	ETF_DIFFERENCE_INTERFACE
		redefine difference end
create
	make
feature -- command
	difference
    	do
			-- perform some update on the model state
			model.difference
			model.pretty_print
			etf_cmd_container.on_change.notify ([Current])
    	end

end
