import 'package:flutter/material.dart';
import 'package:swing_sheet/utilities/appColors.dart';
import 'package:swing_sheet/utilities/commonOutlinedButton.dart';
import 'package:swing_sheet/views/registrationViews/signupScreenView.dart';

class SelectRoleScreenView extends StatelessWidget {
  const SelectRoleScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.1),
              Image.asset(
                "assets/images/appBanner.png",
                height: screenHeight * 0.25,
                width: screenWidth * 0.5,
              ),
              SizedBox(height: screenHeight * 0.1),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreenView(),
                      ));
                },
                child: commonOutlinedButton(
                  context: context,
                  label: "Register as Student",
                  color: blackColor,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreenView(),
                      ));
                },
                child: commonOutlinedButton(
                  context: context,
                  label: "Register as Instructor",
                  color: blackColor,
                ),
              ),
              SizedBox(height: screenHeight * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
