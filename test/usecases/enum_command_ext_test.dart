import 'package:flutter_test/flutter_test.dart';
import 'package:test_rover/helpers/helpers.dart';
import 'package:test_rover/ports/command_enum.dart';
import 'package:test_rover/usecases/enum_command_ext.dart';

void main() {
  test("Should return Commands.move when executing get(M) from CommandsExt",
      () {
    expect(CommandsExt.get("M"), Commands.move);
  });

  test("Should return Commands.move when executing get(m) from CommandsExt",
      () {
    expect(CommandsExt.get("m"), Commands.move);
  });

  test("Should return Commands.move when executing get( m ) from CommandsExt",
      () {
    expect(CommandsExt.get(" m "), Commands.move);
  });

  test("Should return Commands.turnLeft when executing get(L) from CommandsExt",
      () {
    expect(CommandsExt.get("L"), Commands.turnLeft);
  });

  test("Should return Commands.turnLeft when executing get(l) from CommandsExt",
      () {
    expect(CommandsExt.get("l"), Commands.turnLeft);
  });

  test(
      "Should return Commands.turnLeft when executing get( l ) from CommandsExt",
      () {
    expect(CommandsExt.get(" l "), Commands.turnLeft);
  });

  test("Should return Commands.turnLeft when executing get(R) from CommandsExt",
      () {
    expect(CommandsExt.get("R"), Commands.turnRight);
  });

  test("Should return Commands.turnLeft when executing get(r) from CommandsExt",
      () {
    expect(CommandsExt.get("r"), Commands.turnRight);
  });

  test(
      "Should return Commands.turnLeft when executing get( r ) from CommandsExt",
      () {
    expect(CommandsExt.get(" r "), Commands.turnRight);
  });

  test("Should throw TestRoverError.noCommand if no command is given", () {
    expect(() => CommandsExt.get(""), throwsA(TestRoverError.noCommand));
  });

  test("Should throw TestRoverError.invalidCommand if command is invalid", () {
    expect(() => CommandsExt.get("a"), throwsA(TestRoverError.invalidCommand));
  });
}
