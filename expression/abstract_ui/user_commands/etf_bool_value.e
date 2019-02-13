note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_BOOL_VALUE
inherit
	ETF_BOOL_VALUE_INTERFACE
		redefine bool_value end
create
	make
feature -- command
	bool_value(c: BOOLEAN)
    	do
			-- perform some update on the model state
			model.bool_value (c)
			model.pretty_print
			etf_cmd_container.on_change.notify ([Current])
    	end

end
