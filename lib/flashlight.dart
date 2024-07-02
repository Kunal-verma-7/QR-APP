import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class Flashlight extends StatefulWidget {
  const Flashlight({super.key});

  @override
  State<Flashlight> createState() => FflashlightState();
}

class FflashlightState extends State<Flashlight> {
  final torchController = TorchController();
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: IconButton(
          onPressed: () {
            torchController.toggle();
            isOn = !isOn;
            setState(() {});
          },
          icon: Icon(Icons.flash_on),
        ),
      ),
    );
  }
}
