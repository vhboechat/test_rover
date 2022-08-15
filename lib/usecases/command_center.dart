import 'package:test_rover/ports/validate_route.dart';

import '../ports/ports.dart';

class CommandCenterUseCase {
  final IRetrieveCommand retrieveCommand;
  final ISendCommand sendCommand;
  final IValidateRoute validateRoute;

  CommandCenterUseCase({
    required this.retrieveCommand,
    required this.sendCommand,
    required this.validateRoute,
  });

  /*
  Validation is performed before sending the command to Rover
  */
  void init() {
    final List<CommandRover> rovers = retrieveCommand.retrive();

    validateRoute.validate(rovers);

    for (var rover in rovers) {
      sendCommand.send(rover);
    }
  }
}
