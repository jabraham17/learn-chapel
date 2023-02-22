use IO;
use IO.FormattedIO;
config var filename = "signal.txt";
config var nDistinct = 4; // set to 14 for part 2
proc main()
{
  var r = openreader(filename);

  var window: [1..nDistinct] bytes;
  // ref lastByte = window[window.domain.high];
  for w in window do r.readBytes(w,1);
  var idx = nDistinct;
  do {
    var set: domain(bytes);
    set += window;
    writeln(idx, " ", window);
    if(set.size == window.size) {
      break;
    }
    // slide window and read next char
    // cant do this because its a coforall, not guarneteed to be in order 
    // window[window.domain.low..window.domain.high-1] = window[window.domain.low+1..window.domain.high];
    for (lhs, rhs) in zip(window[..window.domain.high-1], window[window.domain.low+1..])do
    lhs = rhs;

    idx+=1;
  }
  while(r.readBytes(window[window.domain.high], 1));
  writeln("Marker after ", idx);
  

}
