import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {

  String title;
  IconData icon;
  VoidCallback? onPressed;

  CustomButton({Key? key, required this.title, required this.icon, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: onPressed,
      label: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 17, fontFamily: 'Roboto', fontWeight: FontWeight.w500, color: Colors.white)),
      style: ElevatedButton.styleFrom(
        primary: AppColors.blue,
        fixedSize: const Size(208, 43),
      ),
    );
  }
}
