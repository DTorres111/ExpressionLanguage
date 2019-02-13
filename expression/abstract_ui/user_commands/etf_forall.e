note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_FORALL
inherit
	ETF_FORALL_INTERFACE
		redefine forall end
create
	make
feature -- command
	forall
    	do
			-- perform some update on the model state
			model.forall
			model.pretty_print
			etf_cmd_container.on_change.notify ([Current])
    	end

end
