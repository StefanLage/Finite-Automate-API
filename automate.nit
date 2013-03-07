module automate

class Automate 
	var initState: State
	
	init with(initPoint: State)
	do
		self.initState = initPoint
	end
	
	# Check if the list is accepted by the automate
	fun execute(list: Array[Object]): Bool
	do
		var s0 : nullable State = initState
		for i in list
		do
			if s0 != null then 
				s0 = s0.transition(i)
			else
				break
			end
		end

		if s0 != null then
			return s0.isItEndPoint
		else
			return false
		end
	end

	# Build graph form of the automate
	fun getGraphForm
	do
		var f = new OFStream.open("automate.dot")
		var digraph = "digraph finite_state_machine \{ rankdir=LR; size=\"12\"; node[ shape = doublecircle];"
		digraph += initState.getEndPoints
		digraph += ";node [shape=box]; Start;"
		digraph += "node[shape = circle];"
		digraph += "Start -> {initState};"
		for i in initState.getNode
		do
			digraph += i
		end
		digraph += "\}"
		f.write(digraph)
		f.close
		sys.system("dot -Tpng -o automate.png automate.dot")
		sys.system("open automate.png")
		sys.system("rm automate.dot")
	end

end

class State	
	# Define if it's an end point
	var endStatus: Bool
	var listTransitions: HashMap[Object, State]
	
	init with(endState: Bool)
	do
		self.endStatus = endState
		self.listTransitions = new HashMap[Object, State]
	end
	# Return endStatus  value
	fun isItEndPoint: Bool 
	do
		return endStatus
	end 
	# Get next transition
	fun transition(char: Object): nullable State
	do
		if listTransitions.keys.has(char) then
			return listTransitions[char]
		else
			return null
		end
	end
	# Add a new transition to this state
	fun addTransitions(value: Object, state: Object)
	do
		if state isa Automate then
			listTransitions[value] = state.initState
		else if state isa State then
			listTransitions[value] = state
		else
			return
		end
	end
	# Return string which allow to build graph of the automate
	fun getNode: Array[String]
	do
		var str = new Array[String]
		var str_add = ""
		for i in listTransitions.keys
		do
			str_add = "{self} -> {listTransitions[i]} [ label = {i} ]; "
			if not str.has(str_add) then str.add(str_add)
			if listTransitions[i] != self then 
				for j in listTransitions[i].getNode
				do
					if not str.has(j) then str.add(j)
				end
			end
		end
		return str
	end
	# Return all end points
	fun getEndPoints: String
	do
		var str = ""
		for i in listTransitions.keys
		do
			if endStatus then str += "{self} "
			if listTransitions[i] != self then str += listTransitions[i].getEndPoints
		end
		return str
	end
	
end


