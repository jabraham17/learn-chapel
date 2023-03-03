use IO, List, Barriers;
config var filename = "monkey.txt";
config var nRounds = 20;
config var doPart2 = false;

enum Op {plus, mul, square}

class Monkey {
  var id: int;
  var work_queue: list(int, parSafe=true);
  var catch_queue: list(int, parSafe=true);
  var operation: (Op, int);
  var test: int; // divisible by ___
  var throw_on_true: int; // which monkey to throw to on true
  var throw_on_false: int; // which monkey to throw to on false

  var nInspected: int;

  proc doOp(item:int) {
    if operation[0] == Op.plus then return item + operation[1];
    if operation[0] == Op.mul then return item * operation[1];
    if operation[0] == Op.square then return item * item;
    assert(false);
    return 0;
  }
  proc doTest(item:int) {
    return item % test == 0;
  }
  proc getMonkeyTarget(item:int) {
    if doTest(item) { 
      return throw_on_true;
     }
    else {
      return throw_on_false;
    }
  }

  proc throwItems(monkeys, monkeyCanFinishTurn: sync int) {
    while monkeyCanFinishTurn.readXX() < id || !work_queue.isEmpty() {
      while !work_queue.isEmpty() {
        var item = work_queue.pop();

        var newItem = doOp(item);

        if !doPart2 {
          newItem = (newItem / 3):int;
        }
        else {
          // reduce by product of all mokey divisiors, as they are prime
          // this could be factored out and be MUCH faster....but it works so oh well
          newItem %= * reduce monkeys.test;
        }

        var throwTo = getMonkeyTarget(newItem);
        // writeln("Monkey ", id, " does a ", operation[0], " on ", item, " resuling in ", newItem, " and throws to ", throwTo);

        //if throwing to a monkey after us, we can add it to its work quuue
        monkeys[throwTo].catchItem(newItem, throwTo > id);

        // we inspected an item!
        nInspected+=1;
      }
    }
    // monkey is done, the next may finish
    // on write of last monkey, will modulo will wrap this back to 0!
    monkeyCanFinishTurn.writeFF((id+1) % monkeys.size);
  }
  proc loadWorkQueue() {
    assert(work_queue.isEmpty());
    work_queue <=> catch_queue;
  }
  proc catchItem(item:int, useWorkQueue=false) {
    // add item to catch queue
    if useWorkQueue then work_queue.append(item);
    else catch_queue.append(item);
  }

  proc print() {
    write("Monkey ", id, " inspected ", nInspected, " times. final items: ");
    for i in work_queue do write(i, " ");
    writeln();
  }

  proc type parse(idx:int, r: fileReader): Monkey {
    r.read(new ioLiteral("  Starting items: "));
    var items = new list(r.readLine().strip().split(", ").strip():int, parSafe=true);


    var opStr, varStr:string;
    r.readf("   Operation: new = old %s %s\n", opStr, varStr);
    var op = if opStr == "+" then Op.plus else if opStr == "*" && varStr == "old" then Op.square else Op.mul;
    var opVal = if op != Op.square then varStr:int else 0;
    
    var div: int;
    r.readf("  Test: divisible by %i\n", div);
    var trueMonkey, falseMonkey: int;
    r.readf("    If true: throw to monkey %i\n", trueMonkey);
    r.readf("    If false: throw to monkey %i\n", falseMonkey);

    return new Monkey(idx, 
                      items, 
                      new list(int, true), 
                      (op, opVal), 
                      div, 
                      trueMonkey, 
                      falseMonkey);
  }
}

iter yieldMonkeys(r: fileReader) {
  var line: string;

  while(r.readLine(line)) {
    var elms = line.split(" ");
    elms = elms[1].split(":");
    var idx = elms[0]:int;
    var m = Monkey.parse(idx, r);
    yield m;
    if !r.matchNewline() then break;
  }

}

var r = openReader(filename);

// var monkeys: [0..3] Monkey;
// for m in yieldMonkeys(r) do monkeys[m.id] = m;
// I get weird promotion error when I try
var monkeys = yieldMonkeys(r);
// var monkeys = for m in yieldMonkeys(r) do m;

for m in monkeys do m.print();

var bar = new Barrier(monkeys.size);
var monkeyCanFinishTurn: sync int = 0;
coforall m in monkeys {
  for i in 0..<nRounds do {
    m.throwItems(monkeys, monkeyCanFinishTurn);
    bar.barrier();
    m.loadWorkQueue();
    bar.barrier();
  }
}

writeln("after rounds");
for m in monkeys do m.print();

var (mostInspect, loc) = maxloc reduce zip(monkeys.nInspected, monkeys.domain);
monkeys[loc].nInspected = 0;
var mostInspect2 = max reduce monkeys.nInspected;
monkeys[loc].nInspected = mostInspect;

var mb = mostInspect * mostInspect2;
writeln("monkey buisness: ", mb);
