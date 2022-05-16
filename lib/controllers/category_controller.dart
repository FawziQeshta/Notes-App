import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:notes/models/category.dart';
import 'package:notes/utils/constants.dart';

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
    await db.collection(Constants.CATEGORIES_COLLECTION_KEY).get().then((event) {
      for (var doc in event.docs) {
        data.add(Category.fromMap(doc.id, doc.data()));
      }
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });
  }

}