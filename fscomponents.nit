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
