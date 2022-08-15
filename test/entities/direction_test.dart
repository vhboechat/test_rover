import 'package:flutter_test/flutter_test.dart';
import 'package:test_rover/entities/direction.dart';

void main() {
  test("Ensure that when turning to the left the return occurs correctly", () {
    Direction direction = Direction.north;

    direction = direction.turnLeft;
    expect(direction, Direction.west);

    direction = direction.turnLeft;
    expect(direction, Direction.south);

    direction = direction.turnLeft;
    expect(direction, Direction.east);

    direction = direction.turnLeft;
    expect(direction, Direction.north);
  });

  test("Ensure that when turning to the right the return occurs correctly", () {
    Direction direction = Direction.north;

    direction = direction.turnRight;
    expect(direction, Direction.east);

    direction = direction.turnRight;
    expect(direction, Direction.south);

    direction = direction.turnRight;
    expect(direction, Direction.west);

    direction = direction.turnRight;
    expect(direction, Direction.north);
  });
}
