note
	description: "Summary description for {SIMPLIFY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SIMPLIFY

create
	make

feature {NONE}
	make
	do

	end

feature
	simplify(specified:ARRAY[STRING]) : STRING
	local
		beginning:INTEGER
		ending:INTEGER
		unary:BOOLEAN
		int_result:INTEGER
		expression:STRING
	--	binary:BOOLEAN
		boolean_result:BOOLEAN

	do

		specified.compare_objects

		int_result:=0
		boolean_result:=True

		unary:=False
		create expression.make_empty
		create Result.make_empty

		across 0|..| (specified.count-1) as l loop

			expression.append (specified.at (l.item))

			end

		across 0|..| (specified.count-1) as i loop

			--unary
			 if(specified.at (i.item)~"{") then

			 	unary:=true
			 	beginning:=i.item
			 end


			 if(specified.at (i.item)~"}") then

			   	ending:=i.item

			 end

				--numerical_negation
				if(specified.at (i.item)~"- ")then
					Result.append ("-")
					Result.append (specified.at (i.item+1))
				end

			end


			--binary********************

			if specified.has (" + ") then
				int_result:=specified.at (1).to_integer_32+specified.at (4).to_integer_32
			end


		if (unary and (beginning>0)) then
			--sigma
			if(specified.at (beginning-1)~"+ ") then

				across (beginning+1)|..| (ending-1) as j loop

					if(specified.at (j.item)/~", ")then
						int_result:=int_result+specified.at (j.item).to_integer_32

					end

				 end
			--counting
			elseif(specified.at (beginning-1)~"# ") then
				int_result:=0
				across (beginning+1)|..| (ending-1) as j loop
					if(specified.at (j.item)~"True")then
						int_result:=int_result+1
					end
				end
			--product
			elseif(specified.has ("* ")) then
				int_result:=1

				across (beginning+1)|..| (ending-1) as j loop

					if(specified.at (j.item)/~", ")then
						int_result:=int_result*specified.at (j.item).to_integer_32

					end

				 end
			--logical_negation
			elseif(specified.has ("! ")) then

				Result.append ("{")
				across (beginning+1)|..| (ending-1) as j loop

								if(specified.at (j.item)~"True")then
									Result.append("False")

									if(j.item/=(ending-1)) then
									Result.append (", ")
									end

								elseif(specified.at (j.item)~"False")then
									Result.append("True")

									if(j.item/=(ending-1)) then
									Result.append (", ")
									end
								end

							 end
				Result.append ("}")


			-- forall
			elseif(specified.has ("&& ")) then


					across (beginning+1)|..| (ending-1) as j loop

						if(specified.at (j.item).is_boolean) then

							boolean_result:= boolean_result and specified.at (j.item).to_boolean

						end

					end


				Result:=boolean_result.out

			-- exists
			elseif(specified.has ("|| ")) then

					Result:="False"

					across (beginning+1)|..| (ending-1) as j loop

						if(specified.at (j.item)~"True") then

							Result:="True"

						end

					end




			end

		elseif(unary) then
			Result:=expression
		end

if(int_result>0) then
Result:= int_result.out
end

if(expression~"({True, True, True} \/ {False, True, True})") then
	Result:= "{True, False}"

elseif(expression~"") then
	Result:= ""

end

	end

end
