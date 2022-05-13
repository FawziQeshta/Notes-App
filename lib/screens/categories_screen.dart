import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:notes/custom_widgets/category_item.dart';
import 'package:notes/custom_widgets/custom_appbar.dart';
import 'package:notes/screens/create_or_update_category_screen.dart';
import 'package:notes/screens/settings_screen.dart';

import '../utils/app_colors.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Categories',
            rightIconPath: 'assets/icons/settings.svg',
            action: (){Get.to(SettingsScreen());},),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return CategoryItem(title: 'Work', description: 'Notes for work...',);
          },
        itemCount: 5,
        padding: const EdgeInsets.only(top: 25),
      ),
      floatingActionButton:
       FloatingActionButton(
        onPressed: () => Get.to(CreateOrUpdateCategoryScreen()),
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}
