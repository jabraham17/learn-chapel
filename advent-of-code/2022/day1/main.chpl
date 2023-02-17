// https://adventofcode.com/2022/day/1
use IO;
use AutoMath;

iter read_elves(filename) {
  var f = open(filename, ioMode.r);
  var r = f.reader();
    
  var lines = r.lines();
  var current_elf = 0;
  for line in lines {
    var s = line.strip();
    if s.isEmpty() {
      yield current_elf;
      current_elf = 0;
    }
    else current_elf += s:int;
  }
  // last elf at end of file
  yield current_elf;
}

config var filename = "calorie.txt";

// use reduce to find max
var (max_elf, max_elf_loc) = maxloc reduce zip(read_elves(filename),1..);
writeln("Elf ", max_elf_loc, " has the most calories of ", max_elf);

// proc min(a: [], n: int = 0): a.eltType where isArray(a) {
//   if a.size >= n then return 0;
//   return min(a[n], min(a, n+1));
// }


var max_3: [0..2] int = 0;
for e in read_elves(filename) {
  var (smallest, loc) = minloc reduce zip(max_3, 0..);
  max_3[loc] = max(e, smallest);
}
writeln("Top 3 Elves Total: ", (+ reduce max_3), " = ", max_3[0], "+", max_3[1], "+", max_3[2]);


