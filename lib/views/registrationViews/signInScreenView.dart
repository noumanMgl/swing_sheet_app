import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swing_sheet/utilities/appColors.dart';
import 'package:swing_sheet/utilities/commonOutlinedButton.dart';
import 'package:swing_sheet/utilities/inputTextField.dart';
import 'package:swing_sheet/utilities/textStyles.dart';
import 'package:swing_sheet/views/homeScreenView.dart';
import 'package:swing_sheet/views/registrationViews/selectRoleScreenView.dart';

class SignInScreenView extends StatefulWidget {
  const SignInScreenView({super.key});

  @override
  State<SignInScreenView> createState() => _SignInScreenViewState();
}

class _SignInScreenViewState extends State<SignInScreenView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: whiteColor,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  Image.asset(
                    "assets/images/appLogo.png",
                    height: screenHeight * 0.15,
                    width: screenWidth * 0.3,
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      style: textStyleBold(blackColor),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  inputTextField(context, CupertinoIcons.mail_solid, "Email...",
                      _emailController),
                  SizedBox(height: screenHeight * 0.03),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Access Code",
                      style: textStyleBold(blackColor),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  inputTextField(context, CupertinoIcons.eye_slash_fill,
                      "********", _passwordController),
                  SizedBox(height: screenHeight * 0.03),
                  Expanded(
                    child: SizedBox(),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreenView(
                              isInstructor: false,
                            ),
                          ));
                    },
                    child: commonOutlinedButton(
                      context: context,
                      label: "Login",
                      color: blackColor,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Text(
                    "Already have an account?",
                    style: textStyleRegular(),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectRoleScreenView(),
                          ));
                    },
                    child: commonOutlinedButton(
                      context: context,
                      label: "Register",
                      color: redColor,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
