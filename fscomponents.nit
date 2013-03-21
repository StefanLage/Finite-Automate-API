module fscomponents


abstract class FSObject
	super Object
end

abstract class FSArray[T: FSObject]
	super Array[T]
	redef fun add(e: T) do end
	redef fun has(e: T):Bool do return false end
end


