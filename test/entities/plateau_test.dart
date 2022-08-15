import 'package:flutter_test/flutter_test.dart';
import 'package:test_rover/entities/plateau.dart';
import 'package:test_rover/helpers/helpers.dart';

void main() {
  test("Ensure it returns an error when passing incorrect parameters (1)", () {
    try {
      Plateau(
        maxX: -1,
        maxY: 0,
        minX: 0,
        minY: 0,
      );

      throw Exception();
    } catch (error) {
      expect(error, TestRoverError.notAllowedCoordinates);
    }
  });

  test("Ensure it returns an error when passing incorrect parameters (2)", () {
    try {
      Plateau(
        maxX: 0,
        maxY: -1,
        minX: 0,
        minY: 0,
      );

      throw Exception();
    } catch (error) {
      expect(error, TestRoverError.notAllowedCoordinates);
    }
  });

  test("Ensure it returns an error when passing incorrect parameters (3)", () {
    try {
      Plateau(
        maxX: 10,
        maxY: 5,
        minX: 11,
        minY: 5,
      );

      throw Exception();
    } catch (error) {
      expect(error, TestRoverError.notAllowedCoordinates);
    }
  });

  test("Ensure it returns an error when passing incorrect parameters (4)", () {
    try {
      Plateau(
        maxX: 5,
        maxY: 5,
        minX: 5,
        minY: 6,
      );

      throw Exception();
    } catch (error) {
      expect(error, TestRoverError.notAllowedCoordinates);
    }
  });

  test("Ensure it does not return an error when passing the correct parameters",
      () {
    Plateau plateau = Plateau(
      maxX: 10,
      maxY: 5,
      minX: 10,
      minY: 5,
    );

    expect(plateau.maxX, 10);
    expect(plateau.maxY, 5);
    expect(plateau.minX, 10);
    expect(plateau.minY, 5);
  });
}
