import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swing_sheet/models/drawerModel.dart';

List<DrawerModel> getDrawerData() {
  List<DrawerModel> drawerData = [];
  DrawerModel drawerModel = new DrawerModel();

  drawerModel.icon = Icon(Icons.info);
  drawerModel.title = "About Us";
  drawerData.add(drawerModel);
  drawerModel = new DrawerModel();

  return drawerData;
}
