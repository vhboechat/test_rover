import 'package:test_rover/entities/entities.dart';
import 'package:test_rover/helpers/helpers.dart';
import 'package:test_rover/ports/command_enum.dart';
import 'package:test_rover/ports/command_rover.dart';
import 'package:test_rover/ports/validate_route.dart';

class ValidadeRoute implements IValidateRoute {
  @override
  void validate(
    List<CommandRover> commandRovers,
  ) {
    for (var commandRover in commandRovers) {
      for (Commands commands in commandRover.commands) {
        switch (commands) {
          case Commands.move:
            commandRover.rover.move();
            break;
          case Commands.turnRight:
            commandRover.rover.turnRight();
            break;
          case Commands.turnLeft:
            commandRover.rover.turnLeft();
            break;
          default:
            throw TestRoverError.unexpected;
        }

        bool collision = commandRovers
            .where((element) => (element.rover.id != commandRover.rover.id &&
                element.rover.positionX != commandRover.rover.positionX &&
                element.rover.positionY != commandRover.rover.positionY))
            .isNotEmpty;

        if (collision) {
          throw TestRoverError.collisionCourse;
        }
      }
    }
  }
}
