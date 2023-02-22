var counter: atomic int;

proc nextCounterValue():int {
  writeln("nextCounterValue");
  var i = counter.fetchAdd(1);
  return i;
}

proc assignCounter(ref x:int, counter=nextCounterValue()) {
  writeln("assignCounter");
  x = counter;
}

var A: [1..5] int;
assignCounter(A);

writeln(A);
