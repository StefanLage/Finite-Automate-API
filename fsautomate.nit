module fsautomate
import fsautomateengine

class FSAutomate

	private var automateEngine: nullable FSAutomateEngine=null

	init with(alphabet: String, automateSize: Int, transitions: Array[Array[String]], initial: Int, accepting: Array[Int] )
	do
		if not alphabet.length > 0 then return once new FSCodeError.alphabet_length_error
		if not accepting.length > 0 then return once new FSCodeError.accepting_length_error

		var equalASizeAndTransitions: Bool=true
		for ar in transition
		do
			if not ar.length == automateSize then
				equalASizeAndTransitions = false
				break
			end
		end
		if not equalASizeAndTransitions then return once new FSCodeError.automatesize_transition_not_equal_error
			
		automateEngine = new FSAutomateEngine(alphabet, automateSize, transitions, initial, accepting)
	end

	fun travel
	do

	end

	fun mergeWithAutomate(a: FSAutomate)
	do

	end

	fun display
	do

	end
end
