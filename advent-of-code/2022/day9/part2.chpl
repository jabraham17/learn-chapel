// part 2 also elegantly solves part1, and technically any sized rope:)

use IO, List, Set, Math;
config var filename = "rope.txt";

type Position = 2*(int); // row, col
var seenPositions: set(Position);

enum Dir {R, U, L, D}
type Move = (Dir, int);

config var nSections = 10;

type Rope = [0..<nSections]Position;

proc diff(a, b) {
  return if a > b then a - b else b - a;
}
proc findSign(a, b) return if a > b then 1 else -1;



//  after a move, update the tail
proc updateSection(ref follower: Position, const leader: Position) {
  // if(follower == leader) then return;
  // if tocuhing, no update needed
  // take advantage of promotion!
  // except promotion doesnt work on tuples :(
  if max(diff(follower[0], leader[0]), diff(follower[1], leader[1])) <= 1 then return;

  // if tail row or col == head row or col
  // and distance between nonmatching is greatder equal to than 2, bring tail closer
  if follower[0] == leader[0] && diff(follower[1], leader[1]) >= 2 {
    var sign = findSign(follower[1], leader[1]);
    follower[1] = leader[1] + sign;
    return;
  }
  if follower[1] == leader[1] && diff(follower[0], leader[0]) >= 2 {
    var sign = findSign(follower[0], leader[0]);
    follower[0] = leader[0] + sign;
    return;
  }

  // else diagonal case
  var sign0 = -findSign(follower[0], leader[0]);
  var sign1 = -findSign(follower[1], leader[1]);
  follower[0] += sign0;
  follower[1] += sign1;
  return;

}


proc updatePositions(ref rope: Rope, move: Move) {

  var num = move[1];
  // head[0] is row, head[1] is col

  ref headPos = rope[rope.domain.low];
  ref tailPos = rope[rope.domain.high];

  while(num) {
    select move[0] {
      when Dir.R do headPos[1] += 1;
      when Dir.L do headPos[1] -= 1;
      when Dir.U do headPos[0] += 1;
      when Dir.D do headPos[0] -= 1;
    }
    for (leaderIdx, followerIdx) in 
      zip({rope.domain.low..<rope.domain.high},{rope.domain.low+1..rope.domain.high})
      do updateSection(rope[followerIdx], rope[leaderIdx]);

    seenPositions.add(tailPos);

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

var rope: Rope = (1,1); // promotion to everyone

for m in nextMove(r) {
  updatePositions(rope, m);
}
writeln("tail went to ", seenPositions.size, " unique places");
