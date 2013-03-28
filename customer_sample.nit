module customer_sample
import fsautomate


var oto = new FSAutomate.with("azertyr", 4, [ ["0","#","#","#"], ["1","#","#","#"], ["#","3","#","#"], ["#","2","#","#"], ["#","#","2","#"], ["#","#","2","#"], ["#","#","#","2"] ], 0, [2])
print "azertyr: { oto.travel("azertyr").to_s}"
oto.display

print ""

print "azertytytytyty: {oto.travel("azertytytytyty").to_s}"
#var oto = new FSAutomate.with("ab", 6, [ [1,3,3,4,1,2], [5,4,6,1,2,3] ], 3, [6] )
#print oto.travel("ooo").to_s
#print oto.travel("ab").to_s

