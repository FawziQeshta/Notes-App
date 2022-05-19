import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/bindings/category_binding.dart';
import 'package:notes/models/user_note.dart';
import 'package:notes/screens/categories_screen.dart';
import 'package:notes/screens/login_screen.dart';
import 'package:notes/utils/constants.dart';

class AuthController extends GetxController with StateMixin<dynamic> {
  static AuthController instance = Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;

  void register(String firstName, String lastName, String email, String phone,
      String password) async {
    try {
      _showDialog('جاري انشاء الحساب، الرجاء الانتظار');

      if (firstName.isEmpty ||
          lastName.isEmpty ||
          email.isEmpty ||
          phone.isEmpty ||
          password.isEmpty) {
        _closeDialog();
        Get.snackbar(
            "Register Error!", "All fields are required Please fill in them");
        return;
      }

      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        saveUserInCollection(firstName, lastName, email, phone, password);
      });
    } catch (e) {
      _closeDialog();
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Account creation failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: const TextStyle(color: Colors.white)));
    }
  }

  void saveUserInCollection(String firstName, String lastName, String email,
      String phone, String password) async {
    Map<String, dynamic> userMap = {
      'uid': auth.currentUser?.uid,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'password': password,
    };

    await FirebaseFirestore.instance
        .collection(Constants.USERS_COLLECTION_KEY)
        .add(userMap)
        .then((DocumentReference doc) {
      _closeDialog();
      Get.offAll(() => const CategoriesScreen());
    });
  }

  void login(String email, String password) async {
    try {
      _showDialog('...جاري تسجيل الدخول');

      if (email.isEmpty || password.isEmpty) {
        _closeDialog();
        Get.snackbar(
            "Login Error!", "All fields are required Please fill in them");
        return;
      }

      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        _closeDialog();
        Get.offAll(() => const CategoriesScreen(), binding: CategoryBinding());
      });
    } catch (e) {
      _closeDialog();
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Login failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: const TextStyle(color: Colors.white)));
    }
  }

  void logOut() async {
    await auth.signOut();
    Get.offAll(() => const LoginScreen());
  }

  void checkCurrentUser() async {
    if (auth.currentUser == null) {
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(() => const CategoriesScreen(), binding: CategoryBinding());
    }
  }

  getUserData() async {
    await FirebaseFirestore.instance.collection(Constants.USERS_COLLECTION_KEY)
          .where('uid', isEqualTo: auth.currentUser!.uid)
        .get().then((event) {
      change(UserNote.empty().fromMap(event.docs[0].data()), status: RxStatus.success());
    });
  }

  void _showDialog(String text) {
    Get.defaultDialog(
        title: '',
        barrierDismissible: false,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: CupertinoActivityIndicator(radius: 30),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Quicksand',
              ),
            )
          ],
        ),
        radius: 10.0);
  }

  void _closeDialog() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
