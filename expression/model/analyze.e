note
	description: "Summary description for {ANALYZE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ANALYZE


create
	make

feature -- constructor
	make
	do

	end


feature --checkers
checkNB(left,right:STRING): BOOLEAN
do
	left.right_adjust
	right.left_adjust
	if left.is_integer and right.is_integer then
		Result := true
		else
		Result:= false
	end
end

checkNU(express: ARRAY[STRING]; position: INTEGER) : BOOLEAN
local
bool_occured : BOOLEAN
do
bool_occured := FALSE
	across (position) |..| (express.count-1) as i loop
		--if express.at (i.item).is_integer or express.at (i.item) /= ", " or express.at (i.item) /= "} " or express.at (i.item) /= "" then
		if express.at (i.item).is_boolean then
			bool_occured:= true
		end
	end
	if bool_occured then
		result := false
		else
		result:= true
	end

end

checkLB(left,right:STRING) : BOOLEAN
do
 if left.is_boolean and right.is_boolean then
 	Result:= true
 	else
 	Result:= false
 end
end

checkLU(express: ARRAY[STRING]; position: INTEGER) : BOOLEAN
local
	int_occured: BOOLEAN
do
	int_occured:= false
	across (position) |..| (express.count-1) as i loop
		if express.at (i.item).is_integer then
			int_occured:= true
		end
	end
	if int_occured then
		result:= false
		else
		result:= true
	end
end



end
