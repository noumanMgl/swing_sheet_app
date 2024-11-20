import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swing_sheet/utilities/appColors.dart';
import 'package:swing_sheet/utilities/commonOutlinedButton.dart';
import 'package:swing_sheet/utilities/inputTextField.dart';
import 'package:swing_sheet/utilities/textStyles.dart';
import 'package:swing_sheet/viewWidgets/chooseProfileImageBottomSheet.dart';
import 'package:swing_sheet/views/registrationViews/registerConfirmationScreenView.dart';

class SignUpScreenView extends StatefulWidget {
  const SignUpScreenView({super.key});

  @override
  State<SignUpScreenView> createState() => _SignUpScreenViewState();
}

class _SignUpScreenViewState extends State<SignUpScreenView> {
  File? selectedImage;
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
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  InkWell(
                    onTap: () async {
                      final result = await showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12)),
                        ),
                        context: context,
                        builder: (context) {
                          return chooseProfileImagesBottomSheet(context);
                        },
                      );
                      if (result != null) {
                        chooseImage(type: result, context: context);
                      }
                    },
                    child: Container(
                      height: screenWidth * 0.35,
                      width: screenWidth * 0.35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: blackColor,
                          width: 1,
                        ),
                      ),
                      child: ClipOval(
                          child: selectedImage != null
                              ? Image.file(selectedImage!, fit: BoxFit.cover)
                              : Container(
                                  color: blackColor,
                                  child: Icon(
                                    CupertinoIcons.person_fill,
                                    size: screenWidth * 0.15,
                                    color: whiteColor,
                                  ),
                                )),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("First Name", style: textStyleBold(blackColor)),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  inputTextField(context, CupertinoIcons.person_fill,
                      "First Name...", _emailController),
                  SizedBox(height: screenHeight * 0.03),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Last Name", style: textStyleBold(blackColor)),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  inputTextField(context, CupertinoIcons.person_fill,
                      "Last Name...", _passwordController),
                  SizedBox(height: screenHeight * 0.03),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Email", style: textStyleBold(blackColor)),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  inputTextField(context, CupertinoIcons.mail_solid, "Email...",
                      _emailController),
                  SizedBox(height: screenHeight * 0.03),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:
                        Text("Contact No.", style: textStyleBold(blackColor)),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  inputTextField(context, CupertinoIcons.phone_fill,
                      "Contact No...", _passwordController),
                  SizedBox(height: screenHeight * 0.05),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RegisterConfirmationScreenView(),
                        ),
                      );
                    },
                    child: commonOutlinedButton(
                      context: context,
                      label: "Submit",
                      color: blackColor,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> chooseImage(
      {required String type, required BuildContext context}) async {
    final picker = ImagePicker();
    final pickedImage = type == "camera"
        ? await picker.pickImage(source: ImageSource.camera)
        : await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }
}
