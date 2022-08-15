import './../helpers/helpers.dart';
import './../ports/ports.dart';

extension CommandsExt on Commands {
  String get code {
    switch (this) {
      case Commands.turnLeft:
        return "L";
      case Commands.turnRight:
        return "R";
      default:
        return "M";
    }
  }

  static Commands get(String code) {
    code = code.trim().toUpperCase();

    if (code.isEmpty) {
      throw TestRoverError.noCommand;
    }

    for (var command in Commands.values) {
      if (command.code == code) {
        return command;
      }
    }

    throw TestRoverError.invalidCommand;
  }
}
