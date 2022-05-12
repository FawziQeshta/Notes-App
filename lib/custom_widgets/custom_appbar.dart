import 'package:flutter/material.dart';
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
          Get.back();
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
}