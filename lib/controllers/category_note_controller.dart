import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:notes/models/category_note.dart';
import 'package:notes/utils/constants.dart';

class CategoryNoteController extends GetxController with StateMixin<List<dynamic>> {

  var db = FirebaseFirestore.instance;
  List<CategoryNote> data = [];

  fetchData({required String categoryId}) async {
    change(null, status: RxStatus.loading());
    data.clear();

    await db.collection(Constants.CATEGORY_NOTE_COLLECTION_KEY)
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

  changeStatusNote({required CategoryNote note}) async {
    Map<String, dynamic> newMap = {
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

  deleteNote({required CategoryNote note}) async {
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

}