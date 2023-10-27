import 'package:flutter/material.dart';
import 'package:gmail/gerenal_tab.dart';
import 'package:gmail/signature_screen.dart';
import 'package:gmail/stars_screen.dart';

import 'language_phone_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  GeneralTabScreen(),
    );
  }
}