var line = "hello world";

var elms = line.split(" ");
writeln(elms[1]); // prints 'world', accesing second element
writeln(line.split(" ")[1]); // prints 'e o', promoting `[1]` to both elements
