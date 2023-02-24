use IO, Map, List;

config var filename = "files.txt";
config var maxSize = 100000;

class Dir {
  var name: string;
  var subDirs: list(owned Dir);
  var files: map(string, int);

  proc init() {
    this.name = "";
    this.subDirs = new list(owned Dir);
    this.files = new map(string, int);
  }

  proc size():int {
    return (+ reduce this.files.values()) + (+ reduce (forall d in this.subDirs do d.size()));
  }
  proc type checkSize(s, check) {
    if s < check then return s;
    else return 0;
  }
  proc findAllUnderMax(maxSize:int): int {
    var fileSum = (+ reduce this.files.values());
    var sum:  int;
    forall d in this.subDirs with (+ reduce sum) {
      sum +=d.size();
    } 
    var realSum: int = sum + fileSum;
    if(realSum >= maxSize) then realSum = 0;
    var s = (+ reduce (forall d in this.subDirs do d.findAllUnderMax(maxSize))) + realSum;
    return s;
  }

  proc type readDir(ch: fileReader, name: string): owned Dir throws {
    var line: string;
    var dir = new Dir();
    dir.name = name;
    while(ch.readLine(line, stripNewline=true)) {
      if line == "$ cd .." {
        break;
      }
      if line.startsWith("$ cd ") {
        var tmpName = line["$ cd ".size..];
        dir.subDirs.append(Dir.readDir(ch, tmpName));
      }
      else if line == "$ ls" {}
      else if line.startsWith("dir ") {
        
      }
      else {
        // file
        var (size, _, fileName) = line.partition(" ");
        dir.files.add(fileName, size:int);
      }
    }
    return dir;
  }

  proc type writeDir(d, indentSize=0) {
    writeln( " "*indentSize, d.name, " (dir)");
    for s in d.subDirs do Dir.writeDir(s, indentSize+1);
    for (f, s) in d.files.items() do writeln(" "*(indentSize+1), f, " size=",s);

  }

}

iter dirCandiate(minFileSize, d): int {
  if(d.size() >= minFileSize) then yield d.size();
  for s in d.subDirs { 
    for x in dirCandiate(minFileSize, s) do yield x;
  }
}

proc main() {
  var r = openreader(filename);
  var root = Dir.readDir(r, "");

    Dir.writeDir(root);
  writeln("all size: ", root.size());
  writeln("at most size: ", root.findAllUnderMax(maxSize));

  var unusedSpace = 70000000 - root.size();
  var sizeNeeded = 30000000;
  var minFileSize = sizeNeeded - unusedSpace;

  var min = 10000000;
  for d in dirCandiate(minFileSize, root) {
    if d < min {
      min = d;
    }
  }
  writeln("unused space ", unusedSpace);
  writeln("Need to delete file of at least size ", minFileSize);
  writeln("Best canidate has size ", min);

}
