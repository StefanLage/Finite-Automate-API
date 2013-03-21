module fsautomateengine
import fsautomateenginecomponents



class FSAutomateEngine
	
	var alphabet: FSAlphabet[FSValueAlphabet]
	var statesList: FSStatesList[FSState]
	var transitionTable: FSTransitionTable[FSState, FSTransitionsList[FSTransition]]
	var acceptingList: FSAcceptingStatesList[FSState]
	var initial: FSState

	with(alphabet: String, automateSize: Int, transitions: Array[Array[Object]], initial: Int, accepting: Array[Object])
	do
	end

	fun constructAlphabet(alphabet: String)
	do
		alphabet = new FSAlphabet[FSValueAlphabet]
		for i in alphabet
		do	
			alphabet.add(new FSValueAlphabet.with(i))
		end
	end

	fun constructStatesList 
	do

	end

	fun constructTransitionTable
	do
	end

	fun constructAccepting 
	do
	end

end
