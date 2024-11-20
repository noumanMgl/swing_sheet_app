import 'package:flutter/material.dart';
import 'package:swing_sheet/models/bottomNavigationModel.dart';
import 'package:swing_sheet/models/bottomNavigationModelData.dart';
import 'package:swing_sheet/utilities/appColors.dart';
import 'package:swing_sheet/utilities/textStyles.dart';

class DashBoardNavigationBar extends StatefulWidget {
  const DashBoardNavigationBar({super.key});

  @override
  State<DashBoardNavigationBar> createState() => _DashBoardNavigationBarState();
}

class _DashBoardNavigationBarState extends State<DashBoardNavigationBar> {
  List<BottomNavigationModel> _bottomNavigationModelData = [];
  int selectedIndex = 0;
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    _bottomNavigationModelData = getBottomNavigationModelData(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectedIndex != 0) {
          setState(() {
            selectedIndex = 0;
          });
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Center(
          child: _bottomNavigationModelData[selectedIndex].launchPage,
        ),
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.hardEdge,
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                ...List.generate(_bottomNavigationModelData.length, (index) {
                  BottomNavigationModel modelData =
                      _bottomNavigationModelData[index];
                  return Expanded(
                      child: GestureDetector(
                    onTap: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        selectedIndex == index
                            ? Icon(modelData.icon, size: 26, color: blackColor)
                            : Icon(modelData.alternateIcon,
                                size: 24, color: blackColor.withOpacity(.4)),
                        Text(modelData.title!,
                            style: textStyleBold(selectedIndex == index
                                ? blackColor
                                : blackColor.withOpacity(.4)))
                      ],
                    ),
                  ));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
