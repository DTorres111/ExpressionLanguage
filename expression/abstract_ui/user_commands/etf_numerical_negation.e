note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_NUMERICAL_NEGATION
inherit
	ETF_NUMERICAL_NEGATION_INTERFACE
		redefine numerical_negation end
create
	make
feature -- command
	numerical_negation
    	do
			-- perform some update on the model state
			model.numerical_negation
			model.pretty_print
			etf_cmd_container.on_change.notify ([Current])
    	end

end
