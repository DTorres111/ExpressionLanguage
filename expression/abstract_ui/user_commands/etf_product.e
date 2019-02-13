note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_PRODUCT
inherit
	ETF_PRODUCT_INTERFACE
		redefine product end
create
	make
feature -- command
	product
    	do
			-- perform some update on the model state
			model.product
			model.pretty_print
			etf_cmd_container.on_change.notify ([Current])
    	end

end
