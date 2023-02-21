use IO;

proc assignmentToTuple(s:string): 2*int {
  var a = s.split("-");
  var low = a[0]:int, high = a[1]:int;
  return (low,high);
}

// is a contained in b
proc rangeFullyContainedHelper(a:2*int, b:a.type) {
  return a[0] >= b[0] && a[1] <= b[1];
}
proc rangeFullyContained(a:2*int, b:a.type) {
  return rangeFullyContainedHelper(a, b) || rangeFullyContainedHelper(b, a);
}

iter read(filename) {
  var r = IO.openreader(filename);
  for l in r.lines() {
    var s = l.split(",");
    if rangeFullyContained(assignmentToTuple(s[0]), assignmentToTuple(s[1])) then yield 1;
  }
}

config var filename = "assign.txt";
proc main() {
  var o = read(filename);
  writeln("Number of full overlaps ", + reduce o);
}
