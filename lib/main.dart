import 'package:flutter/material.dart';
import 'package:swing_sheet/utilities/appColors.dart';
import 'package:swing_sheet/views/splashScreenView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: redColor),
        useMaterial3: false,
      ),
      home: const SplashScreenView(),
    );
  }
}
