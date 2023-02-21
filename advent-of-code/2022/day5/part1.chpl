
use IO;

record Move {
  var howMany: int;
  var startingStack: int;
  var endingStack: int;

  proc readThis(ch: fileReader) throws {
    ch.read(new ioLiteral("move"));
    ch.read(howMany);
    ch.read(new ioLiteral("from"));
    ch.read(startingStack);
    ch.read(new ioLiteral("to"));
    ch.read(endingStack);
    ch.readNewline();
  }
  proc writeThis(ch: fileWriter) throws {
    ch.write("move ", howMany, " from ", startingStack, " to ", endingStack);
  }
}
enum crate {A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z}
class Stack {
  var elms: list(crate);
  // var inUsed$: sync bool = false;
  proc init() {
    this.elms = new list(crate);
  }
  proc push(x: crate) {elms.append(x);}
  proc pop() {return elms.pop();}
  proc peek() {return elms.last();}

  proc moveTo(other: borrowed Stack, n: integral = 1) {
    for i in 0..<n {
      var x = this.pop();
      other.push(x);
    }
  }
}

use List;
iter readStackLines(ch: fileReader) {
  var line: string;
  while ch.readLine(line) && !line.strip().isEmpty() {
    yield line;
  }
}
iter reversed(arr) {
  for idx in arr.domain.low..<arr.domain.high by -1 do yield arr[idx];
}

proc initStacks(ch: fileReader) {
  var lines = readStackLines(ch);
  param charsPerStack = 4;
  var n = lines.last.size / charsPerStack;

  var stacks: [1..n] owned Stack = [1..n] new Stack();

  // go backwards through the list
  for line in reversed(lines) {
    for (lineOff, stackIdx) in zip(1..<line.size by charsPerStack, 1..) {
      var char = line[lineOff];
      if char != " " then stacks[stackIdx].push(char:crate);
    }
  }
  return stacks;
}


config var filename = "stacks.txt";
proc main() {
  var r = openreader(filename);
  var stacks = initStacks(r);

  var m: Move;
  while r.read(m) {
    var fromStack = stacks[m.startingStack].borrow();
    var toStack = stacks[m.endingStack].borrow();
    fromStack.moveTo(toStack, m.howMany);
  }

  writeln("Top of each stack");
  for s in stacks do write(s.peek());
  writeln();

}
