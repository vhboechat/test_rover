import 'package:equatable/equatable.dart';

import './direction.dart';
import './plateau.dart';
import './../helpers/helpers.dart';

class Rover extends Equatable {
  final int id;
  int _positionX = 0;
  int _positionY = 0;
  late final Plateau plateau;
  late Direction _direction;

  Rover({
    required this.id,
    int x = 0,
    int y = 0,
    required this.plateau,
    required Direction direction,
  }) {
    if (x > plateau.maxX ||
        x < plateau.minX ||
        y > plateau.maxX ||
        y < plateau.minY) {
      throw TestRoverError.notAllowedCoordinates;
    }

    _positionX = x;
    _positionY = y;
    _direction = direction;
  }

  int get positionX => _positionX;
  int get positionY => _positionY;
  Direction get direction => _direction;

  void move() {
    int x = _positionX;
    int y = _positionY;

    if (_direction == Direction.north) {
      y++;
    } else if (_direction == Direction.south) {
      y--;
    } else if (_direction == Direction.east) {
      x++;
    } else {
      x--;
    }

    if (plateau.maxX < x ||
        plateau.minX > x ||
        plateau.maxY < y ||
        plateau.minY > y) {
      throw TestRoverError.notAllowedCoordinates;
    }

    _positionX = x;
    _positionY = y;
  }

  void turnLeft() => _direction = direction.turnLeft;

  void turnRight() => _direction = direction.turnRight;

  @override
  List<Object> get props => [
        id,
        _positionX,
        _positionY,
        plateau,
        _direction,
      ];
}
