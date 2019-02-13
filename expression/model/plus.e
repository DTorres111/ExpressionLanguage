note
	description: "Summary description for {PLUS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLUS
inherit
	INT_BINARY
redefine
	insert_int,
	solve
	end

create
	make

feature
	make
	do
		create ints_list.make_empty
	end
feature
	insert_int(i:INTEGER)
	do
		ints_list.force(i,ints_list.upper+1)
	end

	solve:INTEGER
	do
		Result:= ints_list.at(0)+ints_list.at(1)
	end
end
