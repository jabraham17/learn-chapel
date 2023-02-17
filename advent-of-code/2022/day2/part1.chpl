//https://adventofcode.com/2022/day/2
use IO;

enum shape {Rock=1, Paper=2, Scissors=3, None}

proc score_round(opponent: shape, me: shape) {
  // score from shape choice  
  var score:int = me:int;
  if opponent == me {
    // draw
    score += 3;
  }
  else {
    // i win
    select opponent {
      when shape.Rock do if me == shape.Paper then score += 6;
      when shape.Paper do if me == shape.Scissors then score += 6;
      when shape.Scissors do if me == shape.Rock then score += 6;
    }
  }
  return score;
}
proc parse_shape(c): shape {
  select c {
    when 'A', 'X' do return shape.Rock;
    when 'B', 'Y' do return shape.Paper;
    when 'C', 'Z' do return shape.Scissors;
  }
  return shape.None;
}
proc parse_round(line) {
  // cant do the vector promotion
  // return parse_shape(line.split(" ", maxsplit=1));
  var elms = line.strip().split(" ", maxsplit=1);
  return (parse_shape(elms[0]), parse_shape(elms[1]));
}

iter read_rounds(filename) {
  var f = open(filename, ioMode.r);
  var r = f.reader();
  for l in r.lines() {
    var (opponent, me) = parse_round(l);
    yield score_round(opponent, me);
  }
}

config var filename = "strategy.txt";
var score = + reduce read_rounds(filename);
writeln("Score is ", score);
