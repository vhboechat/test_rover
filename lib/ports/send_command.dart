import 'command_rover.dart';

abstract class ISendCommand {
  void send(CommandRover currentRoverPosition);
}
