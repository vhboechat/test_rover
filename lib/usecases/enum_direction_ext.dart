import './../entities/direction.dart';
import './../helpers/helpers.dart';

extension DirectionExt on Direction {
  String get code => getCode(this);

  static Direction get(String code) {
    code = code.trim().toUpperCase();

    if (code.isEmpty) {
      throw TestRoverError.noDirection;
    }

    for (var direction in Direction.values) {
      if (direction.code == code) {
        return direction;
      }
    }

    throw TestRoverError.invalidDirection;
  }

  static String getCode(Direction direction) {
    switch (direction) {
      case Direction.north:
        return "N";
      case Direction.east:
        return "E";
      case Direction.west:
        return "W";
      default:
        return "S";
    }
  }
}
