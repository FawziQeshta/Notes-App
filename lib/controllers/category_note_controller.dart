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
        .where('category_id', isEqualTo: categoryId)
        .get().then((event) {
      for (var doc in event.docs) {
        data.add(CategoryNote.fromMap(doc.id, doc.data()));
      }
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });
  }

}