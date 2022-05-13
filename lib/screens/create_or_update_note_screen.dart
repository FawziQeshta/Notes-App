import 'package:flutter/material.dart';
import 'package:notes/custom_widgets/custom_appbar.dart';

import '../utils/app_colors.dart';

class CreateOrUpdateNoteScreen extends StatefulWidget {
  const CreateOrUpdateNoteScreen({Key? key}) : super(key: key);

  @override
  State<CreateOrUpdateNoteScreen> createState() => _CreateOrUpdateNoteScreenState();
}

class _CreateOrUpdateNoteScreenState extends State<CreateOrUpdateNoteScreen> {

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          title: '',
          rightIconPath: '',
          action: null),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'New Note',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w600,
                fontFamily:'Nunito',
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Create note',
              style: TextStyle(
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
                onPressed: () {},
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


    );
  }
}
