import 'package:test_rover/helpers/helpers.dart';

import './usecases.dart';
import './../ports/ports.dart';

class CommandSend implements ISendCommand {
  @override
  void send(CommandRover currentRoverPosition) {
    for (var commands in currentRoverPosition.commands) {
      switch (commands) {
        case Commands.move:
          currentRoverPosition.rover.move();
          break;
        case Commands.turnRight:
          currentRoverPosition.rover.turnRight();
          break;
        case Commands.turnLeft:
          currentRoverPosition.rover.turnLeft();
          break;
        default:
          throw TestRoverError.unexpected;
      }
    }

    int x = currentRoverPosition.rover.positionX;
    int y = currentRoverPosition.rover.positionY;
    String d = DirectionExt.getCode(currentRoverPosition.rover.direction);

    print("$x $y $d");
  }
}
