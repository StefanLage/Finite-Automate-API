import automate

class Client

var auto1: Automate
var auto2: Automate
# States Auto1
var s0: State
var s1: State
var s2: State
var s3: State
# States Auto2
var a0: State
var a1: State
var a2: State
var cmd: String

init
do
	self.cmd = ""
	genAuto1(false)
	genAuto2
end

# Generate automate number 1
fun genAuto1(combine: Bool)
do
	s0 = new State.with(false)
	s1 = new State.with(false)
	s2 = new State.with(true)
	s3 = new State.with(false)

	s0.addTransitions('a', s0)
	s0.addTransitions('z', s1)
	s1.addTransitions('e', s3)
	s1.addTransitions('r', s2)
	s2.addTransitions('t', s2)
	s2.addTransitions('y', s2)
	s3.addTransitions('r', s2)
	if combine then s3.addTransitions('y', auto2)
	auto1 = new Automate.with(s0)
end

# Generate automate number 2
fun genAuto2
do
	a0 = new State.with(false)	
	a1 = new State.with(false)
	a2 = new State.with(true)

	a0.addTransitions('q',a1)
	a1.addTransitions('s',a2)
	a2.addTransitions('d',a2)
	auto2 = new Automate.with(a0)
end

fun askCommand
do
	print "Enter a command : <view>, <treat>, <auto1>, <auto2>, <exit>"
	cmd = stdin.read_line

	if cmd == " " then 
		print ""
		askCommand
	else
		if cmd == "auto1" then 
			genAuto1(false)
			print ""
			askCommand
		else if cmd == "auto2" then
			genAuto2
			genAuto1(true)
			print ""
			askCommand
		else if cmd == "view" then 
			auto1.getGraphForm
			print ""
			askCommand
		else if cmd.split_with(' ')[0] == "treat" then
			var l = new Array[Object]
			var arg =  cmd.split_with(' ')[1]
			if arg.length > 0 then
				for i in arg
				do
					l.add(i)
				end
				print "Accepted: {auto1.execute(l)}"
			end
			print ""
			askCommand
		else
			return
		end
	end
end
end


var cl = new Client 
cl.askCommand

#print "Accepted : {a.execute(l)}"
