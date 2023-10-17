import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_labs/Second_Screen.dart';


class First_Screen extends StatefulWidget {
  const First_Screen({super.key});

  @override
  State<First_Screen> createState() => _First_ScreenState();
}

class _First_ScreenState extends State<First_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,

      body: Column(children: [Center(
        child: ElevatedButton(onPressed: () {
          setState(() {
            Get.to(Second_Screen());
          });
        }, child: Text("Submit")),
      )]),
    );
  }
}