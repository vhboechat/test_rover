import 'package:flutter_test/flutter_test.dart';
import 'package:test_rover/entities/entities.dart';
import 'package:test_rover/helpers/helpers.dart';
import 'package:test_rover/usecases/enum_direction_ext.dart';

void main() {
  test("Should return Direction.north when executing get(N) from DirectionExt",
      () {
    expect(DirectionExt.get("N"), Direction.north);
  });

  test("Should return Direction.north when executing get(n) from DirectionExt",
      () {
    expect(DirectionExt.get("n"), Direction.north);
  });

  test(
      "Should return Direction.north when executing get( n ) from DirectionExt",
      () {
    expect(DirectionExt.get(" n "), Direction.north);
  });

  test("Should return Direction.east when executing get(E) from DirectionExt",
      () {
    expect(DirectionExt.get("E"), Direction.east);
  });

  test("Should return Direction.east when executing get(e) from DirectionExt",
      () {
    expect(DirectionExt.get("e"), Direction.east);
  });

  test("Should return Direction.east when executing get( e ) from DirectionExt",
      () {
    expect(DirectionExt.get(" e "), Direction.east);
  });

  test("Should return Direction.south when executing get(S) from DirectionExt",
      () {
    expect(DirectionExt.get("S"), Direction.south);
  });

  test("Should return Direction.south when executing get(s) from DirectionExt",
      () {
    expect(DirectionExt.get("s"), Direction.south);
  });

  test(
      "Should return Direction.south when executing get( s ) from DirectionExt",
      () {
    expect(DirectionExt.get(" s "), Direction.south);
  });

  test("Should return Direction.west when executing get(W) from DirectionExt",
      () {
    expect(DirectionExt.get("W"), Direction.west);
  });

  test("Should return Direction.west when executing get(w) from DirectionExt",
      () {
    expect(DirectionExt.get("w"), Direction.west);
  });

  test("Should return Direction.west when executing get( w ) from DirectionExt",
      () {
    expect(DirectionExt.get(" w "), Direction.west);
  });

  test("Should throw TestRoverError.noDirection if no command is given", () {
    expect(() => DirectionExt.get(""), throwsA(TestRoverError.noDirection));
  });

  test("Should throw TestRoverError.invalidDirection if command is invalid",
      () {
    expect(
        () => DirectionExt.get("a"), throwsA(TestRoverError.invalidDirection));
  });
}
