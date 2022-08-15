import 'package:equatable/equatable.dart';

import './command_enum.dart';
import './../entities/entities.dart';

class CommandRover extends Equatable {
  late final Rover rover;
  late final List<Commands> commands;

  CommandRover({
    required int id,
    required int plateauMaxX,
    required int plateauMaxY,
    required int roverX,
    required int roverY,
    required Direction direction,
    required this.commands,
  }) {
    rover = Rover(
      id: id,
      direction: direction,
      plateau: Plateau(
        maxX: plateauMaxX,
        maxY: plateauMaxY,
      ),
      x: roverX,
      y: roverY,
    );
  }

  @override
  List<Object?> get props => [rover, commands];
}
