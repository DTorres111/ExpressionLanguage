note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_START_OF_SET_ENUMERATION
inherit
	ETF_START_OF_SET_ENUMERATION_INTERFACE
		redefine start_of_set_enumeration end
create
	make
feature -- command
	start_of_set_enumeration
    	do
			-- perform some update on the model state
			model.start_of_set_enumeration
			model.pretty_print
			etf_cmd_container.on_change.notify ([Current])
    	end

end
