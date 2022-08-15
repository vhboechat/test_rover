enum Direction {
  north,
  east,
  west,
  south;

  const Direction();

  Direction get turnLeft {
    switch (this) {
      case north:
        return Direction.west;
      case east:
        return Direction.north;
      case west:
        return Direction.south;
      default:
        return Direction.east;
    }
  }

  Direction get turnRight {
    switch (this) {
      case north:
        return Direction.east;
      case east:
        return Direction.south;
      case west:
        return Direction.north;
      default:
        return Direction.west;
    }
  }
}
