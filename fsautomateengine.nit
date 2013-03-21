module fsautomateengine
import fscomponents


# FSObject specialization
class FSState
	super FSObject

end


class FSTransition
	super FSObject

end


class FSValueAlphabet
	super FSObject

end


# FSArray specialization
class FSStatesList[E: FSState]
	super FSArray[E]
	
	redef fun add(e: E)
	do
	
	end

	redef fun has(e: E):Bool
	do
		return false
	end
end 

class FSAcceptingStatesList[E: FSState]
	super FSArray[E]
	
	redef fun add(e: E)
	do
	
	end

	redef fun has(e: E):Bool
	do
		return false
	end
end 

class FSTransitionsList[E: FSTransition]
	super FSArray[E]
	
	redef fun add(e: E)
	do
	
	end

	redef fun has(e: E):Bool
	do
		return false
	end
end 

class FSAlphabet[E: FSValueAlphabet]
	super FSArray[E]

	redef fun add(e: E)
	do

	end

	redef fun has(e: E):Bool
	do
		return false
	end
end


