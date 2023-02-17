writeln("Helllo world 4");

class Test {
    var a;
    proc init() { a=0;}
}

var t1 = new Test();
t1.a = 10;
writeln("t1=",t1);
var t2 = t1.borrow();
writeln("t2=",t2);

t2.a = 5;
writeln("changed t1=", t1, " t2=", t2);
