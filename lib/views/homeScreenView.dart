import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swing_sheet/models/homeContainerModel.dart';
import 'package:swing_sheet/models/homeContainerModelData.dart';
import 'package:swing_sheet/utilities/appColors.dart';
import 'package:swing_sheet/utilities/textStyles.dart';
import 'package:swing_sheet/views/dashBoard/dashBoardNavigationBar.dart';

class HomeScreenView extends StatefulWidget {
  final bool isInstructor;
  const HomeScreenView({super.key, required this.isInstructor});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  late List<HomeContainerModel> homeContainerModelData;

  @override
  void initState() {
    super.initState();
    homeContainerModelData = widget.isInstructor
        ? getInstructorHomeContainerModelData(context)
        : getStudentHomeContainerModelData(context);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: whiteColor,
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
            icon: Icon(
              CupertinoIcons.profile_circled,
              color: blackColor,
              size: screenWidth * 0.07,
            ),
          )
        ],
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8),
              ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: homeContainerModelData.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DashBoardNavigationBar(),
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            height: 148,
                            width: screenWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: blackColor,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                homeContainerModelData[index].imagePath!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 16,
                            right: 16,
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: blackColor.withOpacity(0.7),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  homeContainerModelData[index].title!,
                                  style: textStyleH3(whiteColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: textStyleBold(redColor),
                    children: [
                      TextSpan(text: "Ryan J Reese | "),
                      TextSpan(
                        text: "ryan.reese@factivetech.com",
                        style: textStyleBold(blackColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
