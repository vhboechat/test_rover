import 'package:flutter_test/flutter_test.dart';
import 'package:test_rover/entities/direction.dart';
import 'package:test_rover/helpers/helpers.dart';
import 'package:test_rover/ports/command_enum.dart';
import 'package:test_rover/ports/command_rover.dart';
import 'package:test_rover/usecases/command_retrive.dart';

void main() {
  test("Must convert input into correct commands", () {
    /*
    Test Input
    5 5
    1 2 N
    LMLMLMLMM
    3 3 E
    MMRMMRMRRM
    Expected Output
    1 3 N
    5 1 E
    */

    CommandRetrive retrive = CommandRetrive();
    retrive.inputCommands = [
      "5 5",
      "1 2 N",
      "LMLMLMLMM",
      "3 3 E",
      "MMRMMRMRRM"
    ];

    List<CommandRover> expected = [];
    expected.add(CommandRover(
      id: 3,
      plateauMaxX: 5,
      plateauMaxY: 5,
      roverX: 1,
      roverY: 2,
      direction: Direction.north,
      commands: const [
        Commands.turnLeft,
        Commands.move,
        Commands.turnLeft,
        Commands.move,
        Commands.turnLeft,
        Commands.move,
        Commands.turnLeft,
        Commands.move,
        Commands.move,
      ],
    ));

    expected.add(CommandRover(
      id: 5,
      plateauMaxX: 5,
      plateauMaxY: 5,
      roverX: 3,
      roverY: 3,
      direction: Direction.east,
      commands: const [
        Commands.move,
        Commands.move,
        Commands.turnRight,
        Commands.move,
        Commands.move,
        Commands.turnRight,
        Commands.move,
        Commands.turnRight,
        Commands.turnRight,
        Commands.move,
      ],
    ));

    expect(retrive.retrive(), expected);
  });

  test("Should throw TestRoverError.noCommand if no command is sent", () {
    CommandRetrive retrive = CommandRetrive();
    retrive.inputCommands = [
      "5 5",
      "1 2 N",
      "AMLMLMLMM",
      "3 3 E",
      "MMRMMRMRRM"
    ];

    expect(
        () => retrive.retrive(), throwsA(TestRoverError.badlyFormattedInput));

    retrive.inputCommands = [
      "5 5",
      "1 2 N",
      "AMLMLMLMM",
      "3 3 E",
    ];

    expect(
        () => retrive.retrive(), throwsA(TestRoverError.badlyFormattedInput));

    retrive.inputCommands = [
      "5 5",
      "1 2 U",
      "AMLMLMLMM",
      "3 3 E",
      "MMRMMRMRRM"
    ];

    expect(
        () => retrive.retrive(), throwsA(TestRoverError.badlyFormattedInput));

    retrive.inputCommands = [
      "5 5",
    ];

    expect(
        () => retrive.retrive(), throwsA(TestRoverError.badlyFormattedInput));
  });
}
