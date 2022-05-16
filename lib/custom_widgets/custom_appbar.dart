import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {

  String title;
  String rightIconPath;
  VoidCallback? action;

  CustomAppBar({Key? key, required this.title, required this.rightIconPath, required this.action}) : preferredSize = Size.fromHeight(60.0), super(key: key);

  @override
  final Size preferredSize;
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}
class _CustomAppBarState extends State<CustomAppBar>{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        widget.title,
        style: const TextStyle(
            fontSize: 22,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            color: AppColors.black),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
        onPressed: () {
          checkAction(widget.title);
        },
        color: AppColors.black,
      ),
      actions: [
        if(widget.rightIconPath.isNotEmpty)
          IconButton(
          icon: SvgPicture.asset(widget.rightIconPath),
          onPressed: widget.action,
          color: AppColors.black,
        )
      ],
    );
  }

  void checkAction(String title) {
    if(title == 'Categories') {
      showDialog();
    } else {
      Get.back();
    }
  }

  void showDialog() {
    Get.defaultDialog(
        title: "Back Alert!",
        middleText: "Are you sure to close the Notes App?",
        titleStyle: TextStyle(color: AppColors.black),
        middleTextStyle: TextStyle(color: AppColors.black),
        radius: 10,
        contentPadding: EdgeInsets.all(15),
        actions: [
          OutlinedButton(
            child: const Text("Yes"),
            onPressed: () => closeApp(),
          ),
          OutlinedButton(
            child: const Text("No"),
            onPressed: () => Get.back(),
          ),
        ],
    );
  }

  void closeApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }

}