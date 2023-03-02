use IO;
config var filename = "cycle.txt";

enum inst {noop=1, addx=2}

iter readNextInst(ch: fileReader): (inst, int) {
  var line: string;
  while ch.readLine(line, stripNewline=true) {
    if line == "noop" then yield (inst.noop, 0);
    else {
      var elms = line.split(" ");
      yield (inst.addx, elms[1]:int);
    }
  }
}

iter yieldSpecifiedCycles(ch: fileReader, cycleNums: []int) {
  var value:int = 1;
  var cycle = 0;

  var idx = cycleNums.domain.low;

  for (inst, v) in readNextInst(ch) {

    cycle += inst:int;

    if idx > cycleNums.domain.high then break;
    if cycleNums[idx] == cycle {
      idx+=cycleNums.domain.stride;
      var res = value * cycle;
      writeln("cycle ",cycle, " ", res);
      yield res;
    }
    else if cycleNums[idx] == cycle-1 {
      idx+=cycleNums.domain.stride;
      var res = value * (cycle-1);
      writeln("cycle ", cycle-1, " ", res);
      yield res;
    }

    value += v;

  }
}


var r = openReader(filename);
var cycles = [20,60,100,140,180,220];
var signalStrength = + reduce yieldSpecifiedCycles(r, cycles);
writeln("Signal Strength: ", signalStrength);
