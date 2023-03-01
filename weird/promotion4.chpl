proc makeit():int {
  writeln("IN makeit");
  return 1;
}

proc foo(x:int, y:int = makeit()) {
  return x+y;
}

proc foo2(y:int = makeit()) {
  return 2+y;
}


var A = [1,2,3,4,5,6,7,8,9];
foo(A, makeit()); // should print once
writeln();
foo(A); // This causes an error?
writeln();
foo2(); // should print multiple times
writeln();
foo2(makeit()); // should print once
