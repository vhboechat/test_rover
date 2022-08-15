import 'package:test_rover/ports/command_rover.dart';

abstract class IValidateRoute {
  void validate(
    List<CommandRover> commandRovers,
  );
}
