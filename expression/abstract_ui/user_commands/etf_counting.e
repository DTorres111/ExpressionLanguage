note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_COUNTING
inherit
	ETF_COUNTING_INTERFACE
		redefine counting end
create
	make
feature -- command
	counting
    	do
			-- perform some update on the model state
			model.counting
			model.pretty_print
			etf_cmd_container.on_change.notify ([Current])
    	end

end
