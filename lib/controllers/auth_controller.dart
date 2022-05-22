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
import 'package:notes/utils/utilities.dart';

class AuthController extends GetxController with StateMixin<dynamic> {
  static AuthController instance = Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;

  void register(String firstName, String lastName, String email, String phone,
      String password) async {
    try {
      Utilities.showDialog('جاري انشاء الحساب، الرجاء الانتظار');

      if (firstName.isEmpty ||
          lastName.isEmpty ||
          email.isEmpty ||
          phone.isEmpty ||
          password.isEmpty) {
        Utilities.closeDialog();
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
      Utilities.closeDialog();
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
      Utilities.closeDialog();
      Get.offAll(() => const CategoriesScreen(), binding: CategoryBinding());
    });
  }

  void updateUserInCollection(String id, String firstName, String lastName,
      String email, String phone, String password) async {
    Map<String, dynamic> userMap = {
      'uid': auth.currentUser?.uid,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'password': password,
    };

    var collection =
        FirebaseFirestore.instance.collection(Constants.USERS_COLLECTION_KEY);
    await collection.doc(id).update(userMap).then((value) {
      Utilities.closeDialog();
      Get.offAll(() => const CategoriesScreen(), binding: CategoryBinding());
    });
  }

  void login(String email, String password) async {
    try {
      Utilities.showDialog('...جاري تسجيل الدخول');

      if (email.isEmpty || password.isEmpty) {
        Utilities.closeDialog();
        Get.snackbar(
            "Login Error!", "All fields are required Please fill in them");
        return;
      }

      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Utilities.closeDialog();
        Get.offAll(() => const CategoriesScreen(), binding: CategoryBinding());
      });
    } catch (e) {
      Utilities.closeDialog();
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

  void updateUserData(String id, String firstName, String lastName,
      String email, String phone, String password) async {
    try {
      Utilities.showDialog('جاري تعديل البيانات، الرجاء الانتظار');

      if (firstName.isEmpty ||
          lastName.isEmpty ||
          email.isEmpty ||
          phone.isEmpty) {
        Utilities.closeDialog();
        Get.snackbar(
            "Update Error!", "All fields are required Please fill in them");
        return;
      }

      EmailAuthProvider.credential(email: "${auth.currentUser?.email}", password: password);
      GoogleAuthProvider.credential(idToken: '', accessToken: '');

      await auth.currentUser?.updateEmail(email).then((value) {
        updateUserInCollection(id, firstName, lastName, email, phone, password);
      });

    } catch (e) {
      Utilities.closeDialog();
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Account update failed",
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
    await FirebaseFirestore.instance
        .collection(Constants.USERS_COLLECTION_KEY)
        .where('uid', isEqualTo: auth.currentUser!.uid)
        .get()
        .then((event) {
      change(UserNote.empty().fromMap(event.docs[0].id, event.docs[0].data()),
          status: RxStatus.success());
    });
  }

}
