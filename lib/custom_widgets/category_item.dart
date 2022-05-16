import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:notes/models/category.dart';
import 'package:notes/screens/category_notes_screen.dart';
import 'package:notes/screens/create_or_update_note_screen.dart';

import '../utils/app_colors.dart';

class CategoryItem extends StatelessWidget {
  Category category;

  CategoryItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(CategoryNotesScreen(categoryId: category.id,)),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 3,
        margin: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(11.0),
              width: 48,
              height: 48,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: AppColors.blue,
                  shape: BoxShape.circle
              ),
              child: Text(
                category.title[0].toUpperCase(),
                style: const TextStyle(
                    fontSize: 22,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      category.title,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 13,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w500,
                          color: AppColors.titleCategory),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      category.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
            IconButton(
              onPressed: null,
              icon: SvgPicture.asset('assets/icons/delete.svg',),
            ),
            Container(
              width: 25,
              padding: const EdgeInsets.symmetric(vertical: 11),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0)),
              ),
              child: IconButton(
                onPressed: () => Get.to(const CreateOrUpdateNoteScreen()),
                icon: SvgPicture.asset('assets/icons/edit.svg',),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
