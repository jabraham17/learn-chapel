
use IO;

proc foo() {
  writeln("Call foo");
  return 2;
}

proc bar(x=foo()) {
  writeln("Call bar");
  return 1+x;
}

var arr : [1..3] int = bar();



