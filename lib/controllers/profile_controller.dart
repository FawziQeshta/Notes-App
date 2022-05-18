import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:notes/utils/constants.dart';

class ProfileController extends GetxController with StateMixin<List<dynamic>> {

  var db = FirebaseFirestore.instance;
  List<int> countDocuments = [];

  @override
  void onInit() {
    super.onInit();
    getDocumentsCount();
  }

  getDocumentsCount() async {
    change(null, status: RxStatus.loading());

    QuerySnapshot categoriesCollection = await db.collection(Constants.CATEGORIES_COLLECTION_KEY).get();
    countDocuments.add(categoriesCollection.size);

    QuerySnapshot doneCollection = await db.collection(Constants.CATEGORY_NOTE_COLLECTION_KEY)
        .where(Constants.NOTE_STATUS_KEY, isEqualTo: Constants.NOTE_DONE_STATUS)
        .where(Constants.NOTE_IS_DELETED_KEY, isEqualTo: Constants.NOTE_NOT_DELETED)
        .get();

    countDocuments.add(doneCollection.size);

    QuerySnapshot waitingCollection = await db.collection(Constants.CATEGORY_NOTE_COLLECTION_KEY)
        .where(Constants.NOTE_STATUS_KEY, isEqualTo: Constants.NOTE_WAITING_STATS)
        .where(Constants.NOTE_IS_DELETED_KEY, isEqualTo: Constants.NOTE_NOT_DELETED)
        .get();

    countDocuments.add(waitingCollection.size);

    change(countDocuments, status: RxStatus.success());
  }

}