use IO, List;
config var filename = "trees.txt";

enum Direction {
  Left, Right, Top, Bottom
}

record Tree {
  var height: int;
  var locked$: sync bool;
  var visibleDirections: list(Direction);

  proc init(height:int) {
    this.height = height;
    locked$ = false;
    locked$.reset();
    visibleDirections = new list(Direction);
  }

  proc setVisible(direction: Direction) {
    locked$.writeEF(true);
    visibleDirections.append(direction);
    locked$.reset();
  }

  proc isTaller(other: Tree): bool {
    return height > other.height;
  }

  proc isVisible() {
    return !visibleDirections.isEmpty();
  }

  proc visibleInDirection(direction: Direction): bool {
    return visibleDirections.contains(direction);
  }

  proc checkVisisble(direction: Direction, prev: Tree): bool {
    return prev.visibleInDirection(direction) && this.isTaller(prev);
  }

  proc writeThis(ch: fileWriter) {
    ch.write(this.height:string, " ", 
    if visibleInDirection(Direction.Left) then "L" else "_",
    if visibleInDirection(Direction.Right) then "R" else "_",
    if visibleInDirection(Direction.Top) then "T" else "_",
    if visibleInDirection(Direction.Bottom) then "B" else "_");
  }
}

proc checkDirection(direction: Direction, slice, reversed:bool = false) {
  // first one is visible in this direction
  if !reversed then
    slice[slice.domain.low].setVisible(direction); 
  else 
    slice[slice.domain.high].setVisible(direction);
  
  var by_ = if reversed then -1 else 1;


  var r1 = slice.domain.low..slice.domain.high by by_;
  var r2 = if !reversed then slice.domain.low+1..slice.domain.high by by_
                        else slice.domain.low..slice.domain.high-1 by by_;
  
  for (prevIdx, currIdx) in 
      zip(r1, r2) {
    ref prev = slice[prevIdx];
    ref curr = slice[currIdx];
    if curr.checkVisisble(direction, prev) then
      curr.setVisible(direction);
    else
      break; // if not visible, nothing else will be viisble
  }
}

iter readLines(ch: fileReader) {
  var line: string;
  while ch.readLine(line, stripNewline=true) do yield line;
}
proc loadTrees(ch: fileReader) {
  var lines = readLines(ch);
  var rows = lines.size, cols = lines.first.size;
  
  var forestSpace = {0..<rows, 0..<cols};
  var forest = forall (r,c) in forestSpace do new Tree(lines[r][c]:int);
  return forest;
}

proc main() {
  var f = openreader(filename);
  var forest = loadTrees(f);

  writeln(forest);
  writeln();

  var forestD = forest.domain;

  forall c in forestD.low[0]..forestD.high[1] {
    checkDirection(Direction.Top, 
      forest[.., c]
    );
  }
  forall c in forestD.low[0]..forestD.high[1] {
    checkDirection(Direction.Bottom, 
      forest[.., c],
      true
    );
    // for some reason I cannot do 'by -1', so need special logic to go backwards
  }
  forall r in forestD.low[0]..forestD.high[0] {
    checkDirection(Direction.Left, 
      forest[r, ..]
    );
  }
  forall r in forestD.low[0]..forestD.high[0] {
    checkDirection(Direction.Right, 
      forest[r, ..]
      ,true
    );
  }

  writeln(forest);
  var numVisible = (+ reduce [t in forest] t.isVisible());
  writeln(numVisible, " are visible");

}
