note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_LOGICAL_NEGATION
inherit
	ETF_LOGICAL_NEGATION_INTERFACE
		redefine logical_negation end
create
	make
feature -- command
	logical_negation
    	do
			-- perform some update on the model state
			model.logical_negation
			model.pretty_print
			etf_cmd_container.on_change.notify ([Current])
    	end

end
