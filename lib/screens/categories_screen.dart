import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:notes/bindings/profile_binding.dart';
import 'package:notes/controllers/category_controller.dart';
import 'package:notes/custom_widgets/category_item.dart';
import 'package:notes/custom_widgets/custom_appbar.dart';
import 'package:notes/screens/create_or_update_category_screen.dart';
import 'package:notes/screens/settings_screen.dart';

import '../models/category.dart';
import '../utils/app_colors.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  CategoryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Categories',
            rightIconPath: 'assets/icons/settings.svg',
            action: () => Get.to(const SettingsScreen(), binding: ProfileBinding()),),
      body: RefreshIndicator(
        onRefresh: () => controller.fetchData(),
        child: controller.obx((data) {
          var list = data as List<Category>;
          return ListView.builder(
              itemBuilder: (context, index) {
            return CategoryItem(category: list[index]);
          },
          itemCount: list.length,
          padding: const EdgeInsets.only(top: 25));
        },
          onLoading: const Center(child: CircularProgressIndicator()),
          onError: (e) => Center(child: Text(e!)),
        ),
      ),
      floatingActionButton:
       FloatingActionButton(
        onPressed: () => Get.to(const CreateOrUpdateCategoryScreen()),
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}
