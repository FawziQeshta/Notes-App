import 'package:flutter/material.dart';

import '../custom_widgets/custom_appbar.dart';
import '../utils/app_colors.dart';

class AboutCourseScreen extends StatelessWidget {
  const AboutCourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'About Course',
        rightIconPath: '',
        action: null,),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                color: AppColors.black),
          ),
        ),
      ),
    );
  }
}

