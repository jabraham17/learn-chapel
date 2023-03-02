use IO;
config var filename = "cycle.txt";

enum inst {noop=1, addx=2}

iter readNextInst(ch: fileReader): (inst, int) {
  var line: string;
  while ch.readLine(line, stripNewline=true) {
    if line == "noop" then yield (inst.noop, 0);
    else {
      var elms = line.split(" ");
      yield (inst.noop, 0); // insert a dummy noop, so all insts take 1 cycle
      yield (inst.addx, elms[1]:int);
    }
  }
}

iter cpuLoop(ch: fileReader, crt: domain) {
  var value:int = 1;
  var cycle = 0;
  // cycle is order for crt

  for (inst, v) in readNextInst(ch) {
    cycle += 1;

    var crtLoc = crt.orderToIndex(cycle-1);
    var crtCol = crtLoc[1];
    if crtCol == value || crtCol == value - 1 || crtCol == value + 1 then
      yield (true, crtLoc);
    else yield (false, crtLoc);

    value += v;
  }
}


var r = openReader(filename);
var crt: domain = {0..5,0..39}; //r,c

for (rendered, loc) in cpuLoop(r, crt) {
  // writeln(loc);
  if loc[1] == crt.low[1] then writeln();
  if rendered then write("#"); else write(".");
}
writeln();
