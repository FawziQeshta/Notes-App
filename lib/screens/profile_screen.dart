import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/profile_controller.dart';
import 'package:notes/custom_widgets/custom_appbar.dart';

import '../utils/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Profile', rightIconPath: '', action: null),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      width: 55,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: AppColors.blue, shape: BoxShape.circle),
                      child: const Text(
                        'F',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Helvetica Neue',
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
                              'Fawzi Qeshta',
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
                              'fawzi.qeshta@gmail.com',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
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
                  ],
                ),
              ),
              controller.obx((data) {
                var documentsCount = data as List<int>;
                return Row(
                  children: [
                    buildBoxNumbers('Categories', documentsCount[0]),
                    const SizedBox(
                      width: 20,
                    ),
                    buildBoxNumbers('Done Notes', documentsCount[1]),
                    const SizedBox(
                      width: 20,
                    ),
                    buildBoxNumbers('Waiting Notes', documentsCount[2]),
                  ],
                );
              },
                  onLoading: const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 3,))),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 3,
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 20.0, top: 5),
                  child: Column(
                    children: [
                      buildTextField(
                          hint: "First Name",
                          txtController: null,
                          keyboardType: TextInputType.text),
                      const SizedBox(
                        height: 6,
                      ),
                      buildTextField(
                          hint: "Last Name",
                          txtController: null,
                          keyboardType: TextInputType.text),
                      const SizedBox(
                        height: 6,
                      ),
                      buildTextField(
                          hint: "Phone",
                          txtController: null,
                          keyboardType: TextInputType.phone),
                      const SizedBox(
                        height: 6,
                      ),
                      buildTextField(
                          hint: "Email",
                          txtController: null,
                          keyboardType: TextInputType.emailAddress),
                    ],
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(
                    width: double.infinity, height: 46),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Save',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildBoxNumbers(String title, int number) {
    return Expanded(
      flex: 1,
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.blue, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 5),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: AppColors.blue),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '$number',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGray),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildTextField(
      {required String hint,
      TextEditingController? txtController,
      required TextInputType keyboardType}) {
    return TextField(
        cursorColor: AppColors.darkGray,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
              fontSize: 12,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              color: AppColors.lightGray),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.line),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.line),
          ),
        ),
        style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            color: AppColors.titleCategory),
        controller: txtController,
        keyboardType: keyboardType,
        textInputAction: TextInputAction.next);
  }
}
