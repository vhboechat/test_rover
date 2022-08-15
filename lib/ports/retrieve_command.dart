import 'command_rover.dart';

abstract class IRetrieveCommand {
  List<CommandRover> retrive();

  set inputCommands(List<String> value);
}
