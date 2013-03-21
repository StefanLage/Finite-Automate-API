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
	end

	fun constructAlphabet(clAlphabet: String): Bool
	do
		alphabet = new FSAlphabet[FSValueAlphabet]
		for i in clAlphabet
		do	
			alphabet.add(new FSValueAlphabet.with(i))
		end
		if alphabet.length == clAlphabet then
			return true
		else
			return false
		end
	end

	fun constructStatesList(automateSize: Int): Bool
	do
		statesList = new FSStatesList[FSState]
		for i in [0..automateSize]
		do
			statesList.add(new FSState)
		end
		if statesList.length == automateSize then
			return true
		else
			return false
		end
	end

	fun constructTransitionTable(): Bool
	do
	end

	fun constructAccepting(): Bool
	do
	end

end
