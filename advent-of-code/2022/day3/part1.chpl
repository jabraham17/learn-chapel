
// proc byteAt(c) {return (c:bytes)[0]; }

proc getPriority(c): int /*curious thats this requires a type*/ {
  var b = c.toByte();
  if b >= 'A'.toByte() && b <= 'Z'.toByte() then return b - 'A'.toByte() + 27;
  if b >= 'a'.toByte() && b <= 'z'.toByte() then return b - 'a'.toByte() + 1;
  writeln("possible error getPriority");
  return 0;
}

proc splitKnap(str:string): (string, string) {
  return (str[0..<str.size/2],str[str.size/2..]);
}

proc toSet(str: string): domain(string) {
  var s: domain(string);
  s += str.items();
  return s;
}
// modifies s1
// proc intersect(ref s1: domain(string), s2: domain(string)): domain(string) {
//   s1 -= s2;
// }
proc findCommon(s:(string,string)) 
  return findCommon(s[0], s[1]);

proc findCommon(s1:string, s2: string): string {
  var knap1 = toSet(s1), knap2 = toSet(s2);
  var common_domain = knap1 & knap2;
  var common: [common_domain] int;
  // if common.size == 1 then return common.indices[0];
  return "".join(common.indices);
}

use IO;
iter processLine(filename) {
  var r = open(filename, ioMode.r).reader();
  for l in r.lines() do yield getPriority(findCommon(splitKnap(l)));
}

config var filename = "knap.txt";
proc main() {
  var p = processLine(filename);
  writeln(p.size);
  writeln(p.type:string);
  writeln(p);
  // var p = + reduce 
  var sum = 0;
  for x in p do sum+=x;
  writeln("Sum of priority of common item: ", (+ reduce p), " ", sum);
}
