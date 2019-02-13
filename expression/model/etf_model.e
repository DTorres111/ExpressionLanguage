note
	description: "A default business model."
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MODEL

inherit
	ANY
		redefine
			out
		end

create {ETF_MODEL_ACCESS}
	make

feature {NONE} -- Initialization
	make
			-- Initialization for `Current'.
		do

			report:="Expression is initialized."
			expression:="?"
			create specified.make_empty
			specified.force ("?",specified.upper)
			set_active:=False
			end_of_expression:=False
			create exp_list.make_empty
			type_correct:=True


			create numerical_binary.make_empty
			numerical_binary := <<" + ", " - ", " * ", " / ", " mod ", " > ", " < ">>

			create numerical_unary.make_empty
			numerical_unary := <<"- ", "+ ", "* " >>

			create logical_binary.make_empty
			logical_binary := <<" && ", " || ", " xor" >>

			create logical_unary.make_empty
			logical_unary := <<"! ", "&& ", "|| ", "# ">>

			create type_checker.make
			numerical_binary.compare_objects
			numerical_unary.compare_objects
			logical_binary.compare_objects
			logical_unary.compare_objects
			specified.compare_objects
		end

feature -- model attributes

	specified:ARRAY[STRING]
	report:STRING
	expression:STRING
	set_active:BOOLEAN
	end_of_expression:BOOLEAN
	exp_list:ARRAY[EXPRESSION]
	type_correct:BOOLEAN

	numerical_binary : ARRAY[STRING]
	numerical_unary : ARRAY[STRING]
	logical_binary : ARRAY[STRING]
	logical_unary : ARRAY[STRING]

	type_checker : ANALYZE

feature -- model operations
	default_update
			-- Perform update to the model state.
		do

		end

	reset
			-- Reset model state.
		do
			make
		end


	restart
		do
			create specified.make_empty
			specified.force ("?",specified.upper)
			report:="OK."
		end
--------------------------------------------------------------
	int_value(i:INTEGER)
		local
			nil_count:INTEGER
			first_cursor:INTEGER
			first_nil : INTEGER
		do

--		if(type_correct) then
--			check attached {INT_BINARY} exp_list.at (exp_list.upper) as final then
--				 final.insert_int(i)
--				end

--			end

			nil_count:=0
			first_nil :=0
		--	first_cursor:=current_cursor
		--	specified.force (i.out, current_cursor)

			--case {?}
			if (specified.at (current_cursor+1)~"}") then

				if(set_active)then
				move_by_two end

				first_cursor:=current_cursor
				specified.force (i.out, first_cursor)

				if(set_active)then

					specified.force (", ", first_cursor+1)
					specified.force ("?", first_cursor+2)

				end


			--case {(1+?)}	or (1+?)
			elseif ((specified.at (current_cursor+1)~")") and set_active) then --(specified.at (current_cursor+2)~"}")

				if(set_active)then
				move_by_two end

				specified.force (")", current_cursor+1)
				first_cursor:=current_cursor
				specified.force (i.out, first_cursor)

				if(set_active)then

					specified.force (", ", first_cursor+2)
					specified.force ("?", first_cursor+3)

				 end

			--case (?+nil) or {(?+nil)}
			else
				specified.force (i.out, current_cursor)
				across 0|..| (specified.count-1) as j loop

						if(specified.at (j.item)~"nil" and nil_count=0)then
						first_nil:=j.item
						nil_count:=nil_count+1
						end
				end
				if nil_count>0 then
					specified.force ("?", first_nil)
					nil_count:=0
				end
			end

			--replace next nil with ?
--			across 0|..| (specified.count-1) as k loop

--				if (specified.at (k.item)~"nil" and nil_count=0 and set_active = false) then
--					specified.force("?", k.item)
--					nil_count:=1
--				end
--			end

		end_of_expression:= across 0|..| (specified.count-1) as j all specified.at (j.item)/~"?" end
		end
-----------------------------------------------------

	bool_value(b:BOOLEAN)
		local
			nil_count:INTEGER
			first_cursor:INTEGER
		do
			nil_count:=0

		--	first_cursor:=current_cursor
		--	specified.force (i.out, current_cursor)

			--case {?}
			if (specified.at (current_cursor+1)~"}") then

				if(set_active)then
				move_by_two end

				first_cursor:=current_cursor
				specified.force (b.out, first_cursor)

				if(set_active)then

					specified.force (", ", first_cursor+1)
					specified.force ("?", first_cursor+2)

				end


			--case {(1+?)}
			elseif ((specified.at (current_cursor+1)~")") and set_active) then

				if(set_active)then
				move_by_two end

				specified.force (")", current_cursor+1)
				first_cursor:=current_cursor
				specified.force (b.out, first_cursor)

				if(set_active)then

					specified.force (", ", first_cursor+2)
					specified.force ("?", first_cursor+3)

				 end

			--case (?+nil) or {(?+nil)}
			else
				specified.force (b.out, current_cursor)

			end

			--replace next nil with ?
			across 0|..| (specified.count-1) as k loop

				if (specified.at (k.item)~"nil" and nil_count=0 and set_active = false) then
					specified.force("?", k.item)
					nil_count:=nil_count+1
				end
			end

		end_of_expression:= across 0|..| (specified.count-1) as j all specified.at (j.item)/~"?" end
		end
		------
-----------------------------------------------
	start_of_set_enumeration
	local
	do
		move_by_one
		move_by_one
		move_cursor_by_one

		specified.force ("{", current_cursor-1)
		specified.force ("}", current_cursor+1)
		set_active:=True

	end

	end_of_set_enumeration
	local
		first_nil:INTEGER
		nil_count:INTEGER
	do
		set_active:=False
		nil_count:=0

	if(across 0|..| (specified.count-1) as p some (specified.at(p.item)~"?" and specified.at (p.item-1)~", ") end)then



		across 0|..| (specified.count-1) as i loop

			if(specified.at (i.item)~"nil" and nil_count=0)then
			first_nil:=i.item
			nil_count:=nil_count+1
			end
		end

		--if(across 0|..| (specified.count-1) as i some specified.at (i.item)~"nil" end)then
		if nil_count>0 then

			move_back_by_two
			specified.force ("?", first_nil-2)
		else
			move_back_by_two
		--	specified.force ("", current_cursor)
		end


		end_of_expression:= across 0|..| (specified.count-1) as j all specified.at (j.item)/~"?" end

		end

	end
---------------------------------------------------
feature --binary ops

	binary_op(s:STRING)
	do
		if specified.count=1 then
					move_by_one
					move_cursor_by_one

					specified.force ("(", current_cursor-1)
					specified.force (s, specified.upper+1)
					specified.force ("nil", specified.upper+1)
					specified.force (")", specified.upper+1)

				else
					move_by_two
					move_by_two
					move_cursor_by_one

					specified.force ("(", current_cursor-1)
					specified.force (s, current_cursor+1)
					specified.force ("nil", current_cursor+2)
					specified.force (")",current_cursor+3)
				end

				report:="OK."

	end

	addition
	local
		plus:PLUS
		do
			create plus.make

			exp_list.force(plus,exp_list.upper+1)

			binary_op(" + ")
		end

	subtraction
		do
			binary_op(" - ")
		end

	multiplication
		do
			binary_op(" * ")
		end

	quotient
		do
			binary_op(" / ")
		end

	modulo
		do
			binary_op(" mod ")
		end

	excluive_or
		do
			binary_op(" xor ")
		end

	implication
		do
			binary_op(" => ")
		end

	equals
		do
			binary_op(" = ")
		end

	greater_than
		do
			binary_op(" > ")
		end

	less_than
		do
			binary_op(" < ")
		end


	union
		do
			binary_op(" \/ ")
		end

	intersection
		do
			binary_op(" /\ ")
		end

	difference
		do
			binary_op(" \ ")
		end

	conjunction
		do
			binary_op(" && ")
		end

	disjunction
		do
			binary_op(" || ")
		end

feature --unary ops

	unary_op(s:STRING)
	do
		if specified.count =1 then
				move_by_one
				move_cursor_by_one
				move_cursor_by_one

				specified.force ("(", current_cursor-2)
				specified.force (s, current_cursor-1)
				specified.force (")", current_cursor+1)
				else
					move_by_two
					move_by_one
					move_cursor_by_one
					move_cursor_by_one

				specified.force ("(", current_cursor - 2)
				specified.force (s, current_cursor - 1)
				specified.force (")", current_cursor + 1)
			end
			report:="OK."
	end


	numerical_negation
	do
		unary_op("- ")
	end

	logical_negation
	do
		unary_op("! ")
	end

	sigma
	do
		unary_op("+ ")
	end

	product
	do
		unary_op("* ")
	end

	counting
	do
		unary_op("# ")
	end

	forall
	do
		unary_op("&& ")
	end

	exists
	do
		unary_op("|| ")
	end

feature -- the 3 operations
	pretty_print
		do

			expression.make_empty

			across 0 |..| (specified.count-1) as i loop
				expression.append(specified.at (i.item))

			end

		end

	simplify
		local
			simp:SIMPLIFY
		do
			create simp.make

			report:=simp.simplify (specified)

		end

	analyzer
	do

		across 0 |..| (specified.count-1) as j loop
		if (numerical_binary.has (specified.at (j.item).string) and specified.at (j.item+1) /~ "{") then
			type_correct := type_checker.checkNB(specified.at (j.item-2), (specified.at (j.item+1)) )
		end

		if (numerical_unary.has (specified.at (j.item).string) and specified.at (j.item+1) ~ "{") then
			type_correct := type_checker.checkNU(specified, (j.item+2))
		end

		if (logical_binary.has (specified.at (j.item).string) and specified.at (j.item+1) /~ "{") then
			type_correct := type_checker.checkLB(specified.at (j.item-2), (specified.at (j.item+1)) )
		end

		if (logical_unary.has (specified.at (j.item).string) and specified.at (j.item+1) ~ "{") then
			type_correct := type_checker.checkLU(specified, (j.item+2))
		end

		if specified.at (j.item) ~ "- " and specified.at (j.item +1).is_boolean then
			type_correct:= false
		end
		end
		if type_correct then
			Report:= expression + " is type-correct."
			else
			Report:= expression + " is not-type correct."
		end

	end

feature -- needed queries
	move_by_two
	local
		temp:ARRAY[STRING]
	do
		create temp.make_filled ("", 0, specified.count+1)
		across 0|..| current_cursor  as i loop
			 temp.force (specified.at (i.item), i.item)
			end


		across (current_cursor+1)|..| (specified.count-1) as j loop

			temp.force (specified.at (j.item), j.item+2)
			end

		specified:=temp
	end

	move_by_one
	local
		temp:ARRAY[STRING]
	do
		create temp.make_filled ("", 0, specified.count+1)
		across 0|..| current_cursor  as i loop
			 temp.force (specified.at (i.item), i.item)
			end


		across (current_cursor+1)|..| (specified.count-1) as j loop

			temp.force (specified.at (j.item), j.item+1)
			end

		specified:=temp
	end

	move_back_by_two
	local
		temp:ARRAY[STRING]
	do
		create temp.make_filled ("", 0, specified.count+1)
		across 0|..| current_cursor  as i loop
			 temp.force (specified.at (i.item), i.item)
			end


		across (current_cursor+1)|..| (specified.count-1) as j loop

			temp.force (specified.at (j.item), j.item-2)
			end

		specified:=temp
	end

	move_cursor_by_one
	--needed to put beggining bracket or curly brace
	do

	specified.force("?",current_cursor+1)
	specified.force("",current_cursor-1)

	end

feature -- queries
	out : STRING
		do
			create Result.make_from_string ("")
			Result.append ("Expression currently specified: " + expression + "%N")
			Result.append ("Report: " + report)
		end


	current_cursor: INTEGER
		do
			across 0 |..| (specified.count-1) as i loop

				if specified.at (i.item)~"?" then
				Result:=i.item
				end

			end
		end

end
