import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Categories',
          style: TextStyle(
              fontSize: 22,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              color: AppColors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
          onPressed: () {
            Get.back();
          },
          color: AppColors.black,
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/settings.svg'),
            onPressed: () {},
            color: AppColors.black,
          )
        ],
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
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
                        children: const [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Work',
                              style: TextStyle(
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
                              'Notes for work...',
                              style: TextStyle(
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
                      icon: SvgPicture.asset('assets/icons/delete.svg',
                        width: 16, height: 16, fit: BoxFit.cover,),
                    ),
                    Container(
                      margin: const EdgeInsets.all(0.0),
                      width: 28,
                      height: 100,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: AppColors.blue,
                          shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0)),
                      ),
                      child: IconButton(
                        onPressed: null,
                        icon: SvgPicture.asset('assets/icons/edit.svg',
                              width: 16, height: 16, fit: BoxFit.cover,),
                      ),
                    ),
                  ],
                ),
            );
          },
        itemCount: 5,
      ),
    );
  }
}
