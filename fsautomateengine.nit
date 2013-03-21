module fsautomateengine
import fsautomateenginecomponents



class FSAutomateEngine
	
	var alphabet: FSAlphabet[FSValueAlphabet]
	var statesList: FSStatesList[FSState]
	var transitionTable: FSTransitionTable[FSState, FSTransitionsList[FSTransition]]
	var acceptingList: FSAcceptingStatesList[FSState]
	var initial: FSState

	with(alphabet: String, automateSize: Int, transitions: Array[Array[String]], initial: Int, accepting: Array[Int])
	do
		if constructAlphabet(alphabet) then
			if construcStatesList(automateSize) then
				constructTransitionTable(transitions)
			else
				print "error when constructing states list"
			end
		else
			print "error when construting alphabet"
		end
	end

	fun constructAlphabet(clAlphabet: String): Bool
	do
		self.alphabet = new FSAlphabet[FSValueAlphabet]
		for i in clAlphabet
		do	
			self.alphabet.add(new FSValueAlphabet.with(i))
		end
		if self.alphabet.length == clAlphabet then
			return true
		else
			return false
		end
	end

	fun constructStatesList(automateSize: Int): Bool
	do
		self.statesList = new FSStatesList[FSState]
		for i in [0..automateSize]
		do
			self.statesList.add(new FSState)
		end
		if self.statesList.length == automateSize then
			return true
		else
			return false
		end
	end

	fun constructTransitionTable(transition: Array[Array[String]]): Bool
	do
		self.transitionTable = new FSTransitionTable[FSState, FSTransitionsList[FSTransition]]
		for i in [0..transition.length]
		do
			for state in transition[i]
			do
				self.transitionTable[statesList.stateAtIndex(state.to_i)] = self.alphabet[i]
			end
		end
		if self.transitionTable.length == transition.length then
			return true
		else
			return false
		end
	end

	fun constructAccepting(): Bool
	do
	end

end
