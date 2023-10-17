import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Second_Screen extends StatefulWidget {
  const Second_Screen({super.key});

  @override
  State<Second_Screen> createState() => _Second_ScreenState();
}

class _Second_ScreenState extends State<Second_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(children: [
        Center(
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  Get.back();
                });
              },
              child: Text("back")),
        )
      ]),
    );
  }
}
