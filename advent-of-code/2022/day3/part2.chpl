
import part1;
use IO;
use Types;

proc findCommon(s:(string,string,string)) 
  return part1.findCommon(part1.findCommon(s[0], s[1]), s[2]);
proc findCommon(s) where Types.isArray(s) {
  if s.size == 3 {
    // what I want
    // return findCommon((s[0], s[1], s[2]));
    var x = reshape(s, {0..2});
    return findCommon((x[0], x[1], x[2]));
  }
  return "";
}


iter processPart2(filename):int {
  var r = open(filename, ioMode.r).reader();
  var lines = r.lines().strip();

  // var groups_3 = reshape(lines, {0..<lines.size/3, 0..2});
  for idx in 0..<lines.size by 3 { 
    var c = findCommon(lines[idx..<idx+3]);
    yield part1.getPriority(c);
  }


}

config var filename = "knap.txt";
proc main() {
  var p = processPart2(filename);
  writeln((+ reduce p));
}
