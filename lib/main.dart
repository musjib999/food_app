import 'package:flutter/material.dart';
import 'package:food_app/shared/auth/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xff3eb165),
      ),
      home: const Signin(),
    );
  }
}
