//https://adventofcode.com/2022/day/2#part2
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
    when 'A' do return shape.Rock;
    when 'B' do return shape.Paper;
    when 'C' do return shape.Scissors;
  }
  return shape.None;
}

proc winning_move(opponent:shape) {
  select opponent {
    when shape.Rock do return shape.Paper;
    when shape.Paper do return shape.Scissors;
    when shape.Scissors do return shape.Rock;
  }
  return shape.None;
}
proc losing_move(opponent:shape) {
  select opponent {
    when shape.Rock do return shape.Scissors;
    when shape.Paper do return shape.Rock;
    when shape.Scissors do return shape.Paper;
  }
  return shape.None;
}
proc deduce_action(opponent:shape, action:string) {
  select action {
    when 'X' {
      // LOSE
      return losing_move(opponent);
    }
    when 'Y' {
      // DRAW
      return opponent;
    }
    when 'Z' {
      // WIN
      return winning_move(opponent);
    }
  }
  return shape.None;
}

proc parse_round(line) {
  // cant do the vector promotion
  // return parse_shape(line.split(" ", maxsplit=1));
  var elms = line.strip().split(" ", maxsplit=1);
  var opp = parse_shape(elms[0]);

  return (opp, deduce_action(opp, elms[1]));
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
