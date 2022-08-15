enum TestRoverError {
  unexpected("Unexpected error"),
  noDirection("No direction was given"),
  noCommand("No command was given"),
  invalidDirection("The given direction is invalid"),
  invalidCommand("The given command is invalid"),
  notAllowedCoordinates("Not allowed coordinates"),
  badlyFormattedInput("badly formatted input"),
  collisionCourse("Impending collision course");

  final String message;
  const TestRoverError(this.message);
}
