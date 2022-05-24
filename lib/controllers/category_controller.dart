import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/auth_controller.dart';
import 'package:notes/controllers/category_note_controller.dart';
import 'package:notes/models/category.dart';
import 'package:notes/utils/constants.dart';
import 'package:notes/utils/utilities.dart';

class CategoryController extends GetxController with StateMixin<List<dynamic>> {

  var db = FirebaseFirestore.instance;
  List<Category> data = [];

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    fetchData();
  }

  fetchData() async {
    data.clear();
    await db.collection(Constants.CATEGORIES_COLLECTION_KEY)
        .where(Constants.USER_ID_KEY, isEqualTo: AuthController.instance.auth.currentUser?.uid)
        .get().then((event) {
      for (var doc in event.docs) {
        data.add(Category.fromMap(doc.id, doc.data()));
      }
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });
  }

  addCategory({required Category category}) async {
    Utilities.showDialog('Category is being added...');

    Map<String, dynamic> categoryMap = {
      Constants.CATEGORY_TITLE_KEY : category.title,
      Constants.CATEGORY_DESC_KEY : category.description,
      Constants.USER_ID_KEY : AuthController.instance.auth.currentUser?.uid,
    };

    await db.collection(Constants.CATEGORIES_COLLECTION_KEY)
        .add(categoryMap).then((value) {
      print('category added');
      Utilities.closeDialog();
      Get.back();
    }).onError((error, stackTrace) {
      print('category failed: $error');
      Utilities.closeDialog();
    });
  }

  updateCategory({required Category category}) async {
    Utilities.showDialog('Category is being updated...');

    Map<String, dynamic> newMap = {
      Constants.CATEGORY_TITLE_KEY : category.title,
      Constants.CATEGORY_DESC_KEY : category.description
    };

    await db.collection(Constants.CATEGORIES_COLLECTION_KEY)
        .doc(category.id)
        .update(newMap).then((value) {
      print('category updated');
      Utilities.closeDialog();
      Get.back();
    }).onError((error, stackTrace) {
      print('category update failed: $error');
      Utilities.closeDialog();
    });
  }

  deleteCategory({required String categoryId}) async {
    await db.collection(Constants.CATEGORIES_COLLECTION_KEY)
        .doc(categoryId)
        .delete();

    CategoryNoteController.instance.deleteCategoryNoteWithCategoryId(categoryId: categoryId);
  }


}