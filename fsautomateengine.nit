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
			if constructStatesList(automateSize) then
				if constructTransitionsTable(transitions) then
					if constructAccepting(accepting) then
						self.initial = self.statesList.stateAtIndex(initial)
					else
						print "error accepting states"
					end
				else
					print "error transitions list"
				end
			else
				print "error states list"
			end
		else
			print "error alphabet"
		end
	end

	fun constructAlphabet(clAlphabet: String): Bool
	do
		self.alphabet = new FSAlphabet[FSValueAlphabet]
		for i in clAlphabet do self.alphabet.add(new FSValueAlphabet.with(i.to_s))
		if self.alphabet.length == clAlphabet.length then
			return true
		else
			return false
		end
	end

	fun constructStatesList(automateSize: Int): Bool
	do
		self.statesList = new FSStatesList[FSState]
		for i in [0..automateSize-1] do self.statesList.add(new FSState)
		if self.statesList.length == automateSize then
			return true
		else
			return false
		end
	end

	fun constructTransitionsTable(transitions: Array[Array[String]]): Bool
	do
		self.transitionsTable = new FSTransitionsTable[FSState, FSTransitionsList[FSTransition]]
		var indexState = 0
		var trLen = transitions.length-1
		for i in [0..trLen] 
		do 
			for state in transitions[i] do
				if not state == "#" then
					#print "ti {indexState}"
					var fsstate = self.statesList.stateAtIndex(state.to_i)
					var fstransition = new FSTransition.with(fsstate, self.alphabet[i])
					self.transitionsTable.addTransitionToState(self.statesList[indexState], fstransition)
			
				end
				indexState += 1
			end
			indexState = 0
		end
		return true
	end

	fun constructAccepting(accepting: Array[Int]): Bool
	do
		self.acceptingList = new FSAcceptingStatesList[FSState]
		for i in accepting do 
			self.acceptingList.add(self.statesList.stateAtIndex(i))
		end
		if self.acceptingList.length == accepting.length then
			return true
		else
			return false
		end
	end

end
