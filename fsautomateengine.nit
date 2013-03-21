module fsautomateengine
import fsautomateenginecomponents



class FSAutomateEngine
	
	#Properties
	var alphabet: FSAlphabet[FSValueAlphabet]
	var statesList: FSStatesList[FSState]
	var transitionTable: FSTransitionTable[FSState, FSTransitionsList[FSTransition]]
	var acceptingList: FSAcceptingStatesList[FSState]
	var initial: FSState


	init_with(alphabet: Object, automateSize: Int, transitions: Array[Array[String]], initial: Int, accepting: Array[Int])
	do
	end

	fun constructAlphabet
	do
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
