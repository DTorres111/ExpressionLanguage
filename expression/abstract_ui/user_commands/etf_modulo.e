note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MODULO
inherit
	ETF_MODULO_INTERFACE
		redefine modulo end
create
	make
feature -- command
	modulo
    	do
			-- perform some update on the model state
			model.modulo
			model.pretty_print
			etf_cmd_container.on_change.notify ([Current])
    	end

end
