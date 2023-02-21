
// implemented differently, because why not
use IO;

proc assignmentToRange(s:string): domain(int) {
  var a = s.split("-");
  var low = a[0]:int, high = a[1]:int;
  return {low..high};
}

proc rangeIntersects(a, b) {
  return !((a & b).isEmpty());
}

iter read(filename) {
  var r = IO.openreader(filename);
  for l in r.lines() {
    var s = l.split(",");
    if rangeIntersects(assignmentToRange(s[0]), assignmentToRange(s[1])) then yield 1;
  }
}
config var filename = "assign.txt";
proc main() {
  var o = read(filename);
  writeln("Number of full overlaps ", + reduce o);
}
