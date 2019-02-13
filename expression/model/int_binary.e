note
	description: "Summary description for {INT_BINARY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	INT_BINARY
inherit
	BINARY


feature
	ints_list:ARRAY[INTEGER]
feature
	insert_int(i:INTEGER)
	deferred
	end

	solve:INTEGER
	deferred
	end

end
