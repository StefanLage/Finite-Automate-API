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

	fun constructAlphabet(clalphabet: String): Bool
	do
		alphabet = new FSAlphabet[FSValueAlphabet]
		for i in clalphabet
		do	
			alphabet.add(new FSValueAlphabet.with(i))
		end
		if alphabet.length == clalphabet then
			return true
		else
			return false
	end

	fun constructStatesList(): Bool
	do
		
	end

	fun constructTransitionTable(): Bool
	do
	end

	fun constructAccepting(): Bool
	do
	end

end
