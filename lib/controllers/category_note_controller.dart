import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/auth_controller.dart';
import 'package:notes/models/category_note.dart';
import 'package:notes/utils/constants.dart';
import 'package:notes/utils/utilities.dart';

class CategoryNoteController extends GetxController with StateMixin<List<dynamic>> {

  static CategoryNoteController instance = Get.find();
  var db = FirebaseFirestore.instance;
  List<CategoryNote> data = [];

  fetchData({required String categoryId}) async {
    change(null, status: RxStatus.loading());
    data.clear();

    await db.collection(Constants.CATEGORY_NOTE_COLLECTION_KEY)
        .where(Constants.USER_ID_KEY, isEqualTo: AuthController.instance.auth.currentUser?.uid)
        .where(Constants.NOTE_CAT_ID_KEY, isEqualTo: categoryId)
        .where(Constants.NOTE_STATUS_KEY, isEqualTo: Constants.NOTE_WAITING_STATS)
        .where(Constants.NOTE_IS_DELETED_KEY, isEqualTo: Constants.NOTE_NOT_DELETED)
        .get().then((event) {
      for (var doc in event.docs) {
        data.add(CategoryNote.fromMap(doc.id, doc.data()));
      }
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });
  }

  addCategoryNote({required CategoryNote note}) async {
    Map<String, dynamic> noteMap = {
      Constants.USER_ID_KEY : AuthController.instance.auth.currentUser?.uid,
      Constants.NOTE_TITLE_KEY : note.title,
      Constants.NOTE_DESC_KEY : note.description,
      Constants.NOTE_STATUS_KEY : note.status,
      Constants.NOTE_IS_DELETED_KEY : note.isDeleted,
      Constants.NOTE_CAT_ID_KEY : note.categoryId,
    };

    await db.collection(Constants.CATEGORY_NOTE_COLLECTION_KEY)
        .add(noteMap).then((value) {
      print('note added');
      Utilities.closeDialog();
      Get.back();
    }).onError((error, stackTrace) {
      print('note add failed: $error');
      Utilities.closeDialog();
    });
  }

  changeStatusNote({required CategoryNote note}) async {
    Map<String, dynamic> newMap = {
      Constants.USER_ID_KEY : AuthController.instance.auth.currentUser?.uid,
      Constants.NOTE_TITLE_KEY : note.title,
      Constants.NOTE_DESC_KEY : note.description,
      Constants.NOTE_STATUS_KEY : Constants.NOTE_DONE_STATUS,
      Constants.NOTE_IS_DELETED_KEY : note.isDeleted,
      Constants.NOTE_CAT_ID_KEY : note.categoryId,
    };

    await db.collection(Constants.CATEGORY_NOTE_COLLECTION_KEY)
        .doc(note.id)
        .set(newMap);
  }

  softDeleteNote({required CategoryNote note}) async {
    Map<String, dynamic> newMap = {
      Constants.NOTE_TITLE_KEY : note.title,
      Constants.NOTE_DESC_KEY : note.description,
      Constants.NOTE_STATUS_KEY : note.status,
      Constants.NOTE_IS_DELETED_KEY : Constants.NOTE_DELETED,
      Constants.NOTE_CAT_ID_KEY : note.categoryId,
    };

    await db.collection(Constants.CATEGORY_NOTE_COLLECTION_KEY)
        .doc(note.id)
        .set(newMap);
  }

  updateCategoryNote({required CategoryNote note}) async {
    Map<String, dynamic> newMap = {
      Constants.NOTE_TITLE_KEY : note.title,
      Constants.NOTE_DESC_KEY : note.description
    };

    await db.collection(Constants.CATEGORY_NOTE_COLLECTION_KEY)
        .doc(note.id)
        .update(newMap).then((value) {
      print('note updated');
      Utilities.closeDialog();
      Get.back();
    }).onError((error, stackTrace) {
      print('note update failed: $error');
      Utilities.closeDialog();
    });
  }

  deleteCategoryNoteWithCategoryId({required String categoryId}) async {
    QuerySnapshot querySnapshot = await db.collection(Constants.CATEGORY_NOTE_COLLECTION_KEY)
        .where(Constants.NOTE_CAT_ID_KEY, isEqualTo: categoryId)
        .get();

    for (var doc in querySnapshot.docs) {
      await doc.reference.delete();
    }
  }

}