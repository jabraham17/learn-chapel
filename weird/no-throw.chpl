proc foo(shouldThrow: bool) throws {
	if shouldThrow then new Error("test");
}
proc main() {
  writeln(foo(true));
}
