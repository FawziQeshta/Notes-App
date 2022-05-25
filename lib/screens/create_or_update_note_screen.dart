import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/category_note_controller.dart';
import 'package:notes/custom_widgets/custom_appbar.dart';
import 'package:notes/models/category_note.dart';
import 'package:notes/utils/constants.dart';

import '../utils/app_colors.dart';

class CreateOrUpdateNoteScreen extends StatefulWidget {

  String categoryId;
  bool isUpdateNote;
  CategoryNote? noteUpdate;

  CreateOrUpdateNoteScreen(
      {Key? key, required this.isUpdateNote, required this.categoryId, required this.noteUpdate})
      : super(key: key);

  @override
  State<CreateOrUpdateNoteScreen> createState() => _CreateOrUpdateNoteScreenState();
}

class _CreateOrUpdateNoteScreenState extends State<CreateOrUpdateNoteScreen> {

  String titlePage = '';
  String descPage = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  CategoryNoteController controller = Get.find();

  var hintStyle =  const TextStyle(
      fontSize: 20.0,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w300,
      color: AppColors.hintColor
  );

  var textStyle =  const TextStyle(
      fontSize: 20.0,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      color: AppColors.black
  );

  @override
  void initState() {
    super.initState();
    if (widget.isUpdateNote) {
      titlePage = 'Edit Note';
      descPage = 'Update Note';
      titleController.text = widget.noteUpdate!.title;
      descController.text = widget.noteUpdate!.description;
    } else {
      titlePage = 'New Note';
      descPage = 'Create Note';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          title: '',
          rightIconPath: '',
          action: null),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text(
                titlePage,
                style: const TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600,
                  fontFamily:'Nunito',
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
               Text(
                descPage,
                style: const TextStyle(
                  color: AppColors.hintColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  fontFamily:'Roboto',
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Note Title',
                  hintStyle: hintStyle
                ),
                style: textStyle,
                controller: titleController,
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Description',
                    hintStyle: hintStyle
                ),
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
    widget.isUpdateNote ? controller
        .updateCategoryNote(note:
    CategoryNote.update(widget.noteUpdate!.id, titleController.text.trim(), descController.text.trim()))
        : controller.addCategoryNote(note:
        CategoryNote.addNew(titleController.text.trim(), descController.text.trim(),
              widget.categoryId, Constants.NOTE_WAITING_STATS));
  }

}
