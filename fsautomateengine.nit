module fsautomateengine
import fsautomateenginecomponents



class FSAutomateEngine
	
	var alphabet: FSAlphabet[FSValueAlphabet]
	var statesList: FSStatesList[FSState]
	var transitionsTable: FSTransitionsTable[FSState, FSTransitionsList[FSTransition]]
	var acceptingList: FSAcceptingStatesList[FSState]
	var initial: FSState

	init with(alphabet: String, automateSize: Int, transitions: Array[Array[String]], initial: Int, accepting: Array[Int])
	do
		if constructAlphabet(alphabet) then
			if construcStatesList(automateSize) then
				if constructTransitionsTable(transitions) then
					if constructAccepting(accepting) then
						self.initial = self.statesList.stateAtIndex(initial)
					else
						print "error when constructin accepting states"
					end
				else
					print "error when constructing transitions list"
				end
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
		for i in clAlphabet do self.alphabet.add(new FSValueAlphabet.with(i))
		if self.alphabet.length == clAlphabet then
			return true
		else
			return false
		end
	end

	fun constructStatesList(automateSize: Int): Bool
	do
		self.statesList = new FSStatesList[FSState]
		for i in [0..automateSize] do self.statesList.add(new FSState)
		if self.statesList.length == automateSize then
			return true
		else
			return false
		end
	end

	fun constructTransitionsTable(transitions: Array[Array[String]]): Bool
	do
		self.transitionsTable = new FSTransitionsTable[FSState, FSTransitionsList[FSTransition]]
		for i in [0..transitions.length] 
		do 
			for state in transitions[i] do self.transitionsTable[self.statesList.stateAtIndex(state.to_i)] = self.alphabet[i]
		end
		if self.transitionsTable.length == transitions.length then
			return true
		else
			return false
		end
	end

	fun constructAccepting(accepting: Array[Int]): Bool
	do
		self.acceptingList = new FSAcceptingStatesList[FSState]
		for i in accepting do self.acceptingList.add(self.statesList.stateAtIndex(i))
		if self.acceptingList.length == accepting.length then
			return true
		else
			return false
		end
	end

end
