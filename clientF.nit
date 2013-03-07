import automate

var a0 = new State.with(false)
var a1 = new State.with(false)
var a2 = new State.with(true)

a0.addTransitions('q',a1)
a1.addTransitions('s',a2)
a2.addTransitions('d',a2)
var b = new Automate.with(a0)



var s0 = new State.with(false)
var s1 = new State.with(false)
var s2 = new State.with(true)
var s3 = new State.with(false)

s0.addTransitions('a', s0)
s0.addTransitions('z', s1)
s1.addTransitions('e', s3)
s1.addTransitions('r', s2)
s2.addTransitions('t', s2)
s2.addTransitions('y', s2)
s3.addTransitions('r', s2)
s3.addTransitions('y', b)


var a = new Automate.with(s0)
var l = new Array[Object]

if args.length > 0 then
	for i in args[0]
	do
		l.add(i)
	end
end

b.getGraphForm


var cmd = ""
print "Enter a command"
cmd = stdin.read_line

if cmd == " " then ret

fun askCommand
do
	print "Enter a command"
	cmd = stdin.read_line

	if cmd == " " then askCommand
	else
		#if 
	end
end



#print "Accepted : {a.execute(l)}"
