proc makeit():int {
  writeln("IN makeit");
  return 1;
}

proc foo(x:int, y:int = makeit()) {
  return x+y;
}

var A = [1,2,3,4,5,6,7,8,9];
foo(A, makeit()); // should print once
writeln();
foo(A); // This causes an error?
