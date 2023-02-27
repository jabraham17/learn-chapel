use IO, List;
config var filename = "trees.txt";

iter readLines(ch: fileReader) {
  var line: string;
  while ch.readLine(line, stripNewline=true) do yield line;
}
proc loadTrees(ch: fileReader) {
  var lines = readLines(ch);
  var rows = lines.size, cols = lines.first.size;
  
  var forestSpace = {0..<rows, 0..<cols};
  var forest = forall (r,c) in forestSpace do lines[r][c]:int;
  return forest;
}


// each tree just needs to know about the 4 directions
// we dont need to keep track of state, it isnt depedant on a neighbot
// so if its taller than everyone in that direction, its visisble from that direction, period
proc isVisible((row, col): 2*int, forest) {
  var left = forest[row, ..<col];
  var right = forest[row, col+1..];
  var top = forest[..<row, col];
  var bottom = forest[row+1.., col];

  var height = forest[row, col];

  // must be greater than all trees in at least one direction
  return (&& reduce (height > left)) ||
         (&& reduce (height > right)) || 
         (&& reduce (height > top)) || 
         (&& reduce (height > bottom));
}

proc diff(a, b) {
  return if a > b then a - b else b - a;
}

proc findFirstBlocking(treeHeight, treeIdx, treeSlice, reversed=false) {
  var by_ = if reversed then -1 else 1;
  for idx in treeSlice.domain by by_ {
    if treeSlice[idx] >= treeHeight then return diff(treeIdx, idx);
  }
  return treeSlice.domain.size;
}

// solves part2
proc scenicScore((row, col): 2*int, forest) {
  var left = forest[row, ..<col];
  var right = forest[row, col+1..];
  var top = forest[..<row, col];
  var bottom = forest[row+1.., col];

  var height = forest[row, col];

  // must be greater than all trees in at least one direction

  var leftScore = findFirstBlocking(height, col, left, reversed=true);
  var rightScore = findFirstBlocking(height, col, right);
  var topScore = findFirstBlocking(height, row, top, reversed=true);
  var bottomScore = findFirstBlocking(height, row, bottom);
  // writeln(height, " ", row," ", col, "     T=", topScore, " L=", leftScore, " B=", bottomScore, " R=", rightScore);
  // writeln("left=", left);
  // writeln("right=", right);
  // writeln("top=", top);
  // writeln("bottom=", bottom);
  return leftScore * rightScore * topScore * bottomScore;
}

proc main() {
  var f = openreader(filename);
  var forest = loadTrees(f);

  // writeln(forest);
  var numVisible = (+ reduce [(r,c) in forest.domain] isVisible((r,c),forest):int);
  writeln(numVisible, " are visible");

  // var maxScore = scenicScore((1,2), forest);
  // scenicScore((3,2), forest);
  // scenicScore((2,2), forest);
  var maxScore = (max reduce [(r,c) in forest.domain] scenicScore((r,c),forest):int);
  writeln("Max sceneic score: ", maxScore);
}
