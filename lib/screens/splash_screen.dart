import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/screens/categories_screen.dart';
import 'package:notes/screens/login_screen.dart';
import 'package:notes/utils/app_colors.dart';
import 'package:notes/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 3000), () {
      Get.offAndToNamed(Routes.CATEGORIES_SCREEN);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 120,
                      height: 120,
                    ),
                    const Text(
                      'My Notes',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Nunito',
                          color: AppColors.black),
                    ),
                    const Text(
                      'For Organized Life',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300,
                          color: AppColors.darkGray),
                    ),
                  ],
                ),
                // positioned
              ],
            ),
          ),
          const Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Text(
                'IUG - Notes App',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300,
                    color: AppColors.darkGray),
                textAlign: TextAlign.center,
              ),
          ),
        ],
      ),
    );
  }
}
