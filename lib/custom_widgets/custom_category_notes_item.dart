import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';

class CustomCategoryNotesItem extends StatefulWidget {
  String title;
  String description;
  bool isSelectionMode;
  bool isSelected;

  CustomCategoryNotesItem({
    required this.title, required this.description
      , required this.isSelectionMode, required this.isSelected});

  @override
  State<CustomCategoryNotesItem> createState() => _CustomCategoryNotesItemState();
}

class _CustomCategoryNotesItemState extends State<CustomCategoryNotesItem> {

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 3,
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 4,
              margin: const EdgeInsets.only(right: 16),
              decoration: const BoxDecoration(
                color: AppColors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0)),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 17, bottom: 17),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.title,
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
                        widget.description,
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
            _buildSelectIcon(widget.isSelected),
            Container(
              width: 4,
              decoration: const BoxDecoration(
                color: AppColors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0)),
          ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectIcon(bool isSelected) {
    if (widget.isSelectionMode) {
      return IconButton(
          onPressed: null,
          icon: isSelected ? SvgPicture.asset('assets/icons/check_active.svg',)
              : SvgPicture.asset('assets/icons/check_inactive.svg',)
      );
    } else {
      return const SizedBox(width: 16,);
    }
  }

}
