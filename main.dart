import 'package:flutter/material.dart';
import 'package:mad_labs/First_Screen.dart';
import 'package:get/get.dart';
import 'package:mad_labs/Second_Screen.dart';
import 'package:mad_labs/asynchronous.dart';
import 'package:mad_labs/google_map.dart';
import 'package:mad_labs/provider_test.dart';
import 'package:mad_labs/signup_Screen.dart';
import 'package:provider/provider.dart';

void main() {
  ChangeNotifierProvider(
    create: (context) => TodoNotifier(),
    child: const MyApp(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/fourth',
      getPages: [
        GetPage(name: '/', page: () => First_Screen()),
        GetPage(name: '/second', page: () => Second_Screen()),
        GetPage(name: '/third', page: () => ClockApp()),
        GetPage(name: '/fourth', page: () => SignupScreen()),
        
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
