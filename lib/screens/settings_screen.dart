import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:notes/screens/profile_screen.dart';

import '../custom_widgets/custom_appbar.dart';
import '../utils/app_colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Settings',
        rightIconPath: '',
        action: null,),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height-86),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 11.0, right: 11.0, bottom: 8, top: 11.0),
                width: 70,
                height: 70,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: AppColors.blue,
                    shape: BoxShape.circle
                ),
                child: const Text(
                  'F',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Helvetica Neue',
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              const Text(
                'Fawzi Qeshta',
                maxLines: 1,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w500,
                    color: AppColors.titleCategory),
                textAlign: TextAlign.start,
              ),
              const Text(
                'fawzi.qeshta@gmail.com',
                maxLines: 1,
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGray),
                textAlign: TextAlign.start,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 45, right: 45, bottom: 25),
                child: Divider(
                  color: AppColors.line,
                  height: 2.5,
                  thickness: 1,
                  // indent: 50,
                  endIndent: 0,
                ),
              ),

              buildSettingItem('assets/icons/language.svg',
                  'Language', 'Selected language: EN',
                  null, false),

              buildSettingItem('assets/icons/identity.svg',
                  'Profile', 'Update your data…',
                  (){Get.to(ProfileScreen());}, true),

              buildSettingItem('assets/icons/device_information.svg',
                  'About App', 'What is notes app?',
                  null, false),

              buildSettingItem('assets/icons/info.svg',
                  'About course', 'Describe the course in brief',
                  null, true),

              buildSettingItem('assets/icons/power.svg',
                  'Logout', 'Waiting your return…',
                  null, false),

              const Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildSettingItem(String iconPath, String title, String hint, VoidCallback? action, bool isRightBlue) {
    return GestureDetector(
      onTap: action,
      child: IntrinsicHeight(
        child: Card(
          elevation: 3,
          margin: const EdgeInsets.only(bottom: 10, left: 18, right: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildBlueRightPart(isRightBlue),
                Container(
                  margin: const EdgeInsets.all(11.0),
                  width: 48,
                  height: 48,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: AppColors.blue,
                      shape: BoxShape.circle
                  ),
                  child: SvgPicture.asset(iconPath,),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 17, bottom: 17),
                    child: Column(
                      children:  [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            title,
                            style: const TextStyle(
                                fontSize: 13,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w500,
                                color: AppColors.titleCategory),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        const SizedBox(height: 4,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            hint,
                            style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w500,
                                color: AppColors.lightGray),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SvgPicture.asset('assets/icons/arrow_right.svg',),
              const SizedBox(width: 6,),
              buildBlueLeftPart(isRightBlue),
            ],
          ),
        ),
      ),
    );
  }

  buildBlueRightPart(bool isRightBlue) {
    if(!isRightBlue)
      return Container(
        width: 4,
        decoration: const BoxDecoration(
          color: AppColors.blue,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.0),
              bottomLeft: Radius.circular(5.0)),
        ),
      );
    else
      return SizedBox(
        width: 4,
      );
  }

  buildBlueLeftPart(bool isRightBlue) {
    if(isRightBlue)
      return Container(
        width: 4,
        decoration: const BoxDecoration(
          color: AppColors.blue,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0)),
        ),
      );
    else
      return SizedBox(
        width: 4,
      );
  }

}
