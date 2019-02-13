note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_INT_VALUE
inherit
	ETF_INT_VALUE_INTERFACE
		redefine int_value end
create
	make
feature -- command
	int_value(c: INTEGER_64)
    	do
			-- perform some update on the model state
			model.int_value (c.as_integer_32)
			model.pretty_print
			etf_cmd_container.on_change.notify ([Current])
    	end

end
