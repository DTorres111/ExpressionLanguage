note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ANALYZE
inherit
	ETF_ANALYZE_INTERFACE
		redefine analyze end
create
	make
feature -- command
	analyze
    	do
			-- perform some update on the model state
			model.analyzer
			model.pretty_print
			etf_cmd_container.on_change.notify ([Current])
    	end

end
