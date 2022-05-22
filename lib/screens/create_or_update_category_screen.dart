import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/category_controller.dart';
import 'package:notes/custom_widgets/custom_appbar.dart';
import 'package:notes/models/category.dart';
import 'package:notes/utils/app_colors.dart';

class CreateOrUpdateCategoryScreen extends StatefulWidget {
  bool isUpdateCreate;
  Category? categoryUpdate;

  CreateOrUpdateCategoryScreen(
      {Key? key, required this.isUpdateCreate, required this.categoryUpdate})
      : super(key: key);

  @override
  State<CreateOrUpdateCategoryScreen> createState() =>
      _CreateOrUpdateCategoryScreenState();
}

class _CreateOrUpdateCategoryScreenState
    extends State<CreateOrUpdateCategoryScreen> {

  String titlePage = '';
  String descPage = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  CategoryController controller = Get.find();

  var hintStyle = const TextStyle(
      fontSize: 20.0,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w300,
      color: AppColors.hintColor);

  var textStyle = const TextStyle(
      fontSize: 20.0,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      color: AppColors.black);

  @override
  void initState() {
    super.initState();
    if (widget.isUpdateCreate) {
      titlePage = 'Edit Category';
      descPage = 'Update category';
      titleController.text = widget.categoryUpdate!.title;
      descController.text = widget.categoryUpdate!.description;
    } else {
      titlePage = 'New Category';
      descPage = 'Create category';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: '', rightIconPath: '', action: null),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                titlePage,
                style: const TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Nunito',
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                descPage,
                style: const TextStyle(
                  color: AppColors.hintColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Category Title', hintStyle: hintStyle),
                style: textStyle,
                controller: titleController,
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Short Description', hintStyle: hintStyle),
                style: textStyle,
                maxLines: null,
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                controller: descController,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                width: double.infinity,
                height: 53,
                decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(50)),
                child: MaterialButton(
                  onPressed: () => _saveButtonAction(),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  _saveButtonAction() {
    widget.isUpdateCreate ? controller
        .updateCategory(category:
    Category.update(widget.categoryUpdate!.id, titleController.text, descController.text))
        : controller.addCategory(category: Category.addNew(titleController.text, descController.text));
  }

}
