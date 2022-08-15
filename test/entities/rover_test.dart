import 'package:flutter_test/flutter_test.dart';
import 'package:test_rover/entities/entities.dart';
import 'package:test_rover/helpers/helpers.dart';

void main() {
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
  test("Ensures executing commands to set the values correctly", () {
    Plateau plateau = Plateau(maxX: 5, maxY: 5);
    Rover rover =
        Rover(plateau: plateau, direction: Direction.north, x: 1, y: 2, id: 0);

    rover.turnLeft();
    rover.move();

    rover.turnLeft();
    rover.move();

    rover.turnLeft();
    rover.move();

    rover.turnLeft();
    rover.move();

    rover.move();

    expect(rover,
        Rover(plateau: plateau, direction: Direction.north, x: 1, y: 3, id: 0));

    Rover rover2 =
        Rover(plateau: plateau, direction: Direction.east, x: 3, y: 3, id: 0);

    rover2.move();
    rover2.move();
    rover2.turnRight();
    rover2.move();
    rover2.move();
    rover2.turnRight();
    rover2.move();
    rover2.turnRight();
    rover2.turnRight();
    rover2.move();

    expect(rover2,
        Rover(plateau: plateau, direction: Direction.east, x: 5, y: 1, id: 0));
  });

  test(
      "Ensures that TestRoverError.notAllowedCoordinates is returned when leaving the plateau area",
      () {
    Plateau plateau = Plateau(maxX: 5, maxY: 5);
    Rover rover =
        Rover(plateau: plateau, direction: Direction.north, x: 2, y: 5, id: 0);

    expect(() => rover.move(), throwsA(TestRoverError.notAllowedCoordinates));

    rover =
        Rover(plateau: plateau, direction: Direction.east, x: 5, y: 2, id: 0);

    expect(() => rover.move(), throwsA(TestRoverError.notAllowedCoordinates));

    rover =
        Rover(plateau: plateau, direction: Direction.west, x: 0, y: 2, id: 0);

    expect(() => rover.move(), throwsA(TestRoverError.notAllowedCoordinates));

    rover =
        Rover(plateau: plateau, direction: Direction.south, x: 2, y: 0, id: 0);

    expect(() => rover.move(), throwsA(TestRoverError.notAllowedCoordinates));
  });
}
