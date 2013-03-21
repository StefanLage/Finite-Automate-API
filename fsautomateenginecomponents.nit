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

	var value: String

	init with(e: String) do value=e end
end


# FSArray specialization
class FSStatesList[E: FSState]
	super FSArray[E]
	
	fun stateAtIndex(i: Int):FSState do return self[i] end
end 

class FSAcceptingStatesList[E: FSState]
	super FSArray[E]
end 

class FSTransitionsList[E: FSTransition]
	super FSArray[E]
end 

class FSAlphabet[E: FSValueAlphabet]
	super FSArray[E]
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


