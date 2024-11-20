import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swing_sheet/utilities/appColors.dart';
import 'package:swing_sheet/utilities/commonOutlinedButton.dart';
import 'package:swing_sheet/utilities/inputTextField.dart';
import 'package:swing_sheet/utilities/textStyles.dart';

class InviteStudentScreenView extends StatefulWidget {
  const InviteStudentScreenView({super.key});

  @override
  State<InviteStudentScreenView> createState() =>
      _InviteStudentScreenViewState();
}

class _InviteStudentScreenViewState extends State<InviteStudentScreenView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: blackColor,
        title: Image.asset(
          "assets/images/appBanner.png",
          width: screenWidth * 0.5,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.profile_circled),
          ),
        ],
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Invite New Student",
                          style: textStyleH3(blackColor)),
                      SizedBox(height: screenHeight * 0.02),
                      Text("First Name", style: textStyleBold(blackColor)),
                      SizedBox(height: screenHeight * 0.01),
                      inputTextField(
                        context,
                        CupertinoIcons.person_fill,
                        "First Name...",
                        _emailController,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text("Last Name", style: textStyleBold(blackColor)),
                      SizedBox(height: screenHeight * 0.01),
                      inputTextField(
                        context,
                        CupertinoIcons.person_fill,
                        "Last Name...",
                        _passwordController,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text("Email", style: textStyleBold(blackColor)),
                      SizedBox(height: screenHeight * 0.01),
                      inputTextField(
                        context,
                        CupertinoIcons.mail_solid,
                        "Email...",
                        _emailController,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text("Contact No.", style: textStyleBold(blackColor)),
                      SizedBox(height: screenHeight * 0.01),
                      inputTextField(
                        context,
                        CupertinoIcons.phone_fill,
                        "Contact No...",
                        _passwordController,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              "The user will be notified of your invitation",
                              style: textStyleRegular(),
                            ),
                            Text(
                              "via email and SMS.",
                              style: textStyleRegular(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: whiteColor,
              padding: EdgeInsets.all(screenHeight * 0.02),
              child: InkWell(
                onTap: () {},
                child: commonOutlinedButton(
                  context: context,
                  label: "Save",
                  color: blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
