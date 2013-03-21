module fsautomate
import fsautomateengine

class FSAutomate

	private var automateEngine: nullable FSAutomateEngine=null

	init with(alphabet: String, automateSize: Int, transitions: Array[Array[String]], initial: Int, accepting: Array[Int] )
	do
		var error: nullable FSCodeError=null
		if not alphabet.length > 0 then error = new FSCodeError.alphabet_length_error
		if not accepting.length > 0 then error = new FSCodeError.accepting_length_error

		if not error == null then
			var equalASizeAndTransitions: Bool=true
			for ar in transitions
			do
				if not ar.length == automateSize then
					equalASizeAndTransitions = false
					break
				end
			end
			if not equalASizeAndTransitions then 
				error = new FSCodeError.automatesize_transition_not_equal_error
			else	
				automateEngine = new FSAutomateEngine.with(alphabet, automateSize, transitions, initial, accepting)
		
			end
		end
	end

	fun travel(s: String):Bool
	do
		if automateEngine == null then return false

		var initialSt: FSState = automateEngine.initial
		var correctTravel: Bool = true
		var endTravel: Bool = false
		for i in [0..s.length]
		do
			if correctTravel == false then break

			for v in automateEngine.transitionsTable[initialSt]
			do
				correctTravel = false
				if v.value == s[i] then 
					correctTravel = true
					initialSt = v.to

					if automateEngine.acceptingList.has(initialSt) then 
						correctTravel = false
						endTravel = true
					end
					break
				end
			end

			if endTravel then break
		end

		return correctTravel
	end

	fun mergeWithAutomate(a: FSAutomate)
	do

	end

	fun display
	do

	end
end
