
use IO;
class Stack {
  proc init() {
    writeln("In INIT");
  }
}
// var stacks: [1..3] shared Stack = new shared Stack();
var stacks: [1..3] Stack = new Stack();
// var stacks: [1..3] Stack = [1..3] new Stack();
writeln(stacks);

proc foo() {
  writeln("in foo");
  return 1;
}
var stacks2: [1..3] int = foo();
writeln(stacks2);
