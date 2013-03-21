module fscomponents


abstract class FSObject
	super Object
end

abstract class FSArray[E: FSObject]
	super Array[E]
	redef fun add(e: E) do super end
	redef fun has(e: E):Bool do return super end
end

abstract class FSHashMap[E: FSObject, F: FSArray[FSObject]]
	super HashMap[E, F]
end


class FSCodeError
	super FSObject

	init alphabet_length_error do print "[FSAutomate] Your alphabet length can not be equal to 0." end
	init accepting_length_error do print "[FSAutomate] Your accepting array can not be empty, you need to provide one or more ending point." end
	init automatesize_transition_not_equal_error do print "[FSAutomate] Your automate size must be equal to the number of state pointed in each transitions" end
end


