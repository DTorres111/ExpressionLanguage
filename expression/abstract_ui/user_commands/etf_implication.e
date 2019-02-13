note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_IMPLICATION
inherit
	ETF_IMPLICATION_INTERFACE
		redefine implication end
create
	make
feature -- command
	implication
    	do
			-- perform some update on the model state
			model.implication
			model.pretty_print
			etf_cmd_container.on_change.notify ([Current])
    	end

end
