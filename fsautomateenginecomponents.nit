module fsautomateenginecomponents
import fscomponents


# FSObject specialization
class FSState
	super FSObject
	init do super end
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
	init do super end
	fun stateAtIndex(i: Int):FSState do return self[i] end
end 

class FSAcceptingStatesList[E: FSState]
	super FSArray[E]
	init do super end
end 

class FSTransitionsList[E: FSTransition]
	super FSArray[E]
	init do super end
end 

class FSAlphabet[E: FSValueAlphabet]
	super FSArray[E]
	init do super end
end


# Others
class FSTransitionsTable[E: FSState, F: FSTransitionsList[FSTransition]]
	super FSHashMap[E, F]
	init do super end
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


