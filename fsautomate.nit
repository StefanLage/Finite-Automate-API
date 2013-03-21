module fsautomate
import fsautomateengine

class FSAutomate

	private var automateEngine: nullable FSAutomateEngine=null

	init with(alphabet: String, automateSize: Int, transitions: Array[Array[String]], initial: Int, accepting: Array[Int] )
	do
		var error: nullable FSCodeError=null
		if not alphabet.length > 0 then error = new FSCodeError.alphabet_length_error
		if not accepting.length > 0 then error = new FSCodeError.accepting_length_error
	
		if error == null then
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
				if v.value.value == s[i].to_s then
					correctTravel = true
					initialSt = v.to

					if automateEngine.acceptingList.has(initialSt) then 
						endTravel = true
					else 
						correctTravel = false
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
		var f = new OFStream.open("automate.dot")
		var digraph = "digraph finite_state_machine \{ rankdir=LR; size=\"12\";"

		digraph += "node [shape = doublecircle]; "
		for i in automateEngine.acceptingList do digraph += "{i} "

		digraph += ";node [shape=box]; Start;"

		digraph += "node[shape = circle];"
		digraph += "Start -> {automateEngine.initial};"
		
		for state, value in automateEngine.transitionsTable
		do
			for i in value do
				digraph += "{state} -> {i.to} [ label =\"{i.value.value}\"] ;"
			end
		end

		digraph += "\}"

		f.write(digraph)
		f.close
		sys.system("dot -Tpng -o automate.png automate.dot")
		sys.system("open automate.png")
		sys.system("rm automate.dot")
	end
end
