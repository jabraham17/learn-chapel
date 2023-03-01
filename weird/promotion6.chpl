proc foo(a:int=1, b:int=2) {
  return a + b;
}

var A = [1,2,3,4,5];
var X = foo(1, b=A); // Compiles and runs successfully.
writeln(X);
var Y = foo(b=A); // Fails to compile
writeln(Y);
