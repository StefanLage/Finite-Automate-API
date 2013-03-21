module fsautomateenginecomponents
import fscomponents


# FSObject specialization
class FSState
	super FSObject
end

class FSTransition
	super FSObject

	var to: FSState
	var value: FSValueAlphabet
	
	init with(e: FSState, v: FSValueAlphabet)
	do
		to=e
		value=v
	end
end

class FSValueAlphabet
	super FSObject

	var value: nullable Object= null

	init with(e: Object)
	do
		if e isa String or e isa Int then value=e
	end
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


# Others
class FSTransitionTable[E: FSState, F: FSTransitionsList[FSTransition]]
	super FSHashMap[E, F]

	fun addTransitionToState(s: FSState, t: FSTransition)
	do
		if not self.has_key(s) then
			self[s] = new FSTransitionsList[FSTransition]
			self[s].add(t)
		else
			self[s].add(t)
		end
	end
end


