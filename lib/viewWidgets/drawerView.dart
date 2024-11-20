import 'package:flutter/material.dart';
import 'package:swing_sheet/utilities/appColors.dart';
import 'package:swing_sheet/utilities/textStyles.dart';

Widget drawerView(BuildContext context, newDrawerData) {
  return Drawer(
    backgroundColor: whiteColor,
    shape: Border.all(style: BorderStyle.none),
    child: Column(
      children: [
        Container(
          color: redColor.withOpacity(.4),
          height: MediaQuery.of(context).size.height * 0.2,
          width: double.infinity,
          child: Center(
            child: Image.asset(
              "assets/images/appBanner.png",
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
        ),
        const Divider(
          height: 1,
          color: Colors.grey,
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: newDrawerData.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {},
                leading: newDrawerData[index].icon,
                iconColor: Colors.black,
                title: Text(
                  newDrawerData[index].title,
                  style: textStyleBold(blackColor),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
