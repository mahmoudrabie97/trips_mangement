import 'package:drive_app/utilites/appcolors.dart';
import 'package:drive_app/utilites/extentionhelper.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

bool isEmailValid(String email) {
  final emailRegex = RegExp(r'^[\w-]+(.[\w-]+)*@([\w-]+.)+[a-zA-Z]{2,7}$');
  return emailRegex.hasMatch(email);
}

AppBar detailspageappbar(
    BuildContext context, Widget widget, bool ceneredtitle) {
  return AppBar(
    centerTitle: ceneredtitle,
    backgroundColor: Colors.white,
    elevation: 0,
    title: widget,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios),
      color: AppColor.mainColor,
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.all(20.0),
        child: Icon(IconlyLight.search, color: Colors.grey),
      )
    ],
  );
}
