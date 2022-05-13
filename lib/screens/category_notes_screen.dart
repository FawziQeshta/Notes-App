import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:notes/custom_widgets/custom_appbar.dart';
import 'package:notes/custom_widgets/custom_category_notes_item.dart';
import 'package:notes/screens/create_or_update_note_screen.dart';

import '../utils/app_colors.dart';
import 'settings_screen.dart';

class CategoryNotesScreen extends StatefulWidget {
  const CategoryNotesScreen({Key? key}) : super(key: key);

  @override
  State<CategoryNotesScreen> createState() => _CategoryNotesScreenState();
}

class _CategoryNotesScreenState extends State<CategoryNotesScreen> {
  Map<int, bool> selectedFlag = {};
  bool isSelectionMode = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
              title: 'Category Name',
              rightIconPath: 'assets/icons/add.svg',
              action: ()=>Get.to(CreateOrUpdateNoteScreen())),
          body: ListView.builder(
            itemBuilder: (context, index) {
              selectedFlag[index] = selectedFlag[index] ?? false;
              bool isSelected = selectedFlag[index]!;

              return GestureDetector(
                onLongPress: () => onLongPress(isSelected, index),
                onTap: () => onTap(isSelected, index),
                child: CustomCategoryNotesItem(
                    title: 'Note Title',
                    description:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry, Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    isSelectionMode: isSelectionMode,
                    isSelected: isSelected),
              );
            },
            itemCount: 5,
            padding: const EdgeInsets.only(top: 25),
          )),
    );
  }

  void onLongPress(bool isSelected, int index) {
    setState(() {
      selectedFlag[index] = !isSelected;
      isSelectionMode = selectedFlag.containsValue(true);
    });
  }

  void onTap(bool isSelected, int index) {
    if (isSelectionMode) {
      setState(() {
        selectedFlag[index] = !isSelected;
        isSelectionMode = selectedFlag.containsValue(true);
      });
    } else {
      // Open Detail Page
    }
  }

  Future<bool> _onBackPressed() async {
    if(selectedFlag.containsValue(true)) {
        setState(() {
          isSelectionMode = false;
          selectedFlag.clear();
        });
      return false;
    } else {
      return true;
    }
  }

}
