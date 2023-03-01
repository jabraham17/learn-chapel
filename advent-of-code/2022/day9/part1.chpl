use IO, List, Set, Math;
config var filename = "rope.txt";


type Position = 2*(int); // row, col

var seenPositions: set(Position);

var headPos: Position = (1,1);
var tailPos: Position = (1,1);

enum Dir {R, U, L, D}
type Move = (Dir, int);

proc diff(a, b) {
  return if a > b then a - b else b - a;
}

proc findSign(a, b) return if a > b then 1 else -1;

//  after a move, update the tail
proc updateTail() {
  // if(tailPos == headPos) then return;
  // if tocuhing, no update needed
  // take advantage of promotion!
  // except promotion doesnt work on tuples :(
  if max(diff(tailPos[0], headPos[0]), diff(tailPos[1], headPos[1])) <= 1 then return;

  // if tail row or col == head row or col
  // and distance between nonmatching is greatder equal to than 2, bring tail closer
  if tailPos[0] == headPos[0] && diff(tailPos[1], headPos[1]) >= 2 {
    var sign = findSign(tailPos[1], headPos[1]);
    tailPos[1] = headPos[1] + sign;
    return;
  }
  if tailPos[1] == headPos[1] && diff(tailPos[0], headPos[0]) >= 2 {
    var sign = findSign(tailPos[0], headPos[0]);
    tailPos[0] = headPos[0] + sign;
    return;
  }

  // else diagonal case
  var sign0 = -findSign(tailPos[0], headPos[0]);
  var sign1 = -findSign(tailPos[1], headPos[1]);
  tailPos[0] += sign0;
  tailPos[1] += sign1;
  return;

}

proc updatePositions(move: Move, param print = false) {

  var num = move[1];
  // head[0] is row, head[1] is col
  while(num) {
    select move[0] {
      when Dir.R do headPos[1] += 1;
      when Dir.L do headPos[1] -= 1;
      when Dir.U do headPos[0] += 1;
      when Dir.D do headPos[0] -= 1;
    }
    updateTail();
    seenPositions.add(tailPos);
    if print {
      writeln("M=", move, " H=", headPos, " T=", tailPos);
    }

    num -= 1;
  }
}

iter nextMove(ch: fileReader): Move {
  var line: string;
  while(ch.readLine(line, stripNewline=true)) {
    var elms = line.split(" ");
    yield (elms[0]:Dir, elms[1]:int);
  }
}

var r = openReader(filename);

param doPrint = false;

for m in nextMove(r) {
  updatePositions(m, doPrint);
  if(doPrint) then writeln();
}
writeln("tail went to ", seenPositions.size, " unique places");
