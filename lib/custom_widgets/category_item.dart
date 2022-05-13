import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:notes/screens/category_notes_screen.dart';
import 'package:notes/screens/create_or_update_note_screen.dart';

import '../utils/app_colors.dart';

class CategoryItem extends StatelessWidget {
  String title;
  String description;

  CategoryItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(CategoryNotesScreen()),
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
              child: const Text(
                'W',
                style: TextStyle(
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
                      title,
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
                      description,
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
              padding: EdgeInsets.symmetric(vertical: 11),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0)),
              ),
              child: IconButton(
                onPressed: () => Get.to(CreateOrUpdateNoteScreen()),
                icon: SvgPicture.asset('assets/icons/edit.svg',),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
