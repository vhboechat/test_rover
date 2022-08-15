import './usecases.dart';
import './../entities/entities.dart';
import './../helpers/helpers.dart';
import './../ports/ports.dart';

class CommandRetrive implements IRetrieveCommand {
  List<String> _inputCommads = [];

  @override
  set inputCommands(List<String> value) => _inputCommads = value;

  @override
  List<CommandRover> retrive() {
    if (_inputCommads.isEmpty) {
      throw TestRoverError.noCommand;
    }

    if (_inputCommads.length < 3) {
      throw TestRoverError.badlyFormattedInput;
    }

    List<CommandRover> result = [];

    try {
      final plateau = _makePlateau(_inputCommads[0]);

      for (var i = 1; i < _inputCommads.length;) {
        Map<String, dynamic> position = _makePositionRover(_inputCommads[i]);
        List<Commands> commands = _makeCommandsRover(_inputCommads[i + 1]);
        i = i + 2;

        result.add(CommandRover(
          id: i,
          plateauMaxX: plateau.maxX,
          plateauMaxY: plateau.maxY,
          roverX: position["x"],
          roverY: position["y"],
          direction: position["direction"],
          commands: commands,
        ));
      }
    } catch (error) {
      throw TestRoverError.badlyFormattedInput;
    }

    return result;
  }

  Plateau _makePlateau(String value) {
    value = value.trim();
    List<String> coordinates = value.split(" ");

    return Plateau(
      maxX: int.parse(coordinates[0]),
      maxY: int.parse(coordinates[1]),
    );
  }

  Map<String, dynamic> _makePositionRover(String value) {
    value = value.trim();
    List<String> dataRover = value.split(" ");

    return {
      "x": int.parse(dataRover[0]),
      "y": int.parse(dataRover[1]),
      "direction": DirectionExt.get(dataRover[2]),
    };
  }

  List<Commands> _makeCommandsRover(String value) {
    List<Commands> result = [];

    value = value.toUpperCase().replaceAll(" ", "");
    for (var c in value.runes) {
      var ch = String.fromCharCode(c);
      result.add(CommandsExt.get(ch));
    }

    return result;
  }
}
