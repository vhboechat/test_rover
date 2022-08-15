import 'package:flutter/material.dart';

import './helpers/helpers.dart';
import './usecases/usecases.dart';
import './ports/ports.dart';
import './factories/factories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _controller = TextEditingController();
  String _output = "";

  @override
  void initState() {
    super.initState();

    String cmd = "5 5/n1 2 N/nLMLMLMLMM/n3 3 E/nMMRMMRMRRM";

    _controller.text = cmd;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rover Test",
      theme: ThemeData(primaryColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: _widget(context),
    );
  }

  Widget _widget(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextFormField(
          controller: _controller,
        ),
        TextButton(
            child: const Text("Send"),
            onPressed: () {
              setState(() {
                _send();
              });
            }),
        Text(_output),
      ]),
    );
  }

  void _send() {
    _output = "";

    try {
      List<String> cmd = _controller.text.split("/n");

      IRetrieveCommand retrieveCommand = makeRetrieveCommand();
      ISendCommand sendCommand = makeSendCommand();
      IValidateRoute validateRoute = makeValidadeRoute();

      retrieveCommand.inputCommands = cmd;

      CommandCenterUseCase centerUseCase = CommandCenterUseCase(
        retrieveCommand: retrieveCommand,
        sendCommand: sendCommand,
        validateRoute: validateRoute,
      );

      centerUseCase.init();
    } catch (error) {
      if (error is TestRoverError) {
        _output = error.message;
      } else {
        _output = error.toString();
      }
    }
  }
}
