import 'package:equatable/equatable.dart';

import './../helpers/helpers.dart';

class Plateau extends Equatable {
  final int minY;
  final int minX;
  final int maxY;
  final int maxX;

  Plateau({
    required this.maxX,
    required this.maxY,
    this.minX = 0,
    this.minY = 0,
  }) {
    if (maxX < minX || maxY < minY) {
      throw TestRoverError.notAllowedCoordinates;
    }
  }

  @override
  List<Object> get props => [
        minY,
        minX,
        maxY,
        maxX,
      ];
}
