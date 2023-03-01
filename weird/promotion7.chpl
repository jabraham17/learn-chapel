// proc bar() {
//   return 5;
// }

config param which = 4;

proc foo(x:int, y:int = 7) {
  return x+y;
}
var A = [1,2,3,4,5,6,7,8,9];

if which == 1 {
  foo(A);
}
else if which == 2{
  var x = foo(A);
}
else if which == 3 {
  var x = foo(A);
  foo(A);
}
else if which == 4 {
  foo(7);
}

// var tmp1 = foo(A, bar());
// writeln(tmp1);
// var tmp2 = foo(A); // This causes an error?
// writeln(tmp2);
// foo(A, bar());
// foo(A);
// foo(7);
