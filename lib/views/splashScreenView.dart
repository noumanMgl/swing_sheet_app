import 'dart:async';
import 'package:flutter/material.dart';
import 'package:swing_sheet/utilities/appColors.dart';
import 'package:swing_sheet/views/registrationViews/signInScreenView.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const SignInScreenView(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: whiteColor,
      body: Center(
        child: Image(
          image: const AssetImage("assets/images/splashLogo.png"),
          height: screenHeight * 0.15,
          width: screenWidth * 0.3,
        ),
      ),
    );
  }
}
